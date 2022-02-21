import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DotBorder extends StatelessWidget {
  final String name;
  final bool isBig;
  final String icon;
  const DotBorder({
    this.isBig = false,
    @required this.name,
    @required this.icon,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(20),
      dashPattern: const [10, 10],
      color: Colors.grey,
      strokeWidth: 2,
      child: SizedBox(
        width: 50.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              height: 9.h,
              width: 12.w,
            ),
            Text(
              name,
              style:
                  TextStyle(fontSize: isBig ? 13.sp : 15.sp, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
