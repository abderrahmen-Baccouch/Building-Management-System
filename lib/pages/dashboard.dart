import 'package:bms/Models/CDM.dart';
import 'package:bms/pages/employeeProfileScreen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:bms/Constants/Constants.dart';

import '../Widgets/Widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashboardPage extends StatefulWidget {
   final String id;
   

  DashboardPage({required this.id});
  
  @override
  _DashboardPageState createState() => _DashboardPageState();
  
  
}

class _DashboardPageState extends State<DashboardPage> {

    List<String> data = [
  'item 1',
  'item 2',
  'item 3',
  'item 4',
  
  // Add more items as needed
];

Widget _buildItemList(BuildContext context, int index) {
  if (index == data.length)
    return Center(
      child: CircularProgressIndicator(),
    );

  if (index == 0) {
    return Container(
      width: 150,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        color: Colors.transparent,
        child: Container(
          width: 163,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF7367f0),
                Color(0xFF9C8AF8),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Image(
                  image: AssetImage('lib/images/visitors.png'),
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
              ),
              Transform.translate(
                offset: Offset(0, 8),
                child: Image(
                  image: AssetImage('lib/images/Visitors1.png'),
                  width: 70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  } else if (index == 1) {
    return Container(
      width: 150,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 8,
        color: Colors.transparent,
        child: Container(
          width: 163,
          height: 159,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 117, 83, 255),
                Color.fromARGB(255, 136, 114, 193),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Image(
                  image: AssetImage('lib/images/todojob.png'),
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              Transform.translate(
                offset: Offset(0, 6),
                child: Image(
                  image: AssetImage('lib/images/Complains2.png'),
                  width: 100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  } else if (index == 2) {
    return Container(
      width: 150,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 4,
          color: Colors.transparent,
          child: Container(
            width: 163,
            height: 159,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF8D74F7),
                  Color(0xFFA78EF7),
                ],
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25.0, left: 10),
                  child: Image(
                    image: AssetImage('lib/images/tenantIcon.png'),
                    width: 55,
                    height: 55,
                    fit: BoxFit.cover,
                  ),
                ),
                Transform.translate(
                  offset: Offset(0, 6),
                  child: Image(
                    image: AssetImage('lib/images/Tenant1.png'),
                    width: 70,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  } else if (index == 3) {
    return Container(
      width: 150,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        color: Color(0xFF7C5CFD),
        child: Container(
          width: 163,
          height: 159,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Image(
                  image: AssetImage('lib/images/complains.png'),
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              Transform.translate(
                offset: Offset(0, 10),
                child: Image(
                  image: AssetImage('lib/images/To Do Jobs.png'),
                  width: 100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  } else {
    return Container();
  }
}


  int currentIndex = 0;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }
  final GlobalKey<_ComplexDrawerState> complexDrawerKey = GlobalKey<_ComplexDrawerState>();
 final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


void _openComplexDrawer() {
  // Implement your logic to open the ComplexDrawer
  // For example, you can use a GlobalKey to access the ComplexDrawer's state and set its isExpanded property to true.
  // For this example, I assume the ComplexDrawer is part of the same widget tree.
  setState(() {
    complexDrawerKey.currentState?.expandOrShrinkDrawer();
  });
}
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
  drawer: ComplexDrawer(key: complexDrawerKey),
  appBar: PreferredSize(
    preferredSize: Size.fromHeight(70),
    child: AppBar(
      automaticallyImplyLeading: false, 
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),  
      ),
      leading: Padding(
        padding: const EdgeInsets.only(left: 12.0, top: 10),
        child: InkWell(
            onTap: () {
              scaffoldKey.currentState?.openDrawer();
            },
            child: Container(
              height: 45,
              alignment: Alignment.center,
              child: Transform.scale(
                scale: 1.3,
                child: Image.asset(
                  'lib/images/menu.png',
                ),
              ),
            ),
          ),
      
),



          actions: [
            GestureDetector(
              onTap: () {
               
              },
            child: GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => employeeProfileScreen(id : widget.id),
      ),
    );
  },
  child: Transform.translate(
    offset: Offset(-12, 1),
    child: Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage('lib/images/employee.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    ),
  ),
),

            ),
          ],
          title: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0, top: 35.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  
                  Text(
                    'Ali', // Add your desired title text here
                      style: TextStyle(
                      fontFamily: 'Montserrat-Medium',
                      fontWeight: FontWeight.w400,
                      fontSize: 21,
                      color: Color(0xFF7E5EFD),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(0, -5),
                    child: Text(
                      'Employee',
                      style: TextStyle(
                        fontFamily: 'Montserrat-Light',
                       fontWeight: FontWeight.w300,
                        fontSize: 16,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                  Transform.translate(
                   offset: Offset(-85,-45), // Move towards the left with an offset of 10 pixels
                    child:Image.asset(
  'lib/images/moon.png',
  width: 25, 
  height: 25, 
  fit: BoxFit.cover,
),),

                ],
              ),
            ),
          ),
        ),
      ),




 body: SingleChildScrollView(
   child: Transform.translate(
    offset: Offset(0, 20),
    child: Column(
      children: [
        Container(
          height: 126,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(115, 103, 240, 0.7),
                Color(0xFF7367f0),
                
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              transform: GradientRotation(118 * 3.14159 / 180),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.translate(
                offset: Offset(0, -10),
                child: Image.asset(
                  'lib/images/logo_dash.png',
                  // Other image properties
                ),
              ),
              Transform.translate(
                offset: Offset(0, -3),
                child:Text(
                'Welcome Employee, Ali',
                  style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),),
             
                Transform.translate(
                offset: Offset(0, 9),
                child: Text(
                  'Enjoy your tour',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height : 20 ),
        Container(
                child: Column(
                  children: [
                   CarouselSlider.builder(
  itemCount: data.length,
  itemBuilder: (BuildContext context, int index, _) =>
    _buildItemList(context, index),
  options: CarouselOptions(
    height: 160,
   // Adjust the height according to your needs
    viewportFraction: 0.4,
    enlargeCenterPage: true,
    enableInfiniteScroll: true,
    autoPlay: true,
  ),
),

                  ],
                ),
              ),
 
 
       SingleChildScrollView(
        scrollDirection: Axis.vertical,
    child: Column(
      children: [
        SizedBox(height: 20),

        //////////
        Transform.translate(
  offset: Offset(0, 20),
  child: Container(
    width: 375,
    height: 175,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 10,
          offset: Offset(0, 2),
        ),
      ],
    ),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 8,
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromARGB(255, 228, 247, 255),
            ),
            child: Center(
              child: Image.asset(
                'lib/images/dollarl.png',
                width: 25,
                height: 25,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top : 22.0),
              child: Text(
                '0',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 8),
           Text('User ID: ${widget.id}'),
            Text(
              'Salary Statement',
              style: TextStyle(
                fontFamily: 'Geologico',
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(top : 8.0),
              child: Text(
                'See More',
                style: TextStyle(
                  color: Color(0xff471AFF),
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  ),
),



        
        SizedBox(height: 20),
      Transform.translate(
  offset: Offset(0, 20),
  child: Container(
    width: 375,
    height: 175,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 10,
          offset: Offset(0, 2),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          child: Transform.translate(
            offset: Offset(0, 8),
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 228, 247, 255),
              ),
              child: Center(
                child: Image.asset(
                  'lib/images/usersl.png',
                  width: 25,
                  height: 25,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 5),
        Transform.translate(
          offset: Offset(0, 10),
          child: Text(
            '12',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 8),
        Transform.translate(
          offset: Offset(0, 13),
          child: Text(
            'Total Tenant',
            style: TextStyle(
              fontFamily: 'Geologico',
              fontSize: 20,
              fontWeight: FontWeight.w300,
              color: Colors.grey[700],
            ),
          ),
        ),
        SizedBox(height: 8),
        Transform.translate(
          offset: Offset(0, 23),
          child: Text(
            'See More',
            style: TextStyle(
              color: Color(0xff471AFF),
              fontSize: 20,
            ),
          ),
        ),
      ],
    ),
  ),
),


   
 
   SizedBox(height: 20),
  Transform.translate(
  offset: Offset(0, 20),
  child: Container(
    width: 375,
    height: 175,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 10,
          offset: Offset(0, 2),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          child: Transform.translate(
            offset: Offset(0, 8),
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 255, 225, 186),
              ),
              child: Center(
                child: Image.asset(
                  'lib/images/monitor.png',
                  width: 30,
                  height: 30,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 5),
        Transform.translate(
          offset: Offset(0, 10),
          child: Text(
            '0',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 8),
        Transform.translate(
          offset: Offset(0, 13),
          child: Text(
            'Committee Member',
            style: TextStyle(
              fontFamily: 'Geologico',
              fontSize: 20,
              fontWeight: FontWeight.w300,
              color: Colors.grey[700],
            ),
          ),
        ),
        SizedBox(height: 8),
        Transform.translate(
          offset: Offset(0, 23),
          child: Text(
            'See More',
            style: TextStyle(
              color: Color(0xff471AFF),
              fontSize: 20,
            ),
          ),
        ),
      ],
    ),
  ),
),


        SizedBox(height: 20),
        Transform.translate(
  offset: Offset(0, 20),
  child: Container(
    width: 375,
    height: 175,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(5),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 10,
          offset: Offset(0, 2),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          child: Transform.translate(
            offset: Offset(0, 8),
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 255, 220, 220),
              ),
              child: Center(
                child: Image.asset(
                  'lib/images/usersl.png',
                  width: 25,
                  height: 25,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 5),
        Transform.translate(
          offset: Offset(0, 10),
          child: Text(
            '0',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 8),
        Transform.translate(
          offset: Offset(0, 13),
          child: Text(
            'Salary Statement',
            style: TextStyle(
              fontFamily: 'Geologico',
              fontSize: 20,
              fontWeight: FontWeight.w300,
              color: Colors.grey[700],
            ),
          ),
        ),
        SizedBox(height: 8),
        Transform.translate(
          offset: Offset(0, 23),
          child: Text(
            'See More',
            style: TextStyle(
              color: Color(0xff471AFF),
              fontSize: 20,
            ),
          ),
        ),
      ],
    ),
  ),
),

        SizedBox(height: 50),
      ],
    ),
 ),


//  SingleChildScrollView(
//   scrollDirection: Axis.horizontal,
//   child: Row(
//     children: [
//       SizedBox(
//         width: 20,
//       ),
//       Card(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20),
//           side: BorderSide(color: Color(0xFF7367f0)),
//         ),
//         elevation: 4,
//         color: Colors.white,
//         child: Container(
//           width: 163,
//           height: 159,
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 40.0),
//                 child: Image(
//                   image: AssetImage('lib/images/visitors.png'),
//                   height: 50,
//                   width: 50,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Transform.translate(
//                 offset: Offset(0, 10),
//                 child: Text(
//                   'Visitors',
//                   style: TextStyle(
//                     fontSize: 22,
//                     fontFamily: 'Montserrat',
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       SizedBox(
//         width: 20,
//       ),
//       Card(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20),
//           side: BorderSide(color: Color(0xFF7367f0),),
//         ),
//         elevation: 4,
//         color: Colors.white,
//         child: Container(
//           width: 163,
//           height: 159,
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 40.0),
//                 child: Image(
//                   image: AssetImage('lib/images/complains.png'),
//                   width: 50,
//                   height: 50,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Transform.translate(
//                 offset: Offset(0, 10),
//                 child: Text(
//                   'Complains',
//                   style: TextStyle(
//                     fontSize: 22,
//                     fontFamily: 'Montserrat',
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       SizedBox(
//         width: 20,
//       ),
//       Card(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20),
//           side: BorderSide(color: Color(0xFF7367f0),),
//         ),
//         elevation: 4,
//         color: Colors.white,
//         child: Container(
//           width: 163,
//           height: 159,
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 40.0),
//                 child: Image(
//                   image: AssetImage('lib/images/todojob.png'),
//                   width: 50,
//                   height: 50,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Transform.translate(
//                 offset: Offset(0, 10),
//                 child: Text(
//                   'To Do Jobs',
//                   style: TextStyle(
//                     fontSize: 22,
//                     fontFamily: 'Montserrat',
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       SizedBox(
//         width: 20,
//       ),
//     ],
//   ),
// ),

SizedBox(height: 20,),



],
),
),
),
  
  backgroundColor: Color.fromARGB(255, 224, 224, 224),

      bottomNavigationBar: Container(
      width: size.width,
      height: 80,
      child: Stack(
        // overflow: Overflow.visible,
        children: [
          CustomPaint(

            size: Size(size.width, 80),
            painter: BNBCustomPainter(),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            
            child:  Transform.translate(
              offset: Offset(0, -15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.work,
                      size: 27,
                      color: currentIndex == 0 ? Color(0xFF8D74F7) : Colors.grey.shade400,
                    ),
                    onPressed: () {
                      setBottomBarIndex(0);
                    },
                    splashColor: Colors.white,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.settings,
                      size: 27,
                      color: currentIndex == 1 ? Color(0xFF8D74F7) : Colors.grey.shade400,
                    ),
                    onPressed: () {
                      setBottomBarIndex(1);
                    },
                  ),
                  Container(
                    width: size.width * 0.20,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.feedback,
                      size: 27,
                      color: currentIndex == 2 ? Color(0xFF8D74F7) : Colors.grey.shade400,
                    ),
                    onPressed: () {
                      setBottomBarIndex(2);
                    },
                  ),
                 InkWell(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => employeeProfileScreen(id :widget.id),
      ),
    );
  },
  child: IconButton(
    icon: Icon(
      Icons.person,
      size: 27,
      color: currentIndex == 3 ? Color(0xFF8D74F7) : Colors.grey.shade400,
    ),
    onPressed: () {
      setBottomBarIndex(3);
      Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => employeeProfileScreen(id: widget.id,),
      ),
    );
    },
  ),
),

                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: size.width / 2 - 20,
            child: Transform.translate(
              offset: Offset(-8, -35), // Adjust the offset to move the icon higher
              child: FloatingActionButton(
                backgroundColor: Color(0xFF8D74F7),
                child: Icon(Icons.dashboard),
                elevation: 0.1,
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    ),


      // bottomNavigationBar: CurvedNavigationBar(
      // backgroundColor: Colors.white,
      //   color:Color(0xFF7367f0),// Color(0xff7350FF),
      //   animationDuration: Duration(milliseconds: 300),
      //   items: [
      //         Icon(Icons.settings, color: Colors.white, size: 32.0),
             
      //         Icon(Icons.home, color: Colors.white, size: 32.0),
             
      //         Icon(Icons.person, color: Colors.white, size: 32.0),

      //   ],
      // ),


    );
  }
}


class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 20); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20), radius: Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class ComplexDrawer extends StatefulWidget {
  const ComplexDrawer({Key? key}) : super(key: key);

