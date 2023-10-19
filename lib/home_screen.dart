import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);
    int x = 10;
  @override
  Widget build(BuildContext context) {
    print('built');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Provider Tutorial'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           Container(
             child:Center(child: Text(x.toString(), style: TextStyle(fontSize: 50),)) ,
           ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
         x++;
         print(x);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
