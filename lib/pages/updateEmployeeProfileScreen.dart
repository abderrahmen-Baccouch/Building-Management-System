import 'package:bms/pages/EmployeeProfileCharacteristics/Page1.dart';
import 'package:bms/pages/EmployeeProfileCharacteristics/page2.dart';
import 'package:bms/pages/EmployeeProfileCharacteristics/page3.dart';
import 'package:bms/pages/dashboard.dart';
import 'package:bms/pages/employeeProfileScreen.dart';
import 'package:bms/pages/widgets/progress.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';
Future<void> updateUserData(String userId, String newUsername, String newEmail, String newPassword, String newCity, String newPhone, String newIdentification,) async {
  
  final url = 'http://10.0.2.2:8000/api/auth/updateUser/$userId';
  final Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  final Map<String, dynamic> body = {
    'user_name': newUsername,
    'email': newEmail,
    'password': newPassword,
    'user_pre_address': newCity,
    'user_tel': newPhone,
    'user_nid': newIdentification,
    
    // 'user_image' : newImage,
  };

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: json.encode(body),
    );

    if (response.statusCode == 200) {
      print('User data updated successfully.');
    } else {
      print('Failed to update user data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error while updating user data: $e');
  }
}






















class updateEmployeeProfile extends StatefulWidget {
  final String id;
  void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: Duration(seconds: 3), // Set the duration here (3 seconds in this example)
    ),
  );
}

  const updateEmployeeProfile({Key? key, required this.id}) : super(key: key);
  
  @override
  State<updateEmployeeProfile> createState() => _updateEmployeeProfileState();
}

class _updateEmployeeProfileState extends State<updateEmployeeProfile> {
  File? _imageFile;

  void _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

   Future<void> _updateProfilePicture() async {
    if (_imageFile != null) {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('http://your_server_url/updatePicture/${widget.id}'),
      );

      request.files.add(
        await http.MultipartFile.fromPath(
          'user_image',
          _imageFile!.path,
          contentType: MediaType('image', 'jpeg'), // Update with the correct content type
        ),
      );

      try {
        final response = await request.send();
        if (response.statusCode == 200) {
          print('Profile picture updated successfully!');
        } else {
          print('Failed to update profile picture. Status code: ${response.statusCode}');
        }
      } catch (e) {
        print('Error updating profile picture: $e');
      }
    }
  }

  String username = '';
  void handleUsernameUpdate(String newUsername) {
    setState(() {
      username = newUsername;
    });
  }

 void showSnackBar(String message, {String? actionLabel, VoidCallback? onActionPressed}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Container(
        padding: EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                message,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16.0,
                  color: Color.fromARGB(255, 255, 0, 0),
                ),
              ),
            ),
            if (actionLabel != null && onActionPressed != null)
              TextButton(
                onPressed: onActionPressed,
                child: Text(
                  actionLabel,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Color(0xFF8D74F7),
                  ),
                ),
              ),
          ],
        ),
      ),
      backgroundColor: Color.fromARGB(255, 205, 205, 205), // Custom background color
      duration: Duration(seconds: 3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0), // Rounded corners
      ),
      behavior: SnackBarBehavior.floating, // Makes the SnackBar float above content
    ),
  );
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



void handleSaveButtonPressed() {
  String firstName = firstNameController.text;
  String email = emailController.text;
  String password = passwordController.text;
  String city = CityController.text;
  String phone = PhoneController.text;
  String identification = IdentificationController.text;
  String userType = UserTypeController.text;
  String salary = SalaryController.text;

  if (firstName.isNotEmpty && email.isNotEmpty && password.isNotEmpty && city.isNotEmpty && phone.isNotEmpty && identification.isNotEmpty) {
    print("Updated firstName: $firstName");
    print("Updated email: $email");
    print("Updated password: $password");
    print("Updated city: $city");
    print("Updated phone number: $phone");
    print("Updated identification number: $identification");
    print("Updated user type: $userType");
    print("Updated salary: $salary");
    updateUserData(widget.id, firstName, email, password, city, phone, identification);

    showSnackBar('User data updated successfully.');
  } else {
    print("Please fill in all the fields.");
      showSnackBar("Please fill in all the fields.");
    
    
  }
}



