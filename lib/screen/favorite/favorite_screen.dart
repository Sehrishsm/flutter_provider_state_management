import 'package:flutter/material.dart';
import 'package:flutter_provider_state_management/provider/favorite_provider.dart';
import 'package:flutter_provider_state_management/screen/favorite/myfavorite.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {

  List<int> selectedItem =[];
  
  @override
  Widget build(BuildContext context) {


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
              itemCount: 100,
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
