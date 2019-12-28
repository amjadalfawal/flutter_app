import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './constant/route_paths.dart' as routes;
import './screens//welcome_widget/welcome_widget.dart';
import './main.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routes.IntialRoute:
      return MaterialPageRoute(builder: (context) => MyApp());

    case routes.WelcomeRoute:
      return MaterialPageRoute(builder: (context) => WelcomeWidget());

    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(
            child: Text('No path for ${settings.name}'),
          ),
        ),
      );
  }
}
