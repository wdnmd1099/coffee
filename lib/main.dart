import 'package:flutter/material.dart';
import 'screen/bottomNavigationBar.dart';


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Named Routes Demo',
      initialRoute: '/bottomNavigationBar',
      routes: {
        '/bottomNavigationBar': (context) => const bottomNavigationBar(),
      },
    ),
  );
}


