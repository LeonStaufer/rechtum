import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:rechtum/view_models/auth_view_model.dart';
import 'package:provider/provider.dart';
import 'package:vrouter/vrouter.dart';

class WelcomePage extends StatelessWidget {
  List<PageViewModel> _pages(context) => [
        landingPage(),
        landingFriendlyConversationsPage(),
        landingLegalQuestionsPage(),
        landingLoginPage(context),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          pages: _pages(context),
          next: const Icon(Icons.navigate_next),
          showDoneButton: false,
          color: Theme.of(context).primaryColor,
          dotsDecorator: DotsDecorator(activeColor: Theme.of(context).primaryColor),
        ),
      ),
    );
  }

  static PageViewModel landingPage() => PageViewModel(
        title: "Welcome to RechTUM!",
        body: "Get Legal Advice from our GPT-3 law specialist.",
        image: Center(
          child: SvgPicture.asset(
            "assets/undraw_Analysis_re_w2vd.svg",
            height: 200,
            semanticsLabel: "Woman studying data",
          ),
        ),
      );

  static PageViewModel landingFriendlyConversationsPage() => PageViewModel(
        title: "Just ask questions",
        body: "Have a friendly conversation with our RechTUM chatbot.",
        image: Center(
          child: SvgPicture.asset(
            "assets/undraw_happy_feeling_slmw.svg",
            height: 200,
            semanticsLabel: "Woman with balloons feeling happy",
          ),
        ),
      );

  static PageViewModel landingLegalQuestionsPage() => PageViewModel(
        title: "and receive simple legal help",
        body: "Solve your legal questions - quick and easy.",
        image: Center(
          child: SvgPicture.asset(
            "assets/undraw_happy_feeling_slmw.svg",
            height: 200,
            semanticsLabel: "Woman with balloons feeling happy",
          ),
        ),
      );

  static PageViewModel landingLoginPage(BuildContext context) => PageViewModel(
        title: "Let's get started",
        bodyWidget: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => context.vRouter.push("/login"),
                child: Text("Login"),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  context.read<AuthViewModel>().login("", "", "imageURL");
                  context.vRouter.pushReplacement("/");
                },
                child: Text("Skip for now"),
              ),
            ),
          ],
        ),
        image: Center(
          child: SvgPicture.asset(
            "assets/undraw_Login_re_4vu2.svg",
            height: 200,
            semanticsLabel: "Man unlocking a door",
          ),
        ),
      );
}
