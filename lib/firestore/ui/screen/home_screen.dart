import 'package:flutter/material.dart';
import 'package:restaurants/firestore/ui/screen/google_map.dart';
import 'package:restaurants/firestore/ui/screen/widgets/customer_button_h.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color mainColor = Color(0xff1D1E27);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: AssetImage('assets/images/Scooter.png'),
          ),
        ),
        child: Column(children: [
          SizedBox(
            height: 150,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            child: TextField(
              decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.import_export,
                  color: Color(0xff2CC3F8),
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
          Container(
            width: double.infinity,
            height: 300,
            child: GoogleNewTest(),
          )
        ]),
      ),
    );
  }
}
