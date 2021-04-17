import 'package:flutter/material.dart';
import 'package:rechtum/view_models/auth_view_model.dart';
import 'package:provider/provider.dart';
import 'package:vrouter/vrouter.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _controllerName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              TextField(
                controller: _controllerName,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.face),
                  hintText: "Name",
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).accentColor, width: 8),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      context.read<AuthViewModel>().login(
                          _controllerName.text.toLowerCase(),
                          _controllerName.text,
                          "imageURL");
                      context.vRouter.pushReplacement("/");
                    },
                    child: Text("Login")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
