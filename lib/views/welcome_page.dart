import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:rechtum/view_models/auth_view_model.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatelessWidget {
  final List<PageViewModel> _pages = [
    landingPage(),
    landingPage2(),
    landingPage3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          pages: _pages,
          next: const Icon(Icons.navigate_next),
          done: const Icon(Icons.done),
          onDone: () {
            context
                .read<AuthViewModel>()
                .login("leon", "Leon", "");
            Navigator.pushNamed(context, "/");
          },
        ),
      ),
    );
  }

  static PageViewModel landingPage() => PageViewModel(
        title: "Welcome to RechTUM",
        body:
            "Here you will be able to find answers to all your university related legal questions",
        image: Center(
          child: SvgPicture.asset(
            "images/undraw_Analysis_re_w2vd.svg",
            height: 200,
            semanticsLabel: "Woman studying data",
          ),
        ),
      );

  static PageViewModel landingPage2() => PageViewModel(
        title: "Simple legal help",
        body: "We make legal advice easy and accessible.",
        image: Center(
          child: SvgPicture.asset(
            "images/undraw_happy_feeling_slmw.svg",
            height: 200,
            semanticsLabel: "Woman with balloons feeling happy",
          ),
        ),
      );

  static PageViewModel landingPage3() => PageViewModel(
        title: "Login to begin",
        body: "You can use your preexisting university login.",
        image: Center(
          child: SvgPicture.asset(
            "images/undraw_Login_re_4vu2.svg",
            height: 200,
            semanticsLabel: "Man unlocking a door",
          ),
        ),
      );
}
