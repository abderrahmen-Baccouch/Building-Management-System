import 'package:bms/model/userModel.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:ui';
import 'package:bms/pages/dashboard.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../plugin.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'updateEmployeeProfileScreen.dart';


class employeeProfileScreen extends StatefulWidget {
  final String id;

  employeeProfileScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<employeeProfileScreen> createState() => _employeeProfileScreenState();
   

}

class _employeeProfileScreenState extends State<employeeProfileScreen> {
 
  int currentIndex = 0;
 
 
  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }
  dynamic x;

  final storage = FlutterSecureStorage();

  List <UserModel>? Myuser = [];
  dynamic name,image,mail,phone ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // getUser();

  }

  Future<String> getUserSalary(id) async {
  final response = await http.get(Uri.parse('http://10.0.2.2:8000/api/auth/getUser/$id'));

  if (response.statusCode == 200) {
    final userData = jsonDecode(response.body);
    return userData['user_salary'].toString();
  } else {
    throw Exception('Failed to get user');
  }
}


  Future<String> getUserType(id) async {
  final response = await http.get(Uri.parse('http://10.0.2.2:8000/api/auth/getUser/$id'));

  if (response.statusCode == 200) {
    final userData = jsonDecode(response.body);
    return userData['user_type'];
  } else {
    throw Exception('Failed to get user');
  }
}


  Future<String> getUserPreAddress(id) async {
  final response = await http.get(Uri.parse('http://10.0.2.2:8000/api/auth/getUser/$id'));

  if (response.statusCode == 200) {
    final userData = jsonDecode(response.body);
    return userData['user_pre_address'];
  } else {
    throw Exception('Failed to get user');
  }
}


  Future<String> getUserPhoneNumber(id) async {
  final response = await http.get(Uri.parse('http://10.0.2.2:8000/api/auth/getUser/$id'));

  if (response.statusCode == 200) {
    final userData = jsonDecode(response.body);
    return userData['user_tel'];
  } else {
    throw Exception('Failed to get user');
  }
}

Future<String> getUserImage(id) async {
  final response = await http.get(Uri.parse('http://10.0.2.2:8000/api/auth/getUser/$id'));

  if (response.statusCode == 200) {
    final userData = jsonDecode(response.body);
    return userData['user_image']; // Assuming the key for the user image URL is 'user_image'
  } else {
    throw Exception('Failed to get user');
  }
}


  Future<String> getUserEmail(id) async {
  final response = await http.get(Uri.parse('http://10.0.2.2:8000/api/auth/getUser/$id'));

  if (response.statusCode == 200) {
    final userData = jsonDecode(response.body);
    return userData['email'];
  } else {
    throw Exception('Failed to get user');
  }
}


Future<String> getUsername(id) async {
  final response = await http.get(Uri.parse('http://10.0.2.2:8000/api/auth/getUser/$id'));
   
  if (response.statusCode == 200) {
    final userData = jsonDecode(response.body);
    return userData['user_name'];
  } else {
    throw Exception('Failed to get user');
  }
}

