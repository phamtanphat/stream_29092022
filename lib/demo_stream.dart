import 'package:flutter/material.dart';

class DemoStreamPage extends StatefulWidget {
  const DemoStreamPage({Key? key}) : super(key: key);

  @override
  State<DemoStreamPage> createState() => _DemoStreamPageState();
}

class _DemoStreamPageState extends State<DemoStreamPage> {

  @override
  void didUpdateWidget(covariant DemoStreamPage oldWidget) {
    super.didUpdateWidget(oldWidget);

    // 1: Single Subscription

    // Khởi tao stream thông qua future
    // Future<String> future = Future.delayed(Duration(seconds: 1), () => "Hello");
    // Stream<String> textStream = Stream.fromFuture(future);
    //
    // textStream.listen((event) {
    //   print(event);
    // });

    // Khởi tạo stream thông qua iterable
    // Iterable<int> iterable = Iterable.generate(10,(index) {
    //   return index;
    // });
    //
    // Stream<int> numberStream = Stream.fromIterable(iterable);
    // numberStream.listen((event) {
    //   print(event);
    // });

    // Khởi tạo stream thông qua periodic
    Stream<int> streamPeriodic = Stream.periodic(
                                          Duration(seconds: 1), (count) => count).asBroadcastStream();
    streamPeriodic.listen((event) {
      print("Listen1 $event");
    });

    streamPeriodic.listen((event) {
      print("Listen2 $event");
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Stream"),
      ),
      body: Container(),
    );
  }
}
