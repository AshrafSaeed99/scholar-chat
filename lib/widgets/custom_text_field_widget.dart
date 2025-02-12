import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
 const CustomTextFieldWidget({super.key, required this.labelText, this.onChanged, this.validator});
  final String labelText;
  final Function(String data)? onChanged;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onChanged: onChanged,
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.white, width: 1.0),
        ),
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.white, fontSize: 18.0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
          borderSide: BorderSide(color: Colors.white, width: 2.0),
        ),
      ),
    );
  }
}
