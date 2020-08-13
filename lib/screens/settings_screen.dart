import 'package:flutter/material.dart';
import 'package:flutter_provider/models/user.dart';
import 'package:flutter_provider/providers/user_model.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    textEditingController.text =
        Provider.of<UserModel>(context, listen: false).user.userName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Container(
            width: 400,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Change username'),
                TextField(
                  controller: textEditingController,
                ),
                RaisedButton(
                  child: Text('Login'),
                  color: Colors.lightBlue,
                  onPressed: () {
                    User user = new User(textEditingController.text, 1, null);
                    Provider.of<UserModel>(context, listen: false)
                        .login(user);
                    Navigator.pop(context);
                  },
                ),
                RaisedButton(
                    child: Text("Logout"),
                    color: Colors.red,
                    onPressed: () {
                      Provider.of<UserModel>(context, listen: false)
                          .logOut();
                      textEditingController.clear();
                      Navigator.pop(context);
                    })
              ],
            ),
          ),
        ));
  }
}