  @override
  _ComplexDrawerState createState() => _ComplexDrawerState();
}

class _ComplexDrawerState extends State<ComplexDrawer> {
  int selectedIndex = -1; //dont set it to 0

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      child: row(),
      //color: Colorz.compexDrawerCanvasColor,
    );
  }

  Widget row() {
    return Row(children: [
      isExpanded ? blackIconTiles() : blackIconMenu(),
      invisibleSubMenus(),
    ]);
  }

  Widget blackIconTiles() {
    return Container(
      width: 200,
      color: Colorz.complexDrawerBlack,
      child: Column(
        children: [
          controlTile(),
          Expanded(
            child: ListView.builder(
              itemCount: cdms.length,
              itemBuilder: (BuildContext context, int index) {
                //  if(index==0) return controlTile();

                CDM cdm = cdms[index];
                bool selected = selectedIndex == index;
                return ExpansionTile(
                    onExpansionChanged: (z) {
                      setState(() {
                        selectedIndex = z ? index : -1;
                      });
                    },
                    leading: Icon(cdm.icon, color: Colors.white),
                    title: Txt(
                      text: cdm.title,
                      color: Colors.white,
                    ),
                    trailing: cdm.submenus.isEmpty
                        ? null
                        : Icon(
                            selected ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                            color: Colors.white,
                          ),
                    children: cdm.submenus.map((subMenu) {
                      return sMenuButton(subMenu, false);
                    }).toList());
              },
            ),
          ),
          accountTile(),
        ],
      ),
    );
  }

  Widget controlTile() {
    return Padding(
  padding: EdgeInsets.only(top: 20, bottom: 30),
  child: ListTile(
    leading:  Image.asset(
  'lib/images/moon3.png',
  width: 25, 
  height: 25, 
  fit: BoxFit.cover,
),
    title: Padding(
      padding: const EdgeInsets.only(top : 12.0),
      child: Container(
        width: 50, // Set the desired width
        height: 50, // Set the desired height
        child: Padding(
          padding: const EdgeInsets.only(bottom : 4, right : 55.0),
          child: Image.asset(
            'lib/images/logo.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
    ),
    onTap: expandOrShrinkDrawer,
  ),
);


  }

  Widget blackIconMenu() {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      width: 100,
      color: Colorz.complexDrawerBlack,
      child: Column(
        children: [
          controlButton(),
          Expanded(
            child: ListView.builder(
                itemCount: cdms.length,
                itemBuilder: (contex, index) {
                  // if(index==0) return controlButton();
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      height: 45,
                      alignment: Alignment.center,
                      child: Icon(cdms[index].icon, color: Colors.white),
                    ),
                  );
                }),
          ),
          accountButton(),
        ],
      ),
    );
  }

  Widget invisibleSubMenus() {
    // List<CDM> _cmds = cdms..removeAt(0);
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      width: isExpanded ? 0 : 125,
     // color: Colorz.compexDrawerCanvasColor,
      child: Column(
        children: [
          Container(height: 95),
          Expanded(
            child: ListView.builder(
                itemCount: cdms.length,
                itemBuilder: (context, index) {
                  CDM cmd = cdms[index];
                  // if(index==0) return Container(height:95);
                  //controll button has 45 h + 20 top + 30 bottom = 95

                  bool selected = selectedIndex == index;
                  bool isValidSubMenu = selected && cmd.submenus.isNotEmpty;
                  return subMenuWidget([cmd.title]..addAll(cmd.submenus), isValidSubMenu);
                }),
          ),
        ],
      ),
    );
  }

  Widget controlButton() {
    return Padding(
      padding: EdgeInsets.only(top: 20, bottom: 30),
      child: InkWell(
        onTap: expandOrShrinkDrawer,
        child: Container(
          height: 80,
          alignment: Alignment.center,
          child: Image.asset(
        'lib/images/LogoBMS.png', // Replace this with the actual path to the image
        width: 500, // Set the width here
        height: 500, // Set the height here
      ),
        ),
      ),
    );
  }

  Widget subMenuWidget(List<String> submenus, bool isValidSubMenu) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      height: isValidSubMenu ? submenus.length.toDouble() * 37.5 : 45,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: isValidSubMenu ? Color.fromARGB(255, 102, 83, 177): Colors.transparent,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(8),
            bottomRight: Radius.circular(8),
          )),
      child: ListView.builder(
          padding: EdgeInsets.all(6),
          itemCount: isValidSubMenu ? submenus.length : 0,
          itemBuilder: (context, index) {
            String subMenu = submenus[index];
            return sMenuButton(subMenu, index == 0);
          }),
    );
  }

  Widget sMenuButton(String subMenu, bool isTitle) {
    return InkWell(
      onTap: () {
        //handle the function
        //if index==0? donothing: doyourlogic here
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Txt(
          text: subMenu,
          fontSize: isTitle ? 17 : 14,
          color: isTitle ? Colors.white : Colors.grey,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget accountButton({bool usePadding = true}) {
    return Padding(
      padding: EdgeInsets.all(usePadding ? 8 : 0),
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: Colors.white70,
          image: DecorationImage(
            image: AssetImage('lib/images/employee.jpg'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }

  Widget accountTile() {
    return Container(
      color: Color(0xFF7C5CFD),
      child: ListTile(
        leading: accountButton(usePadding: false),
        title: Txt(
          text: "abderrahmen",
          color: Colors.white,
        ),
        subtitle: Txt(
          text: "Employee",
          color: Colors.white70,
        ),
      ),
    );
  }

  static List<CDM> cdms = [
    // CDM(Icons.grid_view, "Control", []),

    CDM(Icons.grid_view, "Dashboard", []),
    CDM(FontAwesomeIcons.exclamationCircle, "Complains", ["Add Complain","Delete Complain ",""]),
    CDM(FontAwesomeIcons.person, "Visitors", ["Add Visitor","Delete Visitor"]),
    CDM(Icons.pie_chart, "Analytics", []),
    CDM(Icons.settings, "Setting", []),

    CDM(FontAwesomeIcons.home, "Tenant", ["Add Tenant", "Delete Tenant"]),
    CDM(FontAwesomeIcons.tasks, "To Do Jobs", []),
    CDM(Icons.logout, "Log Out", []),
  ];

  void expandOrShrinkDrawer() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }
}