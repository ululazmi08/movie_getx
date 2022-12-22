import 'package:flutter/material.dart';
import 'package:movie_getx/detail_movie_gallery/gallery_detail.dart';

class GalleryPosterPage extends StatefulWidget {
  TabController? tabcontrol;

  GalleryPosterPage(this.tabcontrol);

  @override
  _GalleryPosterPageState createState() => _GalleryPosterPageState();
}

class _GalleryPosterPageState extends State<GalleryPosterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Container(
        child: GridView.count(
          // physics: NeverScrollableScrollPhysics(),
          // crossAxisSpacing: 5,
          // mainAxisSpacing: 5,
          childAspectRatio: 1 / 2,
          // shrinkWrap: true,
          crossAxisCount: 2,
          children: List.generate(
            10,
            (index) {
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => GalleryDetailPage()));
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
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(2),
                              topRight: Radius.circular(2),
                            ),
                            color: Colors.grey,
                          ),
                          child: FlutterLogo(),
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
