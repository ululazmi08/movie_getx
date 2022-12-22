import 'package:flutter/material.dart';
import 'package:movie_getx/detail_movie_gallery/gallery_backdrops.dart';
import 'package:movie_getx/detail_movie_gallery/gallery_poster.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage>
    with SingleTickerProviderStateMixin {
  TabController? tabcontrol;

  @override
  void initState() {
    tabcontrol = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabcontrol?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Gallery'),
          bottom: TabBar(
            controller: tabcontrol,
            tabs: [
              Container(
                height: 30,
                child: Text('BACKDROPS'),
              ),
              Container(
                height: 30,
                child: Text('POSTERS'),
              )
            ],
          ),
        ),
        body: Container(
          child: TabBarView(
            controller: tabcontrol,
            children: [
              GalleryBackdropsPage(tabcontrol),
              GalleryPosterPage(tabcontrol),
            ],
          ),
        ));
  }
}
