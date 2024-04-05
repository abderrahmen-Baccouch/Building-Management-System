// ignore_for_file: prefer_const_constructors, unused_import, use_build_context_synchronously

import 'dart:convert';
// ignore: avoid_web_libraries_in_flutter
import 'dart:ui';

import 'package:bms/pages/dashboard.dart';
import 'package:bms/pages/reset_password.dart';
import 'package:bms/pages/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
// ignore: duplicate_import
import 'widgets/header_widget.dart';
import 'package:bms/pages/sign_up_page.dart';
import 'package:quickalert/quickalert.dart';

import 'package:http/http.dart' as http;



class LoginPage extends StatefulWidget{
  const LoginPage({Key? key}): super(key:key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{


  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  double _headerHeight = 250;
  Key _formKey = GlobalKey<FormState>();

 
 

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();















  void login(BuildContext context, String email, String password) async {
  final url = 'http://10.0.2.2:8000/api/auth/login';

//    final url = 'https://bms-back.start-now.fr/public/api/auth/login';
  final Map<String, String> formData = {
    'email': email,
    'password': password,
  };

  try {
    final response = await http.post(Uri.parse(url), body: formData);
 var data =json.decode(response.body) ;
  final id = data["user_id"].toString();
  print(id);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
    print(data);
      if (data['status'] == 200) {
        print(id);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DashboardPage(id: id)),
          
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login successful!'),
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        showAlert(QuickAlertType.error);
      }
    } 

   else {
        print('failed');
        showAlert(QuickAlertType.error);
      }
    }catch(e){
      print(e.toString());
    }
  }

 void forgetPassword(BuildContext context, String email) async {
  final url = 'http://10.0.2.2:8000/api/forgot-password';
  final Map<String, String> raw = {
    'email': email,
  };

  try {
    final response = await http.post(Uri.parse(url), body: raw);
    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password reset email sent!'),
          duration: Duration(seconds: 2),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('We have emailed your password reset link!.'),
          duration: Duration(seconds: 2),
        ),
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResetPasswordScreen(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to send password reset email.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  } catch (e) {
    print('Error: $e');
  }
}





void resetPassword(BuildContext context, String id, String newPassword) async {
  try {
    final response = await http.put(
      Uri.parse('http://10.0.2.2:8000/api/resetPassword/$id'),
      body: {
        'new_password': newPassword,
      },
    );

    if (response.statusCode == 200) {
      // Password reset successful
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password reset successful!'),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      // Handle password reset failure
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to reset password.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  } catch (e) {
    // Handle error
    print(e.toString());
  }
}







   //Alert
   
   void showAlert(QuickAlertType QuickAlertType){
  QuickAlert.show(context : context as BuildContext,
  title: 'Warning',
  text: 'Invalid Credentials',
  type: QuickAlertType);
 }
 

  @override
  Widget build(BuildContext context) {

     return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true, Icons.login_rounded), //let's create a common header widget
            ),
            SafeArea(
              child: Container( 
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),// This will be the login form
                  key: formKey,
                child: Column(
                  children: [

                    
                   Align(
                      alignment:
                          Alignment.topLeft, // Adjust this alignment as needed
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                         // fontWeight: FontWeight.w500,
                          fontSize: 35,
                          color: Color(0xFF8265FB),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                      height: 20,
                    ),
                    Container(
  alignment: Alignment.centerLeft,
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 6,
        offset: Offset(0, 2),
      ),
    ],
  ),
  height: 60,
 
    child:  TextField(
    controller: emailController,
    keyboardType: TextInputType.emailAddress,
    style: TextStyle(
      color: Colors.black87,
    ),
    

    decoration: InputDecoration(
      border: InputBorder.none,
      contentPadding: EdgeInsets.only(top: 8),
      prefixIcon: Container(
        child: Image.asset(
          'lib/images/mail.png',
        ),
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      hintText: 'Email Address',
      hintStyle: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w300,
        fontSize: 20,
        color: Colors.black38,
      ),
    ),
 ),
),
                  //  ),


                    SizedBox(height: 20,),

                    


