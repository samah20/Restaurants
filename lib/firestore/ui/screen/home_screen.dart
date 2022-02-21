import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurants/firestore/data/router_helper.dart';
import 'package:restaurants/firestore/models/chat.dart';
import 'package:restaurants/firestore/models/gd_user.dart';
import 'package:restaurants/firestore/providers/app_provider.dart';
import 'package:restaurants/firestore/ui/chats/user_chat.dart';
import 'package:restaurants/firestore/ui/screen/details_home.dart';
import 'package:restaurants/firestore/ui/screen/google_map.dart';
import 'package:restaurants/firestore/ui/widgets/customer_button_h.dart';

import '../add_product.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color mainColor = Color(0xff1D1E27);
    return Scaffold(
      drawer: Drawer(
          child: IconButton(
        icon: Icon(Icons.chat),
        onPressed: () {
          Chat chat = Provider.of<AppProvider>(context, listen: false)
                      .allMyChats[0] !=
                  null
              ? Provider.of<AppProvider>(context, listen: false).allMyChats[0]
              : Provider.of<AppProvider>(context).createAdChat('gfdsdfgddd');
          GdUser admin1 =
              Provider.of<AppProvider>(context, listen: false).admin;
          RouterHelper.routerHelper.routingToSpecificWidgetWithoutPop(UserChat(
            otherUser: admin1,
          ));
        },
      )
          // Column(
          //   children: [
          //     // ListView.builder(
          //     //     itemCount: 4,
          //     //     itemBuilder: (context, index) {
          //     //       return Text('hello');
          //     //     })
          //   ],
          // ),
          ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/Scooter.png'),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.import_export,
                    color: Color(0xffFB9D58),
                  ),
                  fillColor: mainColor,
                  label: Text(
                    'Search nearest bikes available.',
                    style: TextStyle(color: Colors.white),
                  ),
                  //color = const Color(0xffb74093)
                  // focusedBorder: OutlineInputBorder(
                  //   borderSide: BorderSide(color: Colors.white),
                  //   borderRadius: BorderRadius.circular(25.7),
                  // ),
                  contentPadding: EdgeInsets.only(top: 5),
                  filled: true,
                ),
                // Container(child:
                //     return CustomerButtonHome();
                // )
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 300,
              child: GoogleNewTest(),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 390,
              width: 350,
              child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        RouterHelper.routerHelper
                            .routingToSpecificWidgetWithoutPop(DetailsHome());
                      },
                      child: Container(
                          width: 350,
                          color: Color(0xff1D1E27),
                          child: Column(children: [
                            InkWell(
                              onTap: () {
                                RouterHelper.routerHelper
                                    .routingToSpecificWidgetWithoutPop(
                                        AddNewProduct());
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 250, top: 15),
                                child: Text('seeAll',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                            ),
                            CustomerButtonHome(),
                          ])),
                    ),
                  ]),
            ),
            SizedBox(
              height: 10,
            ),
          ]),
        ),
      ),
    );
  }
}
