flutter 默认是单线程任务处理的，如果不开启新的线程，任务默认在主线程中处理。

#### 事件队列

Dart 线程中也有**事件循环**和**消息队列**概念，叫 isolate。

![img](https://tva1.sinaimg.cn/large/008i3skNly1gwjemcbiasj30e40ee0t0.jpg)
<!-- <>()<img src="https://tva1.sinaimg.cn/large/008i3skNly1gwjemcbiasj30e40ee0t0.jpg" alt="img" style="zoom: 67%;" /> -->

每个 isolate 包含：

1. event loop
2. event queue 负责处理 I/O 事件、绘制事件、手势事件、接收其他 isolate 消息等外部事件。
3. microtask queue 事件队列。可以自己向 isolate 内部添加事件，**事件的优先级比 event queue 高**。

event 和 microtask 队列有点类似 iOS 的 source0 和 source1。

当isolate开始执行后，会先处理 microtask 的事件，当 microtask 队列中没有事件后，才会处理 event 队列中的事件，按照这个顺序反复执行。

注意：当执行 microtask 事件时，会阻塞 event 队列的事件执行。会导致渲染、手势响应等 event 事件响应延时。**为了保证渲染和手势响应，应该尽量将耗时操作放在 event 队列中**。

#### async、await

async、await、Future，其中 async 和 await 需要一起使用。

这个语法是 js 的 ES7 标准中推出的，Dart 的设计和 js 相同。

#### Future

Future 就是延时操作的一个封装，可以将异步任务封装为 Future 对象。

```dart
loadData() {
    // DateTime.now()，获取当前时间
    DateTime now = DateTime.now();
    print('request begin $now');
    Future.delayed(Duration(seconds: 1), (){
      now = DateTime.now();
      print('request response $now');
    });
}
```

#### 协程

在程序执行过程中，离开当前的调用位置有两种方式，继续调用其他函数和 return 返回离开当前函数。但是执行return 时，当前函数在调用栈中的局部变量、形参等状态则会被销毁。

协程分为无线协程和有线协程。

1. 无线协程在离开当前调用位置时，会将当前变量放在堆区，当再次回到当前位置时，还会继续从堆区中获取到变量。所以，一般在执行当前函数时就会将变量直接分配到堆区，而 async、await 就属于无线协程的一种。
2. 有线协程则会将变量继续保存在栈区，在回到指针指向的离开位置时，会继续从栈中取出调用。





























































































