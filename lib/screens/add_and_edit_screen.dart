import 'package:flutter/material.dart';
import '../providers/product.dart';

class AddAndEditScreen extends StatefulWidget {
  static const routeName = "/AddAndEditScreen";
  @override
  _AddAndEditScreenState createState() => _AddAndEditScreenState();
}

class _AddAndEditScreenState extends State<AddAndEditScreen> {
  @override
  void initState() {
_imageUrlFocusNode.addListener(updateImageUrl);
    super.initState();
  }
  final titleFocusNode = FocusNode();
  final descriptionFocusNode = FocusNode();
  final shopNameFocusNode = FocusNode();
  final priceFocusNode = FocusNode();
  final _imageUrlFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _form = GlobalKey<FormState>();
  @override
  void dispose() {
    _imageUrlFocusNode.removeListener(updateImageUrl);
    titleFocusNode.dispose();
    descriptionFocusNode.dispose();
    shopNameFocusNode.dispose();
    priceFocusNode.dispose();
    _imageUrlController.dispose();
    _imageUrlFocusNode.dispose();
    super.dispose();
  }
  void updateImageUrl(){
    if(!_imageUrlFocusNode.hasFocus){
      setState(() {});
    }
  }
  void saveForm (){
    _form.currentState.save();
    print(editedProduct.imageUrl);
    print(editedProduct.title);
    print(editedProduct.shopName);
    print(editedProduct.price);
    Navigator.of(context).pop();
  }
  var editedProduct = Product(
    title: "",
    imageUrl: "",
    price: 0.0,
    id: null,
    shopName: "",
    description: "",
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(Icons.save), onPressed: saveForm)
        ],
      ),
      body: Form(
        key: _form,
          child: Column(
        children: [
     TextFormField(
       onSaved: (value){
         editedProduct = Product(
           title: editedProduct.title,
           imageUrl: editedProduct.imageUrl,description: editedProduct.description,price: editedProduct.price,
           shopName: value,
         );
       },
focusNode: shopNameFocusNode,
       readOnly: true,
       decoration: InputDecoration(
         labelText: "Name of shop"
       ),
     ),
      TextFormField(
        validator: (value){
          if(value.isEmpty){
            return "Add a title";
          }
          return null;
        },
        onSaved: (value){
          editedProduct = Product(
            title: value,
            imageUrl: editedProduct.imageUrl,description: editedProduct.description,price: editedProduct.price,
            shopName: editedProduct.shopName,
          );
        },
        focusNode: titleFocusNode,
       textInputAction: TextInputAction.next,

        onFieldSubmitted: (_){
          FocusScope.of(context).requestFocus(descriptionFocusNode);
        },
       decoration: InputDecoration(
         labelText: "Name of product",
       ),
     ),
       TextFormField(
         validator: (value){
           if(value.isEmpty){
             return"please enter a description";
           }
           if(value.length < 10){
             return "Please give a more descriptive description";
           }
           return null;
         },
         onSaved: (value){
           editedProduct = Product(
             title: editedProduct.title,
             imageUrl: editedProduct.imageUrl,description: value,price: editedProduct.price,
             shopName: editedProduct.shopName,
           );
         },
        focusNode: descriptionFocusNode,
       textInputAction: TextInputAction.next,
        onFieldSubmitted: (_){
          FocusScope.of(context).requestFocus(priceFocusNode);
        },
       decoration: InputDecoration(
         labelText: "Description",
       ),
     ),
     TextFormField(
       validator: (value){
         if(value.isEmpty){
           return " What is the price of the product";
         }
         if (double.tryParse(value)== null){
           return "the price is supposed to be a number";
         }
         if(double.parse(value)<1){
           return "Is this a fake product or what add a better price abeg";
         }
         return null;
       },
    onSaved: (value) {
      editedProduct = Product(
        title: editedProduct.title,
        imageUrl: editedProduct.imageUrl,
        description: editedProduct.imageUrl,
        price: double.parse(value),
        shopName: editedProduct.shopName,
      );
    },
        focusNode: priceFocusNode,
       textInputAction: TextInputAction.next,
        onFieldSubmitted: (_){
          FocusScope.of(context).requestFocus(_imageUrlFocusNode);
        },
       keyboardType: TextInputType.number,
       decoration: InputDecoration(
         labelText: "Price",
       ),
     ),
     Row(
       children: [
         Container(
           decoration: BoxDecoration(
             border: Border.all(
               color: Colors.grey,width: 1.0
             )
           ),
           height: 100,
           width: 100,
           child: _imageUrlController.text.isEmpty?Text("Product Image")
               : FittedBox(child: Image.network(_imageUrlController.text,fit: BoxFit.cover,)),
         ),
         // CircleAvatar(
         //   radius: 30,
         //  backgroundImage: NetworkImage(_imageUrlController.text),
         // ),
         Expanded(
           child: Padding(
             padding: const EdgeInsets.all(3.0),
             child: TextFormField(
               validator: (value) {
                 if (value.isEmpty) {
                   return ' Are you a fraud star? Please enter an image URL.';
                 }
                 if (!value.startsWith('http') &&
                     !value.startsWith('https')) {
                   return 'Please enter a valid URL.';
                 }
                 if (!value.endsWith('.png') &&
                     !value.endsWith('.jpg') &&
                     !value.endsWith('.jpeg')) {
                   return 'Please enter a valid image URL.';
                 }
                 return null;
               },
               onSaved: (value){
                 editedProduct = Product(
                   title: editedProduct.title,
                   imageUrl: value,description: editedProduct.description,price: editedProduct.price,
                   shopName: editedProduct.shopName,
                 );
               },
               keyboardType: TextInputType.url,
                focusNode: _imageUrlFocusNode,
               controller: _imageUrlController,
               textInputAction: TextInputAction.done,
                onFieldSubmitted: (_){
                 saveForm();
                },

               decoration: InputDecoration(
                 labelText: "Product ImageUrl",
               ),
             ),
           ),
         ),
       ],
     ),
        ],
      )),
    );
  }
}
