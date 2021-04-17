import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rechtum/utils/color.dart';
import 'package:rechtum/view_models/auth_view_model.dart';
import 'package:rechtum/view_models/document_overview_view_model.dart';
import 'package:rechtum/views/chat_page.dart';
import 'package:rechtum/views/document_overview_page.dart';
import 'package:rechtum/views/document_page.dart';
import 'package:rechtum/views/home_page.dart';
import 'package:rechtum/views/login_page.dart';
import 'package:rechtum/views/welcome_page.dart';
import 'package:vrouter/vrouter.dart';

class App extends StatelessWidget {
  final Color primary = Color(0xff4E5BC4);
  final Color illustration = Color(0xff9279FE);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(
      fontFamily: "Opens Sans",
      primarySwatch: createMaterialColor(primary),
      primaryColorDark: Color(0xff262F73),
      primaryColor: primary,
      primaryColorLight: Color(0xffA3AAE0),
      accentColor: primary,
      iconTheme: IconThemeData(color: Color(0xff262F73)),
      textTheme: TextTheme(
        headline1: TextStyle(fontFamily: "IBM Plex Sans"),
        headline2: TextStyle(fontFamily: "IBM Plex Sans"),
        headline3: TextStyle(fontFamily: "IBM Plex Sans"),
        headline4: TextStyle(fontFamily: "IBM Plex Sans"),
        headline5: TextStyle(fontFamily: "IBM Plex Sans"),
        headline6: TextStyle(fontFamily: "IBM Plex Sans"),
      ),
    );

    return VRouter(
      title: "RechTUM",
      debugShowCheckedModeBanner: false,
      theme: theme,
      routes: [
        VWidget(
          path: "/welcome",
          widget: WelcomePage(),
          stackedRoutes: [
            VWidget(path: "/login", widget: LoginPage()),
          ],
        ),
        VGuard(
            beforeEnter: (v) async => context.read<AuthViewModel>().loggedIn
                ? null
                : v.push("/welcome"),
            stackedRoutes: [
              VWidget(
                path: "/",
                widget: HomePage(),
                stackedRoutes: [
                  VWidget(path: "chat", widget: ChatPage(), stackedRoutes: [
                    VWidget(
                        path: "document/:id", widget: DocumentPageWrapper()),
                  ]),
                  VWidget(
                      path: "documents",
                      widget: ChangeNotifierProvider<DocumentOverviewViewModel>(
                          create: (_) => DocumentOverviewViewModel(),
                          child: DocumentOverviewPage()),
                      stackedRoutes: [
                        VWidget(
                            path: "document/:id",
                            widget: DocumentPageWrapper()),
                      ]),
                ],
              ),
            ]),
        VRouteRedirector(path: ":_(.+)", redirectTo: "/")
      ],
    );
  }
}
