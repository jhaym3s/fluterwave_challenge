import 'package:flutter/material.dart';

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

  final _form = GlobalKey<FormState>();
  final titleFocusNode = FocusNode();
  final descriptionFocusNode = FocusNode();
  final shopNameFocusNode = FocusNode();
  final priceFocusNode = FocusNode();
  final _imageUrlFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();

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
  }
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
focusNode: shopNameFocusNode,
       readOnly: true,
       decoration: InputDecoration(
         labelText: "Name of shop"
       ),
     ),
      TextFormField(
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
               : Image.network(_imageUrlController.text,fit: BoxFit.cover,),
         ),
         Expanded(
           child: Padding(
             padding: const EdgeInsets.all(3.0),
             child: TextFormField(
               keyboardType: TextInputType.url,
                focusNode: _imageUrlFocusNode,
               controller: _imageUrlController,
               textInputAction: TextInputAction.next,
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