Widget buildUsernameWidget(id) {
  return FutureBuilder<String>(
    future: getUsername(id),
    builder: (context, snapshot) {
     if (snapshot.connectionState == ConnectionState.waiting) {
  return Center(
    child: SpinKitFadingCircle(
      color: Color.fromARGB(255, 126, 72, 234),
      size: 50.0,
    ),
  );
}
      else if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      } else {
        final username = snapshot.data;
        return Align(
          alignment: Alignment(-0.7, -0.45),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: Colors.white,
            child: Container(
              width: 100,
              height: 30,
              child: Center(
                child: Text(
                  username!,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        );
      }
    },
  );
}

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return  Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Transform.translate(
                    offset: Offset(5, 50),
                    child: SizedBox(
                      width: 370,
                      height: 200,
                      child: Card(
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: OverflowBox(
                            alignment: Alignment.bottomCenter,
                            maxHeight: 300,
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    offset: Offset(0, 4),
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: Image.asset(
                                'lib/images/ppp.jpeg',
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
            ],
          ),
         
    Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 70, left: 30),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 6,
          child: FutureBuilder<String>(
            future: getUserImage(widget.id), // Call the function to get the user image
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // While waiting for the image to load, show a placeholder or a loading indicator
                return Container(
                  width: 130,
                  height: 150,
                  child: SpinKitFadingCircle(color: Color.fromARGB(255, 126, 72, 234),
            size: 50.0,),
                );
              } 
              if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(
          child: SpinKitFadingCircle(
            color: Color.fromARGB(255, 126, 72, 234),
            size: 50.0,
          ),
        );
      }
              
              else if (snapshot.hasError) {
                // If there's an error while fetching the image, show an error message or a default image
                return Container(
                  width: 130,
                  height: 150,
                  child: Text('Error loading image'),
                );
              } else {
                // If the image is successfully loaded, use it in the DecorationImage
                final userImage = snapshot.data;
                if (userImage!.isNotEmpty) {
                  return Container(
                    width: 130,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage('lib/images/$userImage'), // Use AssetImage to load the user image
                        fit: BoxFit.cover,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          offset: Offset(0, 4),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                  );
                } else {
                  // If the user image filename is empty or invalid, show a placeholder or a default image
                  return Container(
                    width: 130,
                    height: 150,
                    child: Image.asset('lib/images/employee.jpg'), // Use a default image as a placeholder
                  );
                }
              }
            },
          ),
        ),
      ),
    ),

Align(
  alignment: Alignment(-0.7, -0.45),
  child: buildUsernameWidget(widget.id),
),
Transform.translate(
  offset: Offset(55, 300), // Adjust the offset values as needed
  child: Container(
    width: 300,
    height: 100,
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 232, 229, 255),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.4),
          offset: Offset(0, 4),
          blurRadius: 4,
        ),
      ],
    ),
    child: Stack(
      children: [
        Positioned(
          left: 150, // Position the line in the middle by adjusting this value
          top: 0,
          bottom: 0,
          width: 1, // Width of the vertical line
          child: Container(
            color: Colors.grey, // Color of the vertical line
          ),
        ),
        Positioned.fill(
          child: Center(
  child: Padding(
    padding: const EdgeInsets.only(bottom: 0, left: 150.0),
    child: FutureBuilder<String>(
      future: getUserSalary(widget.id),
       builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(
          child: SpinKitFadingCircle(
            color: Color.fromARGB(255, 126, 72, 234),
            size: 50.0,
          ),
        );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final userSalary = snapshot.data;
          return Text(
            userSalary!,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          );
        }
      },
    ),
  ),
),
        ),
         Positioned.fill(
          child:Center(
  child: Padding(
    padding: const EdgeInsets.only(top: 0, right: 150.0),
    child: FutureBuilder<String>(
      future: getUserType(widget.id),
      builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(
          child: SpinKitFadingCircle(
            color: Color.fromARGB(255, 126, 72, 234),
            size: 50.0,
          ),
        );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final userType = snapshot.data;
          String userTypeText = '';
          if (userType == 'E') {
            userTypeText = 'Employee';
          } else if (userType == 'O') {
            userTypeText = 'Owner';
          }
          return Text(
            userTypeText,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          );
        }
      },
    ),
  ),
),
        ),
      ],
    ),
  ),
),
  Positioned(
  top: 280,
  left: 260,
  child: Container(
    width: 40,
    height: 40,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          offset: Offset(0, 2),
          blurRadius: 6,
        ),
      ],
    ),
    child: Stack(
      alignment: Alignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.attach_money,
            color: Color(0xFF7C5CFD),
            size: 26,
          ),
          splashRadius: 28,
          padding: EdgeInsets.all(0),
        ),
        
      ],
    ),
  ),
),

      
  
           Positioned(
           top: 500,
            left: 50,
            child: Container(
            width: 40,
            height: 40,
             decoration: BoxDecoration(
             shape: BoxShape.circle,
             color: Colors.white,
              boxShadow: [
                BoxShadow(
              color: Colors.black.withOpacity(0.2),
                  offset: Offset(0, 2),
                   blurRadius: 6,
                 ),
              ],
            ),
            child: IconButton(
              onPressed: () {
                // Handle camera icon button press
              },
             icon: Icon(
               Icons.camera_alt,
                color: Color(0xFF7C5CFD),
                size: 25,
              ),
              splashRadius: 28,
             padding: EdgeInsets.all(0),
            ),
           ),
       ),

       

          Positioned(
  top: 85,
  left: 330,
  child: Container(
    width: 40,
    height: 40,
    decoration: BoxDecoration(
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(10), // Added radius of 10
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          offset: Offset(0, 2),
          blurRadius: 6,
        ),
      ],
    ),
    child: IconButton(
      onPressed: () {
       Navigator.push(
     context,
     MaterialPageRoute(
      builder: (context) => updateEmployeeProfile(id: widget.id),
     ),
   );
 // updateEmployeeProfile()
      },
      icon: Icon(
        Icons.edit,
        color: Color(0xFF7C5CFD),
        size: 25,
      ),
      splashRadius: 28,
      padding: EdgeInsets.all(0),
    ),
  ),
),


       

     
 Positioned(
  top: 280,
  left: 110,
  child: Container(
    width: 40,
    height: 40,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          offset: Offset(0, 2),
          blurRadius: 6,
        ),
      ],
    ),
    child: Stack(
      alignment: Alignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.verified_user,
            color: Color(0xFF7C5CFD),
            size: 23,
          ),
          splashRadius: 28,
          padding: EdgeInsets.all(0),
        ),
        
      ],
    ),
  ),
),

