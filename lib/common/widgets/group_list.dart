import 'package:flutter/material.dart';

enum IndexPathType {
  overallHeader,
  overallFooter,
  sectionHeader,
  sectionFooter,
  sectionSeparator,
  row,
  separator,
  placeholder,
}

class IndexPath {
  final int section;
  final int row;
  final IndexPathType type;
  IndexPath({required this.section, required this.row, required this.type});
}

typedef SectionSeparator = Widget Function(int section);

typedef SeparatorAtIndexPath = Widget Function(IndexPath indexPath);

typedef HeaderInSection = Widget Function(int section);

typedef FooterInSection = Widget Function(int section);

typedef CellForRowAtIndexPath = Widget Function(IndexPath indexPath);

typedef NumberOfRowsInSection = int Function(int section);

class ListViewGroupHandler extends StatefulWidget {
  final int numberOfSections;

  final NumberOfRowsInSection? numberOfRowsInSection;

  final CellForRowAtIndexPath? cellForRowAtIndexPath;

  final SeparatorAtIndexPath? separatorAtIndexPath;

  final SectionSeparator? sectionSeparator;

  final HeaderInSection? headerInSection;

  final FooterInSection? footerInSection;

  final Widget Function()? overallHeader;

  final Widget Function()? overallFooter;

  final Widget Function()? placeholderView;

  ListViewGroupHandler(
      {Key? key,
      this.numberOfSections = 1,
      required this.numberOfRowsInSection,
      required this.cellForRowAtIndexPath,
      this.separatorAtIndexPath,
      this.sectionSeparator,
      this.headerInSection,
      this.footerInSection,
      this.overallHeader,
      this.overallFooter,
      this.placeholderView})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _ListViewGroupHandlerState();
}

class _ListViewGroupHandlerState extends State<ListViewGroupHandler> {
  late List<IndexPath> _indexToIndexPathList;

  @override
  void initState() {
    _indexToIndexPathList = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _calIndexPath();

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (content, index) => GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {},
          child: _itemBuilder(index),
        ),
        childCount: _indexToIndexPathList.length,
      ),
    );
  }

  void _calIndexPath() {
    _indexToIndexPathList = [];
    IndexPath indexPath;

    // 先加入 overallHeader
    if (widget.overallHeader != null) {
      indexPath =
          IndexPath(section: 0, row: 0, type: IndexPathType.overallHeader);
      _indexToIndexPathList.add(indexPath);
    }

    int sectionCount = widget.numberOfSections;

    int rows = 0;

    for (int i = 0; i < sectionCount; i++) {
      if (widget.headerInSection != null) {
        indexPath =
            IndexPath(section: i, row: 0, type: IndexPathType.sectionHeader);
        _indexToIndexPathList.add(indexPath);
      }

      rows = widget.numberOfRowsInSection!(i);

      for (int j = 0; j < rows; j++) {
        //Add item
        indexPath = IndexPath(section: i, row: j, type: IndexPathType.row);
        _indexToIndexPathList.add(indexPath);

        //Add separator
        if (widget.separatorAtIndexPath != null) {
          indexPath =
              IndexPath(section: i, row: j, type: IndexPathType.separator);
          _indexToIndexPathList.add(indexPath);
        }
      }

      if (widget.footerInSection != null) {
        indexPath =
            IndexPath(section: i, row: 0, type: IndexPathType.sectionFooter);
        _indexToIndexPathList.add(indexPath);
      }

      //Add section separator
      if (widget.sectionSeparator != null) {
        indexPath =
            IndexPath(section: i, row: 0, type: IndexPathType.sectionSeparator);
        _indexToIndexPathList.add(indexPath);
      }
    }

    if (widget.overallFooter != null) {
      indexPath =
          IndexPath(section: 0, row: 0, type: IndexPathType.overallFooter);
      _indexToIndexPathList.add(indexPath);
    }
  }

  Widget _itemBuilder(int index) {
    final IndexPath item = _indexToIndexPathList[index];

    switch (item.type) {
      case IndexPathType.overallHeader:
        return widget.overallHeader!();
      case IndexPathType.overallFooter:
        return widget.overallFooter!();
      case IndexPathType.sectionHeader:
        return widget.headerInSection!(item.section);
      case IndexPathType.sectionFooter:
        return widget.footerInSection!(item.section);
      case IndexPathType.sectionSeparator:
        return widget.sectionSeparator!(item.section);
      case IndexPathType.row:
        return widget.cellForRowAtIndexPath!(item);
      case IndexPathType.separator:
        return widget.separatorAtIndexPath!(item);
      case IndexPathType.placeholder:
        return widget.placeholderView!();
      default:
        break;
    }
    return Text('noting');
  }
}
