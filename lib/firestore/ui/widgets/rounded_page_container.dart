import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RoundedPageContainer extends StatelessWidget {
  final Widget child;
  final double height;
  final Color color;
  final bool isLogin;
  final bool isSearch;
  const RoundedPageContainer({
    @required this.child,
    @required this.color,
    this.isLogin = false,
    this.isSearch = false,
    this.height,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: height,
          child: child,
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
        ),
        if (isLogin)
          Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                height: 25.h,
                padding: EdgeInsets.only(left: 1.h),
                child: const Image(
                  image: AssetImage('images/shape2.png'),
                ),
              )),
        if (isSearch)
          Positioned(
              right: 0,
              left: 0.w,
              bottom: 0,
              top: 50.h,
              child: Padding(
                padding: EdgeInsets.only(left: 7.w),
                child: const Image(
                  image: AssetImage('images/shape1.png'),
                ),
              ))
      ],
    );
  }
}
