import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:online_storage/loginprovide.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    // added textEditing controllers for taking values from textfield
    final emailidcontroller = TextEditingController();
    final passwordcontroller = TextEditingController();
    final nameController = TextEditingController();
    final numberController = TextEditingController();

    // created provider instance so we can access all variable and functions with this instance

    final loginProvider = Provider.of<LoginProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              // each textfield have different controllers
              controller: nameController,
              decoration: InputDecoration(hintText: "Name", border: _border()),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: numberController,
              decoration:
                  InputDecoration(hintText: "Phone Number", border: _border()),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: emailidcontroller,
              decoration: InputDecoration(hintText: "Email", border: _border()),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: passwordcontroller,
              decoration:
                  InputDecoration(border: _border(), hintText: 'Password'),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () async {
                // all contoller values saved to a variables
                final String emailid = emailidcontroller.text.trim();
                final String password = passwordcontroller.text.trim();
                final String name = nameController.text;
                final String mobileNumber = numberController.text;

// called create user function with provider instance

                await loginProvider.createUser(
                    emailid: emailid,
                    name: name,
                    mobileNumber: mobileNumber,
                    password: password);
              },
              child: Text("Submit")),
        ],
      ),
    );
  }

  OutlineInputBorder _border() => OutlineInputBorder();
}
