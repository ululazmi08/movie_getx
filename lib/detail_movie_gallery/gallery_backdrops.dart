import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_getx/controllers/list_movie_controller.dart';
import 'package:movie_getx/detail_movie_gallery/gallery_detail.dart';

class GalleryBackdropsPage extends StatefulWidget {
  TabController? tabcontrol;

  GalleryBackdropsPage(this.tabcontrol);

  @override
  _GalleryBackdropsPageState createState() => _GalleryBackdropsPageState();
}

class _GalleryBackdropsPageState extends State<GalleryBackdropsPage> {
  final movieC = Get.find<MovieController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Obx(
        () => movieC.isLoadGall.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                child: GridView.builder(
                  // physics: NeverScrollableScrollPhysics(),
                  // crossAxisSpacing: 5,
                  // mainAxisSpacing: 5,
                  // shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 2 / 1,
                    crossAxisCount: 2,
                  ),
                  itemCount: movieC.listBackdrop.length,
                  itemBuilder: (context, index) {
                    var databcd = movieC.listBackdrop[index];
                    return InkWell(
                      onTap: () {
                        Get.to(GalleryDetailPage(databcd.filePath));
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2)),
                        // color: Colors.b,
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(2),
                                    topRight: Radius.circular(2),
                                  ),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          '${movieC.imageUrl}${movieC.listBackdrop[index].filePath}'),
                                      fit: BoxFit.cover),
                                ),
                                // height:,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}
