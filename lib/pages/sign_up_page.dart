// ignore_for_file: prefer_const_constructors

import 'dart:ui';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:bms/pages/dashboard.dart';
import 'package:bms/pages/login_page.dart';
import 'package:bms/pages/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:quickalert/quickalert.dart';
import 'widgets/header_widget.dart';
import 'widgets/header_widget_sign_up.dart';

class SignUp extends StatefulWidget{
  const SignUp({Key? key}): super(key:key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<SignUp>{

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController  = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
    TextEditingController _confirmPasswordController = TextEditingController();

  double _headerHeight = 250;
 // Key _formKey = GlobalKey<FormState>();
void _submitForm() {
  if (_formKey.currentState != null && _formKey.currentState!.validate()) {
    // Form is valid, proceed with navigation or further actions
    // Replace the below code with your desired navigation logic
    if (_firstNameController.text.isEmpty ||
        _lastNameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Sign Up'),
            content: Text('Please fill in all the fields'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } 

else if (_passwordController.text != _confirmPasswordController.text) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        title: Text(
          'Sign Up',
          style: TextStyle(
            fontSize: 18.0,
            //fontWeight: FontWeight,
            color: Color(0xFF8D74F7),
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Password and Confirm Password must match',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.red, // Change the text color to red
              ),
            ),
          ],
        ),
        actions: [
           ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF8D74F7),
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text('OK'),
              ),
        ],
      );
    },
  );
}






     else {
      showAlert(QuickAlertType.loading);
      Future.delayed(Duration(seconds: 3), () {
//        Navigator.push(
//   context,
//   MaterialPageRoute(builder: (context) => DashboardPage(id: id)),
// );

      });
    }
  }
}

  
   //Alert
   
   void showAlert(QuickAlertType QuickAlertType){
  QuickAlert.show(context : context as BuildContext,
  title: 'Success',
  text: 'Welcome to BMS',
  type: QuickAlertType);
  // ignore: unused_label
  //uration: Duration(seconds: 2);
 }
 

  @override
  Widget build(BuildContext context) {

     return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                height: _headerHeight,
                child: HeaderWidgetSignUp(_headerHeight, true, Icons.login_rounded),
                 //let's create a common header widget
              ),
        
        
              SafeArea(
                child: Container( 
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 10),// This will be the login form
                  child: Column(
                    children: [
        
        
        //istockplus
        
        
        
        
                      
                     Transform.translate(
                     offset: Offset(0,-25), // Move towards the left with an offset of 10 pixels
                      child:Align(
                        alignment:
                            Alignment.topLeft, // Adjust this alignment as needed
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontFamily: 'Poppins-Light',
                           // fontWeight: FontWeight.normal,
                            fontSize: 35,
                            color: Color(0xFF8265FB),
                          ),
                        ),
                      ),
                     ),
        
        
        
        
        
                         Transform.translate(
                     offset: Offset(0,-10), // Move towards the left with an offset of 10 pixels
                      child:Padding(
                          padding: const EdgeInsets.only(right: 170.0),
                          child: Container(
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
                          width: 170,
                          child: TextFormField(
                            controller: _firstNameController,
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                              color: Colors.black87,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 10),
                              prefixIcon: Container(
                                child: Image.asset(
                                  'lib/images/user.png',
                                ),
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                              hintText: 'FirstName',
                              hintStyle: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w300,
                                fontSize: 20,
                                color: Colors.black38,
                              ),
                            ),
                            validator: (value) {
                                if (value?.isEmpty ?? true) {
                                  return ' Please enter your first name';
                                }
                                return null;
                              },
                          
                          ),
                          
                                            ),
                        ),
                  ),
        
        
                        Transform.translate(
                     offset: Offset(0,-70), // Move towards the left with an offset of 10 pixels
                      child:Padding(
                          padding: const EdgeInsets.only( left : 170),
                          child: Container(
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
                          width: 170,
                          child: TextFormField(
                            controller: _lastNameController,
                            keyboardType: TextInputType.text,
                      
                            style: TextStyle(
                              color: Colors.black87,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 10),
                              prefixIcon: Container(
                                child: Image.asset(
                                  'lib/images/user.png',
                                ),
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                              hintText: 'LastName',
                              hintStyle: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w300,
                                fontSize: 20,
                                color: Colors.black38,
                              ),
                            ),
                            validator: (value) {
            if (value?.isEmpty ?? true) {
              return ' Please enter your last name';
            }
            return null;
          },
                          ),
                                            ),
                        ),
                        ),
        
        
        
        
                  
                    Transform.translate(
                     offset: Offset(0,-50), // Move towards the left with an offset of 10 pixels
                      child:Container(
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
                        child: TextFormField(
                          controller: _emailController,
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
                      validator: (value) {
        if (value == null || value.isEmpty) {
          return ' Please enter your email address';
        }
        if (!isValidEmail(value)) {
          return ' Please enter a valid email address';
        }
        return null;
      },
                        ),
                      ),
                    ),
        
                     
        
                      
        
        
                      Transform.translate(
                     offset: Offset(0,-30), // Move towards the left with an offset of 10 pixels
                      child:Container(
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
                        child: TextFormField(
                          controller: _passwordController,
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
                          validator: (value) {
            if (value?.isEmpty ?? true) {
              return ' Please enter your password';
            }
            return null;
          },
                        ),
                      ),
                      ),
        
        
        
        
        
                          Transform.translate(
                     offset: Offset(0,-10), // Move towards the left with an offset of 10 pixels
                      child:Container(
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
                        child: TextFormField(
                          controller:_confirmPasswordController,
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
                            hintText: 'Confirm Password',
                            hintStyle: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w300,
                              fontSize: 20,
                              color: Colors.black38,
                            ),
                          ),
                          validator: (value) {
            if (value?.isEmpty ?? true) {
              return ' Please confirm your password';
            }
            return null;
          },
                        ),
                      ),
                          ),
        
        
                     
                          Transform.translate(
                     offset: Offset(0,-10), // Move towards the left with an offset of 10 pixels
                      child:Container(
                        padding: EdgeInsets.symmetric(vertical: 25),
                        width: 158,
                        height: 110,
                        child: ElevatedButton(
                          onPressed: () {
        
                            _submitForm();
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => DashboardPage()),
                            // );
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            primary:
                                Color(0xFF7C5CFD), // Set button color to 7C5CFD
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(bottom:2),
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Colors.white, // Set text color to white
                                fontSize: 27, // Set font size to 27
                                fontWeight: FontWeight.w400, // Set font weight to regular
                                fontFamily:
                                    'Poppins', // Set font family to Poppins
                              ),
                            ),
                          ),
                        ),
                      ),
                      ),
        
                     
        
                       Transform.translate(
                             offset: Offset(0,-10),
                             child : Container(
                             child: Text(
                            'Sign Up with social account!',
                             style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: const Color.fromARGB(255, 101, 101, 101),
                            
                            ),
                          ),
                        ),
                       ),
                            
        
                        SizedBox(height: 5,),
        
        
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
      ),
            );
  }
  }


  bool isValidEmail(String email) {
  // Regular expression pattern for email validation
  final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');
  return emailRegex.hasMatch(email);
}
