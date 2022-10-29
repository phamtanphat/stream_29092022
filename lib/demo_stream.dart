import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class DemoStreamPage extends StatefulWidget {
  const DemoStreamPage({Key? key}) : super(key: key);

  @override
  State<DemoStreamPage> createState() => _DemoStreamPageState();
}

class _DemoStreamPageState extends State<DemoStreamPage> {

  StreamController<int> numberController = StreamController();

  @override
  void initState() {
    super.initState();
    numberController.sink.add(0);
  }

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
    // Stream<int> streamPeriodic = Stream.periodic(
    //                                       Duration(seconds: 1), (count) => count).asBroadcastStream();
    // var subscription = streamPeriodic.listen((event) {
    //   print(event);
    // });
    //
    // streamPeriodic.listen((event) {
    //   if (event == 5) {
    //     subscription.pause();
    //   }
    // });

    // 2: StreamController
    //
    // StreamController<String> textController = StreamController();
    //
    // Stream<String> periodic = Stream.periodic(Duration(seconds: 1), (count){
    //   return count.toString();
    // }).asBroadcastStream();
    //
    // periodic.listen((e) {});
    // textController.sink.addStream(periodic);
    //
    // // Thêm dữ liệu (sink)
    // // textController.sink.add("Tèo");
    // // textController.sink.add("Tý");
    //
    // // Lấy dữ liệu (stream)
    // textController.stream.take(10).listen((event) {
    //   print(event);
    // });
    //
    // textController.close();
  }

  void randomNumber() {
    Future.delayed(Duration(seconds: 3), () {
      int number = Random().nextInt(10);
      numberController.sink.add(number);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Stream"),
      ),
      body: Container(
        child: Column(
          children: [
            StreamBuilder<int>(
                stream: numberController.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return CircularProgressIndicator();
                    case ConnectionState.active:
                      return Text(snapshot.data.toString());
                    default:
                      return Container();
                  }
                }
            ),
            ElevatedButton(
                onPressed: () {
                  randomNumber();
                },
                child: Text("Random number")
            )
          ],
        ),
      ),
    );
  }
}
