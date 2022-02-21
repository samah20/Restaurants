import 'package:flutter/material.dart';
import 'package:restaurants/firestore/ui/add_product.dart';

import 'package:restaurants/firestore/ui/screen/admin_app_bottom_bar.dart';
import 'package:restaurants/firestore/ui/screen/admin_buying.dart';

class AdminHome extends StatelessWidget {
  List<Mycard> mycard = [
    Mycard(Icons.shopping_cart, 'Buying', true),
    Mycard(Icons.add, 'Add', false),
    Mycard(Icons.edit, 'Trades', false),
    Mycard(Icons.view_agenda, 'View', false),
    Mycard(Icons.people_outline, 'User', false),
    Mycard(Icons.close, 'Borrowed', false),
  ];
  AdminHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff6f7f9),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/back.png'),
          ),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 90),
              child: Text(
                'Choose your area',
                style: TextStyle(
                  fontSize: 30,
                  color: Color(0xffFB9D58),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  children: mycard
                      .map(
                        (e) => InkWell(
                          onTap: () {
                            // if (e.title == 'add') {
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (_) => AddNewProduct()),
                            //   );
                            // }

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => AddNewProduct()),
                            );
                          },
                          child: Card(
                            color: e.isActive ? Color(0xffFB9D58) : null,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  e.icon,
                                  size: 50,
                                  color: e.isActive
                                      ? Colors.white
                                      : Color(0xffFB9D58),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  e.title,
                                  style: TextStyle(
                                      color: e.isActive
                                          ? Colors.white
                                          : Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: AppBottomBar(),
    );
  }
}

class Mycard {
  final icon;
  final title;
  bool isActive = false;

  Mycard(this.icon, this.title, this.isActive);
}
//child: ElevatedButton.icon(
      //   onPressed: () {
      //     RouterHelper.routerHelper.routingToSpecificWidgetWithPop(MainPage());
      //   },
      //   label: Text(
      //     'SHOW DETAILS',
      //     style: TextStyle(
      //       color: Colors.white,
      //       fontSize: 18,
      //       fontFamily: 'NotoNaskhArabic',
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      //   style: ElevatedButton.styleFrom(
      //       padding: EdgeInsets.symmetric(vertical: 15, horizontal: 60),
      //       primary: Colors.orange),
      //   icon: Icon(
      //     Icons.arrow_forward,
      //     color: Colors.white,
      //     size: 24.0,
      //   ),
      // ),