import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vrouter/vrouter.dart';

class FrostedGlassAppBar extends PreferredSize {
  const FrostedGlassAppBar({required this.title, this.actions = const []})
      : super(
          child: const SizedBox(),
          preferredSize: const Size(double.infinity, 56),
        );

  final String title;
  final List<Widget> actions;

  @override
  PreferredSize build(BuildContext context) {
    return PreferredSize(
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: AppBar(
            title: Text(
              title,
              style: TextStyle(color: Colors.black87),
            ),
            leading: BackButton(
              onPressed: () => context.vRouter.pop(),
              color: Colors.black87,
            ),
            actions: actions,
            backgroundColor: Theme.of(context).primaryColor.withOpacity(0.3),
            shadowColor: Colors.transparent,
          ),
        ),
      ),
      preferredSize: Size(
        double.infinity,
        56,
      ),
    );
  }
}
