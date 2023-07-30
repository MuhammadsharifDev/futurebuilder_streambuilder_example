import 'package:flutter/material.dart';

class StreamBuilderPage extends StatefulWidget {
  const StreamBuilderPage({super.key});

  @override
  State<StreamBuilderPage> createState() => _StreamBuilderPageState();
}

class _StreamBuilderPageState extends State<StreamBuilderPage> {
  late Stream<int> getStream;

  @override
  void initState() {
    super.initState();
    getStream = countToTen();
  }

  Stream<int> countToTen() async* {
    await Future.delayed(
      const Duration(seconds: 1),
    );
    for (int i = 0; i <= 10; i++) {
      await Future.delayed(const Duration(microseconds: 1));
      yield i;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamBuilder'),
      ),
      body: Center(
          child: StreamBuilder(
        stream: countToTen(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            return Center(child: Text('Number $data'));
          } else  {
            return CircularProgressIndicator();
          }
        },
      )),
    );
  }
}
