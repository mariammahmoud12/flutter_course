import 'package:flutter/material.dart';

Widget DefaultButton(
   {
     required Function function,
  Color background = Colors.teal,
  double width = double.infinity,
      required String text,
     isUpperCase = true,
}) =>
    Container(
      width: width,
      height: 50.0,
      color: background,
      child: MaterialButton(
        onPressed: (){function();},
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.0
          ),
        ),
      ),
    );


Widget DefaultFormFeild({
  required TextEditingController controller,
  required TextInputType type,
  required String label,
  required prefix,
  bool isPassword = false,
  IconData? suffix,
  Function? suffisPressed,
  required Function validate,
}) =>
    TextFormField(
  controller: controller,
  keyboardType: type,
  obscureText: isPassword,
  validator: (s)
  {
    validate(s);
    },
  decoration: InputDecoration(
    labelText: label,
    prefixIcon:Icon(
      prefix,
    ),
    suffixIcon: suffix != null ? IconButton(
      icon: Icon(suffix),
      onPressed:suffisPressed!(),
    ) : null,
    border:const OutlineInputBorder(),
  ),
);