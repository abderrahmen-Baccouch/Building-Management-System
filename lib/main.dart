
import 'dart:io';

import 'package:bms/pages/splash_screen.dart';
import 'package:flutter/material.dart';

import 'pages/reset_password.dart';
 class PostHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main() {
  HttpOverrides.global = new PostHttpOverrides();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  Color _primaryColor = Color(0xFF8D74F7);
  Color _accentColor = Color(0xFF7C5CFD);
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       primaryColor: _primaryColor,
       hintColor: _accentColor,
       scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
        primarySwatch: Colors.grey,
      ),
        home:  SplashScreen(title: 'Flutter Demo Home Page'),
       // SideMenu(),
      //home: ResetPasswordScreen(),
      
    );
   
  }
}
