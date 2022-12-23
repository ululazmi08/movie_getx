import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_getx/controllers/list_movie_controller.dart';

class GalleryDetailPage extends StatelessWidget {
  var data;
  GalleryDetailPage(this.data);

  @override
  Widget build(BuildContext context) {
    final movieC = Get.find<MovieController>();
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image.network('${movieC.imageUrl + data}'),
      ),
    );
  }
}
