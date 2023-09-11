import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_2/pages/clock_page/clock_page.dart';
import 'package:project_2/utils/app_image.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(225),
      child: Container(
        width: 200,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Center(
          child: Text(
            'Change background',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}
