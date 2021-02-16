import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jumga/screens/product_overview.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();
  final _passwordController = TextEditingController();
  _textFields(TextEditingController textEditingController, String label ){
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
        ),
        controller: textEditingController,
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _textController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(),
              FlutterLogo(
                textColor: Colors.purple,
                style: FlutterLogoStyle.markOnly,
              ),
              Text("Jumga",style: TextStyle(
                fontSize: 30
              ),),
              Center(
                child: Form(
                  key:_formKey,
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    _textFields(_textController,"UserName"),
                    SizedBox(height: 10,),
                    _textFields(_passwordController,"Password"),
                  ],
                )),
              ),
              ElevatedButton(onPressed: (){
                Navigator.of(context).pushNamed(ProductOverView.routeName);
              }, child: Text("Skip"))
            ],
          ),
        ),
      ),
    );
  }
}
