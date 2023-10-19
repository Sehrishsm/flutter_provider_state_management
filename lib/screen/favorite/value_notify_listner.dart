import 'package:flutter/material.dart';

class NotifyListnerScreen extends StatelessWidget {
  NotifyListnerScreen({Key? key}) : super(key: key);
  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> toggle = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Subscribe'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ValueListenableBuilder(
              valueListenable: toggle,
              builder: (context, value, child){
                return TextFormField(
                  obscureText: toggle.value,
                  decoration: InputDecoration(
                    hintText: 'password',
                    suffixIcon: InkWell(
                        onTap: (){
                          toggle.value=!toggle.value;
                        },
                        child: Icon(toggle.value?Icons.visibility_off_outlined: Icons.visibility)),
                  ),
                );
              }),

          Center(
            child:ValueListenableBuilder(
                valueListenable:_counter,
                builder: (context, value, child){
                  return Text(_counter.value.toString(), style: TextStyle(fontSize: 50),);
                }) ,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _counter.value++;
          print(_counter.value.toString());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
