import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/favorite_provider.dart';

class MyFavoriteItemScreen extends StatefulWidget {
  const MyFavoriteItemScreen({Key? key}) : super(key: key);

  @override
  State<MyFavoriteItemScreen> createState() => _MyFavoriteItemScreenState();
}

class _MyFavoriteItemScreenState extends State<MyFavoriteItemScreen> {
  @override
  @override
  Widget build(BuildContext context) {

  final favoriteProvider = Provider.of<FavoriteItemsProvider>(context);
    print('built');
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite app'),
        centerTitle: true,
        actions: [
          InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> MyFavoriteItemScreen()));
              },
              child: Icon(Icons.favorite)),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: favoriteProvider.selectedItem.length,
              itemBuilder: (context, index){
                return Consumer<FavoriteItemsProvider>(builder: (context,value,child){
                  return ListTile(
                    onTap: (){
                      if(value.selectedItem.contains(index)){
                        value.removeItem(index);
                      }else{
                        value.addItem(index);
                      }


                    },
                    title: Text('Item '+ index.toString()),
                    trailing: Icon(
                        value.selectedItem.contains(index) ?Icons.favorite: Icons.favorite_outline
                    ),
                  );
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
