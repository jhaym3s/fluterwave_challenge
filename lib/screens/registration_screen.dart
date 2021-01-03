import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  static const routeName = "registrationScreen";
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Column(
        children: [
          TextFormField(
            controller: textController,
            decoration: InputDecoration(
              labelText: "Name of shop",
            ),
          )
        ],
      ),

      ),
    );
  }
}
