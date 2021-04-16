import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeContent(),
      floatingActionButton: SizedBox(
        height: 64,
        width: 64,
        child: FloatingActionButton(
          child: Icon(Icons.chat_bubble_outline_rounded, size: 36),
          onPressed: () => Navigator.pushNamed(context, "/chat"),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          children: [
            IconButton(icon: Icon(Icons.class_), onPressed: () {}),
            Spacer(),
            IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
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
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SvgPicture.asset(
                "images/undraw_Analysis_re_w2vd.svg",
                height: 200,
                semanticsLabel: "Studying data",
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome to RechTUM!", style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold)),
                  Text("Here you will be able to find answers to all your university related legal questions.")
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
