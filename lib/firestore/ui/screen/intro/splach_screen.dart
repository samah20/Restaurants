import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurants/firestore/data/router_helper.dart';
import 'package:restaurants/firestore/models/gd_user.dart';
import 'package:restaurants/firestore/providers/app_provider.dart';
import 'package:restaurants/firestore/ui/screen/admin_home.dart';
import 'package:restaurants/firestore/ui/screen/home_screen.dart';
import 'package:restaurants/firestore/ui/screen/intro/intro_page.dart';

class SplachScreen extends StatelessWidget {
  static Widget appName = const Text(
    'SMART ',
    style: TextStyle(
        color: Colors.white,
        fontSize: 48,
        fontWeight: FontWeight.normal,
        fontFamily: 'assets/fonts/Cairo-VariableFont_wght.ttf'),
  );
  GdUser loggedUser;
  static Widget appName1 = const Text(
    ' SCOOTER',
    style: TextStyle(
        color: Colors.white,
        fontSize: 48,
        fontWeight: FontWeight.bold,
        fontFamily: 'assets/fonts/Cairo-VariableFont_wght.ttf'),
  );
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2)).then((v) {
      RouterHelper.routerHelper.routingToSpecificWidget(HomeScreen());
      // if (loggedUser.isAdmin) {
      //   RouterHelper.routerHelper.routingToSpecificWidget(AdminHome());
      // } else {
      //   RouterHelper.routerHelper.routingToSpecificWidget(HomeScreen());
      // }

      User user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        RouterHelper.routerHelper.routingToSpecificWidget(IntroScreen());
      } else {
        Provider.of<AppProvider>(context, listen: false).getChats();
        Provider.of<AppProvider>(context, listen: false).getUserFromFirebase();

        RouterHelper.routerHelper.routingToSpecificWidget(HomeScreen());
      }
    });
    // TODO: implement build
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 100),
        alignment: Alignment.bottomCenter,
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/Splash.png'),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            Text(
              'SMART ',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'assets/fonts/Cairo-VariableFont_wght.ttf'),
            ),
            Text(
              ' SCOOTER',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'assets/fonts/Cairo-VariableFont_wght.ttf'),
            ),
          ],
        ),
      ),
    );
  }
}
