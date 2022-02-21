import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:restaurants/firestore/data/router_helper.dart';
import 'package:restaurants/firestore/models/durationing.dart';
import 'package:restaurants/firestore/models/item.dart';
import 'package:restaurants/firestore/ui/chats/main_page.dart';

class DetailsHome extends StatefulWidget {
  DetailsHome({Key key}) : super(key: key);
  ItemModel itemModel;

  @override
  State<DetailsHome> createState() => _DetailsHomeState();
}

Widget assetImage = new Container(
  height: 200,
  child: new Carousel(
    images: [
      Image.asset('assets/images/Combined Shape.png'),
      Image.asset('assets/images/illustration.png'),
      Image.asset('assets/images/Combined Shape.png'),
    ],
    autoplay: true,
    boxFit: BoxFit.cover,
    animationCurve: Curves.fastOutSlowIn,
    animationDuration: Duration(milliseconds: 1000),
  ),
);

class _DetailsHomeState extends State<DetailsHome> {
  int selectedIndex;

  get index => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/back.png'),
          ),
        ),
        child: Column(children: [
          Stack(children: [
            assetImage,
            Padding(
              padding: const EdgeInsets.only(top: 185, left: 20),
              child: Image.asset('assets/images/parked.png'),
            ),
          ]),
          Container(
            height: 500,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Xiaomi Mijia",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Spacer(),
                    Text(
                      "\$1.5/hr",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Light Pavement e-Scooter",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Container(
                        child: Row(
                      children: [
                        Icon(
                          Icons.battery_full_rounded,
                          color: Colors.white,
                        ),
                        Column(
                          children: [
                            Text(
                              "Power",
                              style: TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            Text(
                              "93%",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                          ],
                        )
                      ],
                    )),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                        child: Row(
                      children: [
                        Icon(
                          Icons.location_searching,
                          color: Colors.red,
                        ),
                        Column(
                          children: [
                            Text(
                              "Power",
                              style: TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            Text(
                              "3.4 KM",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                          ],
                        )
                      ],
                    )),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      imge_container(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Duration',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Container(
                  height: 40,
                  width: double.infinity,
                  // alignment: Alignment.center,
                  child:
                      // Text('Duration'),
                      Container(
                          decoration: BoxDecoration(
                            color: index == selectedIndex
                                ? Colors.blue.withOpacity(0.7)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children:
                                duration.map((e) => Text(e.title)).toList(),
                          )
                          //  ListView.builder(
                          //     scrollDirection: Axis.horizontal,
                          //     itemCount: duration.length,
                          //     itemBuilder: (context, index) => GestureDetector(
                          //           onTap: () {
                          //             setState(() {
                          //               selectedIndex = index;
                          //             });
                          //           },
                          //           child: Container(
                          //               alignment: Alignment.center,
                          //               margin: EdgeInsets.only(
                          //                   left: 10,
                          //                   right:
                          //                       index == duration.length - 1 ? 5 : 0),
                          //               padding: EdgeInsets.symmetric(
                          //                   horizontal: 5, vertical: 10),
                          //               decoration: BoxDecoration(
                          //                 color: index == selectedIndex
                          //                     ? Colors.blue.withOpacity(0.7)
                          //                     : Colors.transparent,
                          //                 borderRadius: BorderRadius.circular(6),
                          //               ),
                          //               child: Text(
                          //                 duration[index].title,
                          //                 style: TextStyle(color: Colors.black),
                          //               )),
                          //         )),

                          ),
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    RouterHelper.routerHelper
                        .routingToSpecificWidgetWithPop(MainPage());
                  },
                  label: Text(
                    'SHOW DETAILS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'NotoNaskhArabic',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 60),
                      primary: Colors.orange),
                  icon: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 24.0,
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class imge_container extends StatelessWidget {
  const imge_container({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 60,
      margin: EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image(
            image: AssetImage(
              'assets/images/Scooter.png',
            ),
            fit: BoxFit.cover),
      ),
    );
  }
}
/**
 *    Text('Duration'),
              ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: duration.length,
                  itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(
                                left: 10,
                                right: index == duration.length - 1 ? 5 : 0),
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              color: index == selectedIndex
                                  ? Color.fromARGB(255, 64, 197, 153)
                                      .withOpacity(0.7)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              duration[index].title,
                              style: TextStyle(color: Colors.black),
                            )),
                      )),
             
 */