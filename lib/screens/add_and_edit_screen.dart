import 'package:flutter/material.dart';

class AddAndEditScreen extends StatefulWidget {
  static const routeName = "/AddAndEditScreen";
  @override
  _AddAndEditScreenState createState() => _AddAndEditScreenState();
}

class _AddAndEditScreenState extends State<AddAndEditScreen> {
  final _form = GlobalKey<FormState>();
  final titleFocusNode = FocusNode();
  final descriptionFocusNode = FocusNode();
  final shopNameFocusNode = FocusNode();
  final _imageUrlFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(Icons.save), onPressed: null)
        ],
      ),
      body: Form(
        key: _form,
          child: Column(
        children: [
     TextFormField(
focusNode: shopNameFocusNode,
       textInputAction: TextInputAction.next,
       readOnly: true,
       onFieldSubmitted: (_){
  FocusScope.of(context).requestFocus(titleFocusNode);
       },
       decoration: InputDecoration(
         labelText: "Name of shop"
       ),
     ),
      TextFormField(
        focusNode: titleFocusNode,
       textInputAction: TextInputAction.next,
        onFieldSubmitted: (_){
          FocusScope.of(context).requestFocus(titleFocusNode);
        },
       decoration: InputDecoration(
         labelText: "Name of product",
       ),
     ),
       TextFormField(
        focusNode: titleFocusNode,
       textInputAction: TextInputAction.next,
        onFieldSubmitted: (_){
          FocusScope.of(context).requestFocus(titleFocusNode);
        },
       decoration: InputDecoration(
         labelText: "Description",
       ),
     ),
     TextFormField(
        focusNode: titleFocusNode,
       textInputAction: TextInputAction.next,
        onFieldSubmitted: (_){
          FocusScope.of(context).requestFocus(titleFocusNode);
        },
       decoration: InputDecoration(
         labelText: "Name of product",
       ),
     ),
     TextFormField(
        focusNode: titleFocusNode,
       textInputAction: TextInputAction.next,
        onFieldSubmitted: (_){
          FocusScope.of(context).requestFocus(titleFocusNode);
        },
       decoration: InputDecoration(
         labelText: "Name of product",
       ),
     ),
        ],
      )),
    );
  }
}