//                        *****************

Align(
  alignment: Alignment.center,
  child: Padding(
    padding: const EdgeInsets.only(top :400.0),
    child: Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      color: Colors.white,
      
      child: Container(
        width: 380,
        height: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              offset: Offset(0, 4),
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

            
           Positioned(
  top: 50,
  left: 10,
  child: Transform.translate(
    offset: Offset(-135, -30), // Ajustez les valeurs selon vos besoins
    child: Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset(0, 2),
            blurRadius: 6,
          ),
        ],
      ),
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.email,
          color: Color(0xFF7C5CFD),
          size: 25,
        ),
        splashRadius: 28,
        padding: EdgeInsets.all(0),
      ),
    ),
  ),
),
Positioned(
  top: 100,
  left: 0,
  child: Transform.translate(
    offset: Offset(-175, -105), // Ajustez les valeurs selon vos besoins
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       
        SizedBox(height: 10),
       Transform.translate(
  offset: Offset(170, 35),
  child: FutureBuilder<String>(
    future: getUserEmail(widget.id),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(
          child: SpinKitFadingCircle(
            color: Color.fromARGB(255, 126, 72, 234),
            size: 50.0,
          ),
        );
      } else if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      } else {
        final userEmail = snapshot.data;
        return Text(
          userEmail!,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 17,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        );
      }
    },
  ),
),
       Transform.translate(
  offset: Offset(170, 85),
  child: FutureBuilder<String>(
    future: getUserPhoneNumber(widget.id),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(
          child: SpinKitFadingCircle(
            color: Color.fromARGB(255, 126, 72, 234),
            size: 50.0,
          ),
        );
      } else if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      } else {
        final userPhoneNumber = snapshot.data;
        return Text(
          userPhoneNumber!,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 17,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        );
      }
    },
  ),
),
        
      ],
      
    ),
  ),
),


         Positioned(
  top: 400,
  left: 10,
  child: Transform.translate(
    offset: Offset(-135,25),
    child: Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset(0, 2),
            blurRadius: 6,
          ),
        ],
      ),
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.place,
          color: Color(0xFF7C5CFD),
          size: 25,
        ),
        splashRadius: 28,
        padding: EdgeInsets.all(0),
      ),
    ),
  ),
),
Transform.translate(
  offset: Offset(-70, -5),
  child: Positioned(
    top: 395,
    left: 20,
    child: Padding(
      padding: const EdgeInsets.only(right :0.0),
      child: FutureBuilder<String>(
        future: getUserPreAddress(widget.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: SpinKitFadingCircle(
                color: Color.fromARGB(255, 126, 72, 234),
                size: 50.0,
              ),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final userPreAddress = snapshot.data;
            return Text(
              userPreAddress!,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 17,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            );
          }
        },
      ),
    ),
  ),
),


        Positioned(
  top: 400,
  left: 10,
  child: Transform.translate(
    offset: Offset(-135, -110),
    child: Column(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: Offset(0, 2),
                blurRadius: 6,
              ),
            ],
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.phone,
              color: Color(0xFF7C5CFD),
              size: 25,
            ),
            splashRadius: 28,
            padding: EdgeInsets.all(0),
          ),
        ),
        SizedBox(height: 10),
        
      ],
    ),
  ),
),


            SizedBox(height: 10),
            // Ajoutez ici le contenu supplémentaire de la carte
          ],
        ),
        
      ),
    ),
    
  ),
),
       
        
      
        ],
        
        
      ),

       

