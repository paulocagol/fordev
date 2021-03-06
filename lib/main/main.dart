import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fordev/main/factories/pages/login/login_page_factory.dart';
import 'package:fordev/main/factories/pages/splash/splash.dart';
import 'package:fordev/ui/components/components.dart';
import 'package:fordev/utils/i18n/resources.dart';
import 'package:get/get.dart';

void main() {
  R.load(Locale('en', 'US'));
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return GetMaterialApp(
      title: '4Dev',
      debugShowCheckedModeBanner: false,
      theme: makeAppTheme(),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: makeSplashnPage,
          transition: Transition.fade,
        ),
        GetPage(
          name: '/login',
          page: makeLoginPage,
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: '/surveys',
          page: () => Scaffold(body: Text('Enquetes')),
          transition: Transition.fadeIn,
        ),
      ],
    );
  }
}