final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Transform.translate(
        offset: Offset(0, 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 340.0),
                child: Center(
                  child: Transform.translate(
                    offset: Offset(0, 10),
                    child: Container(
                      margin: EdgeInsets.only(left: 16, top: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                           MaterialPageRoute(
                           builder: (context) => employeeProfileScreen(id: widget.id),
                           ),
                               );
                        },
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Icon(
                            Icons.arrow_back_rounded,
                            color: Color(0xFF8D74F7),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
               Transform.translate(
  offset: Offset(85, -0),
  child: Padding(
    padding: const EdgeInsets.only(top: 0.0, right: 0),
    child: Card(
      elevation: 15.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(),
      ),
      color: Colors.transparent, // Use transparent color as the Card's background
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF8D74F7), Color.fromARGB(255, 199, 167, 255)], // Couleurs en dégradé du foncé au clair
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        padding: EdgeInsets.all(16.0),
        child: Text(
          'To update your profile,\n please provide new informations.',
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
              SizedBox(height: 10),
            Center(
      child: Material(
        elevation: 5,
        shape: CircleBorder(),
        child: Ink(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white,
              width: 4,
            ),
          ),
          child: InkWell(
            onTap: _pickImage, // Call the _pickImage function when tapped
            child: SizedBox(
              width: 120,
              height: 120,
              child: Stack(
                children: [
                  if (_imageFile != null)
                    Positioned.fill(
                      child: ClipOval(
                        child: Image.file(
                          _imageFile!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  if (_imageFile == null) // Show the default image if no image is selected
                    Positioned.fill(
                      child: ClipOval(
                        child: Image.asset(
                          'lib/images/employee.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            blurRadius: 6.0,
                            spreadRadius: 2.0,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: InkWell(
                        onTap: _pickImage,
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          padding: EdgeInsets.only(right: 5), // Adjust padding as needed
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF8D74F7).withOpacity(0.3), // Adjust the opacity to control the highlight
                          ),
                          transform: Matrix4.translationValues(-0.0, 0.0, 0.0), // Apply translation to the left
                          width: 25,
                          child: Icon(
                            Icons.camera,
                            color: Color(0xFF8D74F7),
                            size: 25, // Adjust the size of the icon
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
      ),
    ),
              
              // Add other profile update fields or widgets below
             Transform.translate(
                     offset: Offset(0,-25), // Move towards the left with an offset of 10 pixels
                      child:Container(
  alignment: Alignment.topLeft,
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20 , vertical: 55),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PForm(
          pages: [
            Page1(onUsernameUpdated: handleUsernameUpdate),
            Page2(onUsernameUpdated: handleUsernameUpdate),
            Page3(onUsernameUpdated: handleUsernameUpdate,id: widget.id,),
          ],
          title: [
            PTitle( activeColor: const Color.fromARGB(255, 0, 0, 0),
              title: "Personal Information", subtitle: 'Add your personal information',
            ),
             PTitle( activeColor: const Color.fromARGB(255, 0, 0, 0),
              title: "Address Information", subtitle: 'Add your Address information',
            ),
             PTitle( activeColor: const Color.fromARGB(255, 0, 0, 0),
              title: "Professional Information", subtitle: 'Add your professional information',
            ),
          ],
        ),
      ],
    ),
  ),
),
             ),

Transform.translate(
  offset: Offset(0, -55),
  child: SizedBox(
    width: 350,
    height: 45,
    child: ElevatedButton(
      onPressed: () {
        print(username);
        handleSaveButtonPressed();
      },
      style: ElevatedButton.styleFrom(
        primary: Color(0xFF8D74F7), // The color of the button
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), // Rounded button
        ),
        elevation: 5, // Elevation for the raised effect
        padding: EdgeInsets.only(top: 0), // Button padding
        shadowColor: Colors.grey.withOpacity(0.7), // Box shadow color
        // Add nice hover and splash effects
        onPrimary: Colors.white, // Text color when button is pressed
        textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        side: BorderSide(
          width: 1,
          color: Colors.transparent, // Border color
        ),
      ),
      child: Text(
        'Save', // Button text
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: Colors.white, // Text color
        ),
      ),
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
