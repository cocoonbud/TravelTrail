import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class MarkdownDisplay extends StatefulWidget {
  final String dataURLStr;
  final titleStr;

  const MarkdownDisplay({Key? key, required this.dataURLStr, this.titleStr})
      : super(key: key);

  @override
  _MarkdownDisplayState createState() => _MarkdownDisplayState();
}

class _MarkdownDisplayState extends State<MarkdownDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.titleStr), centerTitle: true),
      body: FlutterMarkdown(dataURLStr: widget.dataURLStr),
    );
  }
}

class FlutterMarkdown extends StatelessWidget {
  final dataURLStr;

  const FlutterMarkdown({Key? key, required this.dataURLStr}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: rootBundle.loadString(dataURLStr),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Markdown(data: snapshot.data);
          } else {
            return Center(
              child: Text("loading..."),
            );
          }
        },
      ),
    );
  }
}
