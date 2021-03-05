import 'package:flutter/material.dart';
import 'package:fordev/main/factories/pages/splash/splash_presenter_factory.dart';
import 'package:fordev/ui/pages/splash/splash.dart';

Widget makeSplashnPage() {
  return SplashPage(presenter: makeGetxSplashPresenter());
}
