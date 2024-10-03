import 'package:flutter/material.dart';
import 'package:flutter_application_8/HomeScreen.dart';
import 'package:flutter_application_8/OtherPage.dart';
import 'package:flutter_application_8/bottomNavigationBar.dart';
import 'package:flutter_application_8/colorTask.dart';
import 'package:flutter_application_8/company.dart';

import 'package:flutter_application_8/digitalPage.dart';
import 'package:flutter_application_8/savedPage.dart';
import 'package:flutter_application_8/testToday.dart';
import 'package:flutter_application_8/trending.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TheTest(),
    );
  }
}
