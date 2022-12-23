import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_getx/controllers/list_movie_controller.dart';
import 'package:movie_getx/detail_movie.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final movieC = Get.find<MovieController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('TMDb'),
      ),
      body: Obx(
        () => Column(
          children: [
            SizedBox(
              height: 50,
              child: TextFormField(
                controller: movieC.cari,
                decoration: const InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                  // fillColor: Colors.black,
                  // filled: true,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  suffixIcon: Icon(Icons.close_rounded),
                  // IconButton(
                  //   icon: Icon(Icons.close_rounded),
                  //   onPressed: () {
                  //     this.setState(() {
                  //       movieC.cari.clear();
                  //     });
                  //   },
                  // ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                    borderSide: BorderSide.none,
                  ),
                ),
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
            Expanded(
                child: movieC.isLoading.value
                    ? Center(child: CircularProgressIndicator())
                    : movieC.isCari.value == false
                        ? Container(
                            color: Colors.grey.shade200,
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 1 / 2,
                              ),
                              itemCount: movieC.listMovie.length,
                              // shrinkWrap: true,
                              itemBuilder: (context, index) {
                                var data = movieC.listMovie[index];
                                return InkWell(
                                  onTap: () async {
                                    movieC.getDetailMovie(data.id);
                                    await Get.to(
                                      () => DetailMoviePage(),
                                      // binding: BindingsBuilder(() {
                                      //   Get.put(MovieController());
                                      // }),
                                    );

                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(2)),
                                    // color: Colors.b,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft: Radius.circular(2),
                                                    topRight:
                                                        Radius.circular(2),
                                                  ),
                                                  color: Colors.grey,
                                                ),
                                                child: Image.network(
                                                  '${movieC.imageUrl}${movieC.listMovie[index].posterPath}',
                                                  fit: BoxFit.cover,
                                                ),
                                                height: 195,
                                                // height:,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          // mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${movieC.listMovie[index].title}',
                                              style: TextStyle(fontSize: 15),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              '${movieC.listMovie[index].releaseDate?.year}',
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  color: Colors.grey),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        : Container(
                            color: Colors.grey.shade200,
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 1 / 2,
                              ),
                              itemCount: movieC.filter.length,
                              // shrinkWrap: true,
                              itemBuilder: (context, index) {
                                var datafltr = movieC.filter[index];
                                return InkWell(
                                  onTap: () async {
                                    movieC.getDetailMovie(datafltr.id);
                                    await Get.to(
                                      () => DetailMoviePage(),
                                      // binding: BindingsBuilder(() {
                                      //   Get.put(MovieController());
                                      // }),
                                    );
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(2)),
                                    // color: Colors.b,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft: Radius.circular(2),
                                                    topRight:
                                                        Radius.circular(2),
                                                  ),
                                                  color: Colors.grey,
                                                ),
                                                child: Image.network(
                                                  '${movieC.imageUrl}${datafltr.posterPath}',
                                                  fit: BoxFit.cover,
                                                ),
                                                height: 195,
                                                // height:,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          // mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${datafltr.title}',
                                              style: TextStyle(fontSize: 15),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              '${datafltr.releaseDate?.year}',
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  color: Colors.grey),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          )),
          ],
        ),
      ),
    );
  }
}
