import 'package:flutter/material.dart';
import 'package:jumga/providers/product_provider.dart';
import 'package:jumga/screens/add_and_edit_screen.dart';
import 'package:provider/provider.dart';

class UpdateProductItem extends StatelessWidget {
  final String imageUrl,title,id;
  final IconData edit,delete;

  UpdateProductItem({this.imageUrl,this.title,this.id,this.delete,this.edit});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductsProvider>(context);
    return ListTile(
      leading: FittedBox(
        key: ValueKey(id),
        fit: BoxFit.cover,
        child: CircleAvatar(
          backgroundImage: NetworkImage(imageUrl,),
        ),
      ),
      title: Text(title),
      trailing: Container(
        width: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(icon:Icon(edit,color: Colors.blue) , onPressed: (){
            Navigator.of(context).pushNamed(AddAndEditScreen.routeName,arguments:id);
            }),
            IconButton(icon:Icon(delete,color: Colors.red,) , onPressed: (){
              product.deleteProduct(id);
            })
          ],
        ),
      ),
    );
  }
}
