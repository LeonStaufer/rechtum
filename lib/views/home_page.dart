import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rechtum/view_models/auth_view_model.dart';
import 'package:provider/provider.dart';
import 'package:vrouter/vrouter.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeContent(),
      floatingActionButton: SizedBox(
        height: 64,
        width: 64,
        child: FloatingActionButton(
          child: Icon(Icons.question_answer_rounded, size: 36),
          onPressed: () => context.vRouter.push("/chat"),
          elevation: 12,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          children: [
            IconButton(
                icon: Icon(Icons.collections_bookmark_rounded),
                onPressed: () => context.vRouter.push("/documents")),
            Spacer(),
            IconButton(
                icon: Icon(Icons.logout),
                onPressed: () {
                  context.vRouter.pushReplacement("/welcome");
                  context.read<AuthViewModel>().logout();
                }),
          ],
        ),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.all(8),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: SvgPicture.asset(
              "assets/undraw_messages.svg",
              height: 200,
              semanticsLabel: "Man looking at chat messages",
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome ${context.read<AuthViewModel>().name}!",
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  Text(
                      "Here you will be able to find answers to all your university related legal questions.")
                ],
              ),
            ),
          ),
          Card(
            child: ListTile(
              onTap: () => context.vRouter.push("/university"),
              contentPadding: const EdgeInsets.all(16),
              trailing: SvgPicture.asset(
                "assets/undraw_education.svg",
                width: 100,
                semanticsLabel: "Education",
              ),
              title: Text("University",
                  style: Theme.of(context).textTheme.headline5),
              subtitle: Text(
                  "I have a problem with study regulations at my University."),
            ),
          ),
          Card(
            child: ListTile(
              onTap: () {},
              contentPadding: const EdgeInsets.all(16),
              trailing: SvgPicture.asset(
                "assets/undraw_town.svg",
                width: 100,
                semanticsLabel: "Small town",
              ),
              title: Text("Rent", style: Theme.of(context).textTheme.headline5),
              subtitle: Text("I have a problem with my rent or my landlord."),
            ),
          ),
          Card(
            child: ListTile(
              onTap: () {},
              contentPadding: const EdgeInsets.all(16),
              trailing: SvgPicture.asset(
                "assets/undraw_working.svg",
                width: 100,
                semanticsLabel: "Several books used for work",
              ),
              title: Text("Employment",
                  style: Theme.of(context).textTheme.headline5),
              subtitle:
                  Text("I have a problem with my working student contract."),
            ),
          ),
        ],
      ),
    );
  }
}
