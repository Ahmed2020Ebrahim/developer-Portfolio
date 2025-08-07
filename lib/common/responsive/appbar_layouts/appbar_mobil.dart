import 'package:flutter/material.dart';

class AppbarMobil extends StatelessWidget {
  const AppbarMobil({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Ahmed Ebrahim',
          style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),

        centerTitle: true,
      ),
    );
  }
}
