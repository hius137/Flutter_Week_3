import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project_2/pages/clock_page/clock_page.dart';
import 'package:project_2/pages/menu_page/menu_page.dart';
import 'package:project_2/pages/setting_page/setting_page.dart';
import 'package:project_2/utils/app_image.dart';

class HomePage extends StatefulWidget {
  final File? urlImage;

  const HomePage({super.key, this.urlImage});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController controller = PageController();
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    controller.jumpToPage(index);
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: widget.urlImage != null
            ? BoxDecoration(
                image: DecorationImage(
                  image: _buildBackgroundImage(),
                  fit: BoxFit.fill,
                ),
              )
            : const BoxDecoration(),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            _currentIndex = index;
          },
          children: const [
            ClockPage(),
            MenuPage(),
            SettingPage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              AppImage.icClock,
              width: 20,
              height: 20,
            ),
            label: 'Clock',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AppImage.icMenu,
              width: 20,
              height: 20,
            ),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AppImage.icSetting,
              width: 20,
              height: 20,
            ),
            label: 'Setting',
          ),
        ],
      ),
    );
  }

  ImageProvider<Object> _buildBackgroundImage() {
    if (kIsWeb) {
      return NetworkImage(widget.urlImage!.path);
    }
    return FileImage(widget.urlImage!);
  }
}
