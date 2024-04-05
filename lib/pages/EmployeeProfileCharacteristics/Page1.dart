import 'package:bms/pages/widgets/textField.dart';
import 'package:flutter/material.dart';


TextEditingController firstNameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class Page1 extends StatelessWidget {
  
  final Function(String) onUsernameUpdated;

  const Page1({Key? key, required this.onUsernameUpdated}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(children: [
        SizedBox(
          height: 15,
        ),
        TProgress(hintText: "Username", prefix: Icon(Icons.person), controller: firstNameController,
            onUsernameUpdated: onUsernameUpdated,),
        SizedBox(
          height: 15,
        ),
         TProgress(hintText: "Email Addrress", prefix: Icon(Icons.email),  controller: emailController,onUsernameUpdated: onUsernameUpdated,),
          SizedBox(
          height: 15,
        ),
          TProgress(hintText: "Password", prefix: Icon(Icons.password), controller: passwordController,onUsernameUpdated: onUsernameUpdated,)
      ]),
    );
  }
}