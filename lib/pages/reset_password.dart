import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

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
class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  bool _passwordVisible = false;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _newPassword = '';
  bool _isFocused = false;
Color _highlightColor = Colors.transparent;

  void resetPassword(BuildContext context, String id, String newPassword) async {
  try {
    final response = await http.put(
          //  http://10.0.2.2:8000/api/resetPassword/$id
      Uri.parse('https://bms-back.start-now.fr/public/api/resetPassword/$id'),
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


  void showAlert(BuildContext context, QuickAlertType quickAlertType) {
    QuickAlert.show(
      context: context,
      title: 'Success',
      text: 'Password has been modified.',
      type: quickAlertType,
    );
  }

  void _submitForm(BuildContext context) {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      if (_passwordController.text.isEmpty || _confirmPasswordController.text.isEmpty) {
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
      } else if (_passwordController.text != _confirmPasswordController.text) {
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
                      color: Colors.red,
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
      } else {


     if (_formKey.currentState!.validate()) {
      setState(() {
        _newPassword = _passwordController.text;
      });
      resetPassword(context, '24', _newPassword);
      showAlert(context, QuickAlertType.success);
    }
   
        
  
      }
    }
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Color(0xFF7C5CFD),
    body: SingleChildScrollView(
      child: Stack(
        children: [
          
          Container(
            width: double.infinity,
            height: 280,
            child: Image.asset(
              'lib/images/Frame 20.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.only(top: 70.0, left: 23),
              child: Container(
                height: 30,
                child: Row(
                  children: [
                    
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Image.asset(
                        'lib/images/reset.png',
                        height: 35,
                        width: 35,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top : 2.0),
                      child: Container(
                        child: Image.asset(
                          'lib/images/Reset_Password2.png',
                        ),
                         height: 85,
                        
                      ),
                    ),
                                      
                  ],
                  
                ),
              ),
              
            ),
            
          ),
          Container(
             child: Transform.translate(
             offset: Offset(30, 120),
             child: Text(
               'Create your new password for BMS so \nyou can login to your account.',
               style: TextStyle(
                 color: Colors.white,
                 fontFamily: 'Poppins',
                 fontSize: 15.0,
                 fontWeight: FontWeight.w400,
                 shadows: [
                   Shadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 5.0,
                   ),
                 ],
               ),
             ),
           ),
           ),
    
           
        Padding(
      padding: const EdgeInsets.only(top: 210.0),
      child: Container(
      width: double.infinity,
      height: 700,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50.0),
          topRight: Radius.circular(50.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.9),
            blurRadius: 10.0,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
         
    
            SizedBox(height: 170.0),
       
 Card(
  elevation: 4.0,
  
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(30.0),
  ),
  child: Column(
    children: [
      SizedBox(height: 16.0),
      Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: 280.0, // Adjust the width as desired
          ),
          child: GestureDetector(
            onTap: () {
              setState(() {
                _isFocused = true;
                _highlightColor = Color(0xFF7C5CFD); // Set the desired highlight color
              });
            },
            onTapCancel: () {
              setState(() {
                _isFocused = false;
                _highlightColor = Colors.transparent;
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: _highlightColor,
              ),
              child: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 12.0, // Increase the vertical padding
                        horizontal: 18.0, // Increase the horizontal padding
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _passwordVisible ? Icons.visibility : Icons.visibility_off,
                          color: Color.fromARGB(255, 164, 144, 255),
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(color: Color(0xFF8D74F7), width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(color: Colors.grey, width: 2.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(color: Colors.red, width: 2.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(color: Colors.red, width: 2.0),
                      ),
                      errorStyle: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    obscureText: !_passwordVisible,
                    onTap: () {
                      setState(() {
                        _isFocused = true;
                        _highlightColor = Color(0xFF8D74F7); // Set the desired highlight color
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        _isFocused = value.isNotEmpty;
                        _highlightColor = Color(0xFF8D74F7); // Set the desired highlight color
                      });
                    },
                    onFieldSubmitted: (value) {
                      setState(() {
                        _isFocused = false;
                        _highlightColor = Colors.transparent;
                      });
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
      SizedBox(height: 16.0),
      Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: 280.0, // Adjust the height as desired
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 10.0,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return TextFormField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 22.0,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible ? Icons.visibility : Icons.visibility_off,
                      color: const Color.fromARGB(255, 164, 144, 255),
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: Color(0xFF8D74F7), width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: Colors.red, width: 2.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: Colors.red, width: 2.0),
                  ),
                  errorStyle: TextStyle(
                    color: Colors.red,
                  ),
                ),
                style: TextStyle(
                  color: Colors.black,
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please confirm your password';
                  }
                  return null;
                },
                obscureText: !_passwordVisible,
              );
            },
          ),
        ),
      ),
      SizedBox(height: 16.0),
    ],
    
  ),
  
),



            SizedBox(height: 140.0),
           Container(
  width: 150.0, // Adjust the width as desired
  height: 55.0, // Adjust the height as desired
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(30.0),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.6),
        blurRadius: 12.0,
        spreadRadius: 2.0,
        offset: Offset(0, 4),
      ),
    ],
  ),
  child: ClipRRect(
    borderRadius: BorderRadius.circular(30.0),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0), // Adjust the blur intensity as desired
      child: Card(
        elevation: 2.0,
        color: Color(0xFF8D74F7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: ElevatedButton(
            onPressed: () {
              _submitForm(context);
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              minimumSize: Size(double.infinity, 30.0),
              elevation: 0.0,
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom : 8.0),
              child: Text(
                'Update',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.normal,
                  fontSize: 16.0,
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  ),
),

          ],
        ),
      ),
      ),
    ),
     
     Transform.translate(
                     offset: Offset(-4,2),
                     child : Padding(
      padding: const EdgeInsets.only(top: 260.0, right: 20),
      child: Card(
      elevation: 15.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          // topRight: Radius.circular(16.0),
          // bottomRight: Radius.circular(16.0),
        ),
      ),
      color: Color(0xFF8D74F7), // Couleur spécifique de votre choix
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Your identity has been verified!\nSet a new password',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Montserrat-Regular',
            fontWeight: FontWeight.w400,
            fontSize: 16.0,
            color: Color.fromARGB(255, 222, 222, 222),
            shadows: [
              Shadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 2.0,
              ),
            ],
          ),
        ),
      ),
      ),
    ),
     ),
    
        ],
      ),
    ),
  );
}






}

void main() {
  runApp(MaterialApp(
    home: ResetPasswordScreen(),
  ));
}
