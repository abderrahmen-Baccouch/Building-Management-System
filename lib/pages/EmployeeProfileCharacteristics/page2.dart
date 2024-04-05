import 'package:bms/pages/widgets/textField.dart';
import 'package:flutter/material.dart';
import 'package:bms/pages/widgets/textField.dart';
import 'package:flutter/material.dart';




TextEditingController CityController = TextEditingController();
TextEditingController PhoneController = TextEditingController();
TextEditingController IdentificationController = TextEditingController();
class Page2 extends StatelessWidget {
    final Function(String) onUsernameUpdated;

  const Page2({Key? key, required this.onUsernameUpdated}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(children: [
        SizedBox(
          height: 15,
        ),
        TProgress(hintText: "City", prefix: Icon(Icons.location_city), controller: CityController,onUsernameUpdated: onUsernameUpdated,),
        SizedBox(
          height: 15,
        ),
         TProgress(hintText: "Phone Number", prefix: Icon(Icons.phone), controller: PhoneController,onUsernameUpdated: onUsernameUpdated,),
          SizedBox(
          height: 15,
        ),
         TProgress(hintText: "Identification Number", prefix: Icon(Icons.credit_card), controller: IdentificationController,onUsernameUpdated: onUsernameUpdated,),
        
      ]),
    );
  }
}