backgroundColor: Color.fromARGB(255, 238, 238, 238),
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
        builder: (context) => employeeProfileScreen(id: widget.id),
      ),
    );
  },
  child: IconButton(
    icon: Icon(
      Icons.person,
      size: 27,
      color: currentIndex == 3 ? Colors.grey.shade400 : Color(0xFF8D74F7),
    ),
    onPressed: () {
      setBottomBarIndex(3);
      Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => employeeProfileScreen(id: widget.id),
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
               onPressed: () {
 Navigator.push(
     context,
     MaterialPageRoute(
      builder: (context) => DashboardPage(id: widget.id),
     ),
   );


},

              ),
            ),
          ),
        ],
      ),

      
    ),


    
    );
    
  }






   Future getUser() async {
    final storage = FlutterSecureStorage();
    String? id = await storage.read(key: "id");
    print(id);


    var client = http.Client();
    final uri = Uri.parse("${Plugin.getUser}/$id");
    print(uri);
    var response = await client.get(
        uri, headers: {"Accept": "application/json"});
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);

      print(jsonData);
      print(jsonData['email']);

      // for (var data in jsonData) {
      setState(() {


        Myuser!.add(x = UserModel(
            userId: jsonData['user_id'],
            buildingId: jsonData['building_id'],
            userType: jsonData['user_type'],
            userName: jsonData ['user_name'],
            email: jsonData ['email'],
            userTel: jsonData['user_tel'],
            userImage: jsonData['user_image'],
            userPreAddress: jsonData['user_pre_address'],
            userPerAddress: jsonData['user_per_address'],
            userNid: jsonData['user_per_address'],
            userDesignation: jsonData['user_designation'],
            userDateCreation: DateTime.parse(jsonData['user_date_creation']),
            userEndingDate: DateTime.parse (jsonData['user_ending_date']),
            userStatus: jsonData['user_status'],
            userCurrlang: jsonData['user_currlang'],
            userMemberType: jsonData['user_member_type'],
            createdAt: DateTime.parse(jsonData['created_at']),
            updatedAt:  DateTime.parse(jsonData['updated_at'])));
      });
      print("the user name" + x.userName);
      final  Name_user=x.userName ;
      await storage.write(key: "Name", value: Name_user);
      final  Mail_user=x.email ;
      print("my mail"+Mail_user);
      await storage.write(key: "Mail", value: Mail_user);
      final image_user=x.userImage ;
      print (image_user);
      await storage.write(key: "image", value: image_user);
      print(x.userTel);
      setState(() {
        name = x.userName ;
        image= x.userImage;
        mail=x.email ;
        phone=x.userTel;
      });
      print ("this is my name :"+name);
      print(image);



      //}

    }
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
