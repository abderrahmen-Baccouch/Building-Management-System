// This widget will draw header section of all page. Wich you will get with the project source code.

// ignore_for_file: prefer_const_constructors, unnecessary_new, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:bms/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HeaderWidgetSignUp extends StatefulWidget {
  final double _height;
  final bool _showIcon;
  final IconData _icon;

  const HeaderWidgetSignUp(this._height, this._showIcon, this._icon, {Key? key}) : super(key: key);

  @override
  _HeaderWidgetState createState() => _HeaderWidgetState(_height, _showIcon, _icon);
}

class _HeaderWidgetState extends State<HeaderWidgetSignUp> {
  double _height;
  bool _showIcon;
  IconData _icon;

  _HeaderWidgetState(this._height, this._showIcon, this._icon);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;

    return Container(
      child: Stack(
        children: [
          ClipPath(
            child: Container(
             
              decoration: new BoxDecoration(
                gradient: new LinearGradient(
                    colors: [
                      Color(0xFF8D74F7).withOpacity(0.4),
                      Color(0xFF7C5CFD).withOpacity(0.4),
                    ],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp
                ),
              ),
            ),
            clipper: new ShapeClipper(
                [
                  Offset(width / 5, _height),
                  Offset(width / 10 * 5, _height - 60),
                  Offset(width / 5 * 4, _height + 20),
                  Offset(width, _height - 18)
                ]
            ),
          ),
          ClipPath(
            child: Container(
              decoration: new BoxDecoration(
                gradient: new LinearGradient(
                    colors: [
                      Color(0xFF8D74F7).withOpacity(0.4),
                      Color(0xFF7C5CFD).withOpacity(0.4),
                    ],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp
                ),
              ),
            ),
            clipper: new ShapeClipper(
                [
                  Offset(width / 3, _height + 20),
                  Offset(width / 10 * 8, _height - 60),
                  Offset(width / 5 * 4, _height - 60),
                  Offset(width, _height - 20)
                ]
            ),
          ),
          ClipPath(
            child: Container(
              decoration: new BoxDecoration(
                gradient: new LinearGradient(
                    colors: [
                     Color(0xFF8D74F7),
                     Color(0xFF7C5CFD),
                    ],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp
                ),
              ),
            ),
            clipper: new ShapeClipper(
                [
                  Offset(width / 5, _height),
                  Offset(width / 2, _height - 40),
                  Offset(width / 5 * 4, _height - 80),
                  Offset(width, _height - 20)
                ]
            ),
          ),
          Visibility(
            visible: _showIcon,
            child: Container(
              height: _height - 40,
              child: Center(
                child: Container(
                  margin: EdgeInsets.all(20),
                  // ignore: prefer_const_constructors
                  padding: EdgeInsets.only(
                    left: 5.0,
                    top: 20.0,
                    right: 5.0,
                    bottom: 20.0,
                  ),
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(20),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                      topRight: Radius.circular(100),
                      bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60),
                    ),
                    
                 
                 //   border: Border.all(width: 5, color: Colors.white),
                  ),
                  
           


child: Transform.translate(
  offset: Offset(0, 0),
  child: Positioned(
    top: _height - 200, // Adjust the position as needed
    left: -10, // Move towards the left with an offset of 10 pixels
    right: 0,
    child: Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Stack(
        children: [
          Image.asset(
            'lib/images/vbuilding.png',
            width: 450, // Increase the width value to make the image bigger
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 140, top: 45),
            child: Image.asset(
              'lib/images/logo.png',
              width: 70, // Adjust the width as needed
              fit: BoxFit.contain, // Adjust the fit property if necessary
            ),
          ),
          Transform.translate(
            offset: Offset(0, 120), // Adjust the offset value as needed
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 115.0, top: 15),
                child: Stack(
                  children: [
                    // Image.asset(
                    //   'lib/images/istockplus.png',
                    //   height: 100, // Adjust the height as needed
                    //   width: 100, // Adjust the width as needed
                    // ),
                   Positioned(
            top: 0, 
            left: 0, 
            child: Transform.translate(
              offset: Offset(-130, -130),
              child: GestureDetector(
              onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),  // Exception caught by widgets library ═════════Incorrect use of ParentDataWidget.

              );
              },
              child: Image.asset(
              'lib/images/arrow.png',
              width: 25, 
              fit: BoxFit.contain, 
              ),
              ),


            ),
                   ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  ),
),


      
                ),
              ),
            ),
          ),
       


   Transform.translate(
    offset: Offset(-60,0), // Move towards the left with an offset of 10 pixels
    child: Positioned(
      top: _height - 170, // Adjust the position as needed
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.only(right: 0), // Set the right padding to 10 pixels
        child: Container(
          alignment: Alignment.centerRight, // Align the text towards the right side
         child: Text(
            'Building Management System',
           style: TextStyle(
              color: Color.fromARGB(255, 205, 205, 205),
              fontFamily: 'Poppins',
              fontSize: 13,
            ),
          ),
        ),
      ),
    ),
 ),

// Transform.translate(
//   offset: Offset(-230,-5), // Move towards the left with an offset of 10 pixels
//   child: Positioned(
//     top: _height - 170, // Adjust the position as needed
//     left: 0,
//     right: 0,
//     child: Padding(
//       padding: EdgeInsets.only(right: 10), // Set the right padding to 10 pixels
//       child: Container(
//         alignment: Alignment.centerRight, // Align the text towards the right side
//         child: Text(
//           'BMS',
//           style: TextStyle(
//             color: const Color.fromARGB(255, 0, 0, 0),
//             fontFamily: 'Montserrat',
//             fontSize: 18,
//           ),
//         ),
//       ),
//     ),
//   ),
// ),




        


        ],
      ),
      
    );
  }
}

class ShapeClipper extends CustomClipper<Path> {
  List<Offset> _offsets = [];
  ShapeClipper(this._offsets);
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height-20);

    // path.quadraticBezierTo(size.width/5, size.height, size.width/2, size.height-40);
    // path.quadraticBezierTo(size.width/5*4, size.height-80, size.width, size.height-20);

    path.quadraticBezierTo(_offsets[0].dx, _offsets[0].dy, _offsets[1].dx,_offsets[1].dy);
    path.quadraticBezierTo(_offsets[2].dx, _offsets[2].dy, _offsets[3].dx,_offsets[3].dy);

    // path.lineTo(size.width, size.height-20);
    path.lineTo(size.width, 0.0);
    path.close();


    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}