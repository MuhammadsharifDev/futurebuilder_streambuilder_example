import 'package:flutter/material.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  Future<int>  getData()async{
    await Future.delayed(const Duration(seconds: 3));
    return 75;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title:const Text('FutureBuilder'),
       ),
     body: Center(
       child: FutureBuilder(
                future: getData(),
           builder: (context, snapshot) {
             if(snapshot.hasData){
               final data=snapshot.data!;
               return Center(
                 child: Text(' That is $data'),
               );
             }
             else{
               return Text('Waiting');
             }
           },
       ),
     ),
    );
  }
}
