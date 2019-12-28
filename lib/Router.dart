import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './constant/route_paths.dart' as routes;
import './main.dart';


Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routes.IntialRoute:
      return MaterialPageRoute(builder: (context) => MyApp());  
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
