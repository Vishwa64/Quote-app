import 'package:codes/style.dart';
import 'package:flutter/material.dart';

Widget loading(){
  return Center(
    child: LinearProgressIndicator(
      backgroundColor: Colors.black87,
      valueColor: AlwaysStoppedAnimation(backgroundColor),
      minHeight: 20,
    ),
  );
}

Widget errorMessage(String error){
  return Center(
    child: Text(
      "$error",
      style:
      TextStyle(fontSize: 23, color: primaryColor),
    ),
  );
}

Widget quoteCenter(String? quote,author){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "$quote",
        style: TextStyle(fontSize: 23, color: primaryColor),
      ),
      SizedBox(
        height: 35,
      ),
      Align(
          alignment: Alignment.centerRight,
          child: Text("$author",
              style: TextStyle(
                  fontSize: 25,
                  color: primaryColor,
                  fontWeight: FontWeight.bold)))
    ],
  );
}