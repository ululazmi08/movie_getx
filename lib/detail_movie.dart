import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_getx/controllers/list_movie_controller.dart';
import 'package:movie_getx/detail_movie_gallery/gallery.dart';
import 'package:movie_getx/model/model_movie.dart';
import 'package:movie_getx/model/model_movie_detail.dart';

class DetailMoviePage extends StatelessWidget {
  int data;
  DetailMoviePage(this.data);
  // final movieC = Get.find<MovieController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.orange,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.0),
        child: AppBar(),
      ),
      body: GetBuilder<MovieController>(
          init: MovieController(),
          // initState: (controller) => controller.getDetailMovie,
          builder: (controller) {
            if (controller.movieDetail.id == null){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    // alignment: Alignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            image: DecorationImage(
                                image: NetworkImage(
                                    '${controller.imageUrl}${controller.movieDetail.posterPath}'),
                                fit: BoxFit.cover)),
                        height: 1000,
                        // child: Image.network('${movieC.imageUrl}${movieC.movieDetail.posterPath}',),
                      ),
                      Positioned(
                        top: 350,
                        left: 15,
                        right: 15,
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 15, right: 30, top: 30, bottom: 30),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${controller.movieDetail.title}',
                                // maxLines: 2,
                                style: TextStyle(fontSize: 20),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.date_range_rounded,
                                    color: Colors.black.withOpacity(0.4),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    '${controller.movieDetail.releaseDate?.year}',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black.withOpacity(0.4),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_city,
                                    color: Colors.black.withOpacity(0.4),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                    child: Text(
                                      '${controller.movieDetail.homepage}',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black.withOpacity(0.4),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.vpn_lock_rounded,
                                    color: Colors.black.withOpacity(0.4),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                    child: Text(
                                      '${controller.movieDetail.overview}',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black.withOpacity(0.4),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15),
                              Text(
                                'TAGLINE',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(height: 5),
                              Text(
                                '${controller.movieDetail.tagline}',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black.withOpacity(0.8),
                                ),
                              ),
                              SizedBox(height: 15),
                              Text(
                                'GENRE',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black.withOpacity(0.8),
                                ),
                              ),
                              SizedBox(height: 5),
                              Container(
                                height: 80,
                                child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  // scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount:
                                  controller.movieDetail.genres?.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            '- ${controller.movieDetail.genres?[index].name}'),
                                        SizedBox(height: 5)
                                      ],
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 325,
                        right: 30,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => GalleryPage()));
                          },
                          child: CircleAvatar(
                            child: Text('Hai'),
                          ),
                        ),
                      ),
                      Positioned(
                        // top: 20,
                        // left: 5,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_rounded,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
