import 'package:bms/pages/widgets/textField.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:bms/pages/widgets/textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
Future<void> updateUsername(String userId, String newUsername) async {
  final url = 'http://10.0.2.2:8000/api/auth/updateUser/$userId';
  final Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  final Map<String, String> body = {
    'user_name': newUsername,
  };

  final response = await http.put(
    Uri.parse(url),
    headers: headers,
    body: json.encode(body),
  );

  if (response.statusCode == 200) {
    print('Username updated successfully.');
  } else {
    print('Failed to update username. Status code: ${response.statusCode}');
  }
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

TextEditingController UserTypeController = TextEditingController();
TextEditingController SalaryController = TextEditingController();
class Page3 extends StatelessWidget {
  
  final String id;


    final Function(String) onUsernameUpdated;

  const Page3({Key? key, required this.onUsernameUpdated,required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(children: [
        SizedBox(
          height: 15,
        ),
        FutureBuilder<String>(
      future: getUserType(id),
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
          return Card(
  elevation: 4, // Adjust the elevation to your liking
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8),
  ),
  child: Padding(
    padding: EdgeInsets.all(12),
    child: Row( // Use Stack if you want the icon to overlay the text
      children: [
        Icon(
          Icons.work, // Replace this with the desired icon
          color: Color.fromARGB(255, 175, 158, 255), // Replace this with the desired icon color
          size: 24, // Replace this with the desired icon size
        ),
        SizedBox(width: 8), // Add some spacing between the icon and the text
        Text(
          userTypeText,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
          ),
        ),
      ],
    ),
  ),
);

        }
      },
    ),
        SizedBox(
          height: 10,
        ),
          FutureBuilder<String>(
      future: getUserSalary(id),
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
          return Card(
  elevation: 4, // Adjust the elevation to your liking
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8),
  ),
  child: Padding(
    padding: EdgeInsets.all(12),
    child: Row(
      children: [
        Icon(
          Icons.money, // Replace this with the desired icon
          color: Color.fromARGB(255, 175, 158, 255), // Replace this with the desired icon color
          size: 24, // Replace this with the desired icon size
        ),
        SizedBox(width: 8), // Add some spacing between the icon and the text
        Text(
          userSalary!,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
          ),
        ),
      ],
    ),
  ),
);
 
        }
      },
    ),
      
      ]),
    );
  }
}