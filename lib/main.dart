import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_app/services/navigation_service.dart';
import 'constant/size.dart';
import 'locator.dart';
import './constant/route_paths.dart' as routes;
import './Router.dart' as router;
import './screens/welcome_widget/welcome_widget.dart';
void main() {
  setupLocator();

  runApp(MaterialApp(home: EasyLocalization(child: MyApptest())));
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {

    return Stack(children: <Widget>[
    
        WelcomeWidget(),
      new Positioned(
        
        child: new FloatingActionButton(
          child: new Icon(Icons.add),
          onPressed: () {
            setState(() {
              var data = EasyLocalizationProvider.of(context).data;
              if (Localizations.localeOf(context).languageCode == "ar")
                data.changeLocale(Locale("en", "US"));
              else
                data.changeLocale(Locale("ar", "DZ"));
            });
          },
          backgroundColor: Colors.blue,
        ),
        right: 10.0,
        bottom: 10.0,
      )
    ]);
  }
}

class MyApptest extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    var data = EasyLocalizationProvider.of(context).data;
    return EasyLocalizationProvider(
      data: data,
      child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          EasylocaLizationDelegate(locale: data.locale, path: 'resources'),
        ],
        supportedLocales: [Locale('ar', 'DZ') , Locale('en', 'US')],
        locale: data.savedLocale,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyApp(),
        navigatorKey: locator<NavigationService>().navigatorKey,
        onGenerateRoute: router.generateRoute,
        initialRoute: routes.IntialRoute
      ),
    );
  }
}
