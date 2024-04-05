import 'package:flutter/material.dart';

class TProgress extends StatelessWidget {
  late String hintText;
  late Widget prefix ;
  final Function(String) onUsernameUpdated;
   late TextEditingController controller;
  TProgress({required this.controller,required this.hintText, required this.prefix, required this.onUsernameUpdated});
  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF8D74F7)),
        color: Colors.grey.withOpacity(.3),
        borderRadius: BorderRadius.circular(15)
      ), 
      child: TextFormField(
        controller: controller,
        onChanged: (value) {
          onUsernameUpdated(value); // Call the onUsernameUpdated function when text changes
        },
        decoration: InputDecoration(
          prefixIcon: prefix,
          hintText: hintText,
          border: OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }
}