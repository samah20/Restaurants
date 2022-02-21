import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PageTopContainer extends StatelessWidget {
  final String text;
  final double height;
  final Color color;
  final EdgeInsetsGeometry padding;
  const PageTopContainer(
      {@required this.height,
      @required this.padding,
      this.color,
      Key key,
      @required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //    height: height,
      padding: padding,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 2.w),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: 11.w,
          ),
          Text(text),
        ],
      ),
    );
  }
}
