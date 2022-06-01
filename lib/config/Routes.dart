// All Application Routes are placed Here
// Routes - Navigation


import 'package:flutter/material.dart';
import 'package:news_viewer/core/auth/screens/register.dart';
import 'package:news_viewer/modules/screens/news_screen.dart';
import 'package:news_viewer/utils/constants.dart';

import '../core/auth/screens/Login.dart';

Map<String, WidgetBuilder> getRoutes() {
  return {
    RouteConstants.LOGIN: (context) => const Login(),
    // When navigating to the "/second" route, build the SecondScreen widget.
    RouteConstants.REGISTER: (context) => const Register(),
    RouteConstants.NEWSPAGE:(context) => const NewsScreen(),
    

  };
}
