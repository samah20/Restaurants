import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:restaurants/firestore/data/router_helper.dart';
import 'package:restaurants/firestore/providers/app_provider.dart';
import 'package:restaurants/firestore/ui/screen/widgets/custom_button.dart';

import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Login Screen'),
      // ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: AssetImage('assets/images/back.png'),
          ),
        ),
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SingleChildScrollView(
              child: Container(
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 300,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white70,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          label: Text(
                            'Email',
                            style: TextStyle(
                                backgroundColor: Colors.white54,
                                color: Colors.black,
                                fontFamily:
                                    'assets/fonts/Cairo-VariableFont_wght.ttf'),
                          )),
                      controller: emailController,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white70,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          label: Text(
                            'Password',
                            style: TextStyle(
                                backgroundColor: Colors.white54,
                                color: Colors.black,
                                fontFamily:
                                    'assets/fonts/Cairo-VariableFont_wght.ttf'),
                          )),
                      controller: passwordController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            Container(
              width: 300,
              child: CustomButton(
                title: 'Login',
                function: () {
                  Provider.of<AppProvider>(context, listen: false)
                      .login(emailController.text, passwordController.text);
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {
                  RouterHelper.routerHelper
                      .routingToSpecificWidget(RegisterScreen());
                },
                child: Text('Create account'))
          ],
        ),
      ),
    );
  }
}
