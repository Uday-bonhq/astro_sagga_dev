import 'package:astro_sagga/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child:  GetMaterialApp(
          title: 'Astro Sagga',
          home: HomeScreen(),
          debugShowCheckedModeBanner: false,
        )
    );
  }
}


