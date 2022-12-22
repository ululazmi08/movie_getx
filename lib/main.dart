import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_getx/controller_bindings.dart';
import 'package:movie_getx/controllers/list_movie_controller.dart';
import 'package:movie_getx/detail_movie.dart';
import 'package:movie_getx/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // final movieC = Get.put(MovieController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ControllerBindings(),
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomePage(),
      // getPages: [
      //   GetPage(
      //     name: '/',
      //     page: () => HomePage(),
      //     binding: BindingsBuilder(() {
      //       Get.put(MovieController());
      //     }),
      //   ),
      //   // GetPage(name: '/detail', page: () => DetailMoviePage())
      // ],
    );
  }
}