                    Container(
  alignment: Alignment.centerLeft,
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 6,
        offset: Offset(0, 2),
      ),
    ],
  ),
  height: 60,
  child: TextField(
     controller: passwordController,
     obscureText: true,
     style: TextStyle(
     color: Colors.black87,
      ),
    decoration: InputDecoration(
      border: InputBorder.none,
      contentPadding: EdgeInsets.only(top: 8),
      prefixIcon: Container(
     
      child: Image.asset(
        'lib/images/lock.png',
      ),
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      hintText: 'Password',
      hintStyle: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w300,
        fontSize: 20,
        color: Colors.black38,
      ),
    ),
  ),
),


                    SizedBox(height: 10,),

                     Container(
                      padding: EdgeInsets.symmetric(vertical: 25),
                      width: 158,
                      height: 110,
         child: ElevatedButton(
  onPressed: () {
    String email = emailController.text;
    String password = passwordController.text;
   login(context, emailController.text.toString(), passwordController.text.toString());


   
  //   final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');

  // // Regular expression pattern for validating password
  // final passwordRegex = RegExp(r'^.{4,}$');

  // // Check if email and password match the regex patterns
  // final isEmailValid = emailRegex.hasMatch(email);
  // final isPasswordValid = passwordRegex.hasMatch(password);

  // if (isEmailValid && isPasswordValid) {
   
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => SignUp()),
      
  //   );
  //  // showAlert(QuickAlertType.loading);
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text('Login successful!'),
  //       duration: Duration(seconds: 2),
  //     ),
  //   );
  // } else {
  //   // Display error dialog
  // showAlert(QuickAlertType.error);


  // }
     
  },
  style: ElevatedButton.styleFrom(
    elevation: 5,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    ),
    primary: Color(0xFF7C5CFD), // Set button color to 7C5CFD
  ),
  child: Padding(
    padding: EdgeInsets.only(bottom: 2),
    child: Text(
      'Sign In',
      style: TextStyle(
        color: Colors.white, // Set text color to white
        fontSize: 27, // Set font size to 27
        fontWeight: FontWeight.w400, // Set font weight to regular
        fontFamily: 'Poppins', // Set font family to Poppins
      ),
    ),
  ),
),


                    ),

                   

              Transform.translate(
  offset: Offset(0, -15),
  child: GestureDetector(
    onTap: () {
      String email = emailController.text;
      forgetPassword(context, email);
    },
    child: Container(
      child: Text(
        'Forget Your Password?',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w500,
          fontSize: 13,
          decoration: TextDecoration.underline,
        ),
      ),
    ),
  ),
),



                    SizedBox(height: 40,),
                     Transform.translate(
                           offset: Offset(-40, 0),
                           child : Container(
                           child: Text(
                          'Don’t you have account?',
                           style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          
                          ),
                        ),
                      ),
                     ),
                          

                          Transform.translate(
  offset: Offset(95, -19),
  child: GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignUp()),
      );
    },
    child: Container(
      child: Text(
        'SignUp!',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w700,
          fontSize: 17,
          color: Color(0xFF7C5CFD),
        ),
      ),
    ),
  ),
),



                           SizedBox(height: 20,),


                          Container(
                            width:50 ,
                            height:50 ,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 10,
                                  offset: Offset(0,3),
                                ),
                              ],
                            ),
                           child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                           child: Column(children: [
                          Container(
                            width: 50,
                            height: 50,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 0, left: 0),
                              child: Image.asset('lib/images/Google_Chrome.png'),
                            ),
                          ),
                        ]

                           ),
                           ),
                           ) ,
                          


                          Transform.translate(
                           offset: Offset(-80, -50),
                           child:Container(
                              width:50 ,
                              height:50 ,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 10,
                                    offset: Offset(0,3),
                                  ),
                                ],
                              ),
                             child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                             child: Column(
                              children: [
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 11.0,left: 2),
                                    child: Image.asset('lib/images/twitter.png'),
                                  ),
                                )
                              ],
                             ),
                             ),
                             ),
                          ),




                           Transform.translate(
                           offset: Offset(80, -100),
                           child:Container(
                              width:50 ,
                              height:50 ,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 10,
                                    offset: Offset(0,3),
                                  ),
                                ],
                              ),
                             child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                             child: Column(
                              children: [
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10.0,left: 0),
                                    child: Image.asset('lib/images/facebook.png'),
                                  ),
                                )
                              ],
                             ),
                             ),
                             ),
                          ),
                        
                          
      
                  ],
                ),
              ),
            ),
          ],
      ),
      ),
            );
  }
  }


Future<void> login(BuildContext context, String email, String password) async {
  final url = 'https://bms-back.start-now.fr/public/api/auth/login'; // Replace with your actual login API endpoint

  // Create the request body
 final Map<String, String> formData = {
  'email': email, 
  'password': password, 
};


  try {
    final response = await http.post(Uri.parse(url), body: formData);

    if (response.statusCode == 200) {
      // Successful login, update the UI accordingly (
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignUp()),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login successful!'),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      // Handle login failure, show an error message
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Login Failed'),
          content: Text('Invalid email or password.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        ),
      );
    }
  } catch (e) {
    // Handle any exceptions that occurred during the API call
    print('Error: $e');
  }
}

