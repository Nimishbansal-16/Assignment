import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void toast(String data){
  Fluttertoast.showToast(
    msg: data,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.grey,
    textColor: Colors.white
  );
}