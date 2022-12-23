import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_getx/controllers/list_movie_controller.dart';
import 'package:movie_getx/detail_movie_gallery/gallery_detail.dart';

class GalleryPosterPage extends StatefulWidget {
  TabController? tabcontrol;

  GalleryPosterPage(this.tabcontrol);

  @override
  _GalleryPosterPageState createState() => _GalleryPosterPageState();
}

class _GalleryPosterPageState extends State<GalleryPosterPage> {
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
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1 / 2,
                      crossAxisCount: 2,
                    ),
                    // childAspectRatio: 1 / 2,
                    // shrinkWrap: true,
                    // crossAxisCount: 2,
                    itemCount: movieC.listPosters.length,
                    itemBuilder: (context, index) {
                      var datapst =  movieC.listPosters[index];
                      return InkWell(
                        onTap: () {

                          Get.to(GalleryDetailPage(datapst.filePath));
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
                                            '${movieC.imageUrl}${movieC.listPosters[index].filePath}'),
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
        ));
  }
}
