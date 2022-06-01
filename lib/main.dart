
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:news_viewer/config/Routes.dart';

import 'package:news_viewer/core/auth/screens/login.dart';
import 'package:news_viewer/core/auth/screens/register.dart';
import 'package:news_viewer/utils/constants.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    
    initialRoute: RouteConstants.LOGIN,
    routes: getRoutes(), 
  ));
}