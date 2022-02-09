import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurants/firestore/data/router_helper.dart';
import 'package:restaurants/firestore/models/gd_user.dart';
import 'package:restaurants/firestore/providers/app_provider.dart';
import 'package:restaurants/firestore/ui/screen/widgets/custom_button.dart';

import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  FocusNode myFocusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Register Screen'),
      // ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: AssetImage('assets/images/back.png'),
          ),
        ),
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SingleChildScrollView(
              child: Center(
                child: Container(
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 110,
                      ),
                      TextField(
                        cursorColor: Colors.white70,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white70,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            label: const Text(
                              'Name',
                              style: TextStyle(
                                  backgroundColor: Colors.white54,
                                  color: Colors.black,
                                  fontFamily:
                                      'assets/fonts/Cairo-VariableFont_wght.ttf'),
                            )),
                        controller: nameController,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white70,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            label: Text(
                              'address',
                              style: TextStyle(
                                  color: Colors.black,
                                  backgroundColor: Colors.white54,
                                  fontFamily:
                                      'assets/fonts/Cairo-VariableFont_wght.ttf'),
                            )),
                        controller: addressController,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white70,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            label: Text(
                              'Phone',
                              style: TextStyle(
                                  backgroundColor: Colors.white54,
                                  color: Colors.black,
                                  fontFamily:
                                      'assets/fonts/Cairo-VariableFont_wght.ttf'),
                            )),
                        controller: phoneController,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white70,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            label: const Text(
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
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white70,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            label: const Text(
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
            ),
            Spacer(),
            Container(
              width: 300,
              child: CustomButton(
                title: 'Register',
                function: () {
                  GdUser user = GdUser(
                      address: addressController.text,
                      email: emailController.text,
                      name: nameController.text,
                      password: passwordController.text,
                      phone: phoneController.text);
                  Provider.of<AppProvider>(context, listen: false)
                      .register(user);
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {
                  RouterHelper.routerHelper
                      .routingToSpecificWidget(LoginScreen());
                },
                child: Text('Have already account'))
          ],
        ),
      ),
    );
  }
}
