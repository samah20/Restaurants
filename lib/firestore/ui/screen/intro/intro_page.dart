import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurants/firestore/data/router_helper.dart';
import 'package:restaurants/firestore/ui/screen/LoginRegister/lo_re.dart';
import 'package:restaurants/firestore/ui/screen/LoginRegister/login_screen.dart';

class IntroScreen extends StatelessWidget {
  List<PageViewModel> pages = [
    PageViewModel(
      title: "In hac habitasse platea dictumst.",
      body: "Donec facilisis tortor ut augue lacinia, at viverra est semper...",
      image: Center(child: Image.asset("assets/images/illustration.png")),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
            // mainAxisAlignment: MainAxisAlignment.center,

            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30.0),
        bodyTextStyle: TextStyle(
            color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 15.0),
      ),
    ),
    PageViewModel(
      //textAlign:TextAlign.start
      title: "Title of first page",
      body:
          "Here you can write the description of the page, to explain someting...",
      image: Center(child: Lottie.asset("assets/animations/easier.json")),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30.0),
        bodyTextStyle: TextStyle(
            color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 15.0),
      ),
    ),
    PageViewModel(
      title: "Title of first page",
      body:
          "Here you can write the description of the page, to explain someting...",
      image: Center(child: Lottie.asset("assets/animations/ready.json")),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30.0),
        bodyTextStyle: TextStyle(
            color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 15.0),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      //   height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitWidth,
          image: AssetImage('assets/images/back.png'),
        ),
      ),

      child: IntroductionScreen(
        globalBackgroundColor: Colors.transparent,
        nextColor: Colors.orange,
        skipColor: Colors.grey,
        doneColor: Colors.orange,
        pages: pages,
        onDone: () {
          RouterHelper.routerHelper
              .routingToSpecificWidget(const LoginRegisterScreen());
        },
        onSkip: () {
          RouterHelper.routerHelper
              .routingToSpecificWidget(const LoginRegisterScreen());
        },
        showSkipButton: true,
        skip: const Text("Skip"),
        next: const Icon(Icons.next_plan),
        done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
        dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            // activeColor: theme.accentColor,

            color: Colors.black26,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0))),
      ),
    );
  }
}
