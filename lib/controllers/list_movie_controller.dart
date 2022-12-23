import 'dart:convert' as convert;

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/model_gallery.dart';
import '../model/model_movie_detail.dart';
import '../model/model_movie.dart';

class MovieController extends GetxController {
  var listMovie = <Result>[].obs;
  var movieDetail = MovieDetail().obs;
  var listBackdrop = <Backdrop>[].obs;
  var listPosters = <Posters>[].obs;
  var isLoading = true.obs;
  var isLoadingDetail = true.obs;
  var isLoadGall = true.obs;

  var filter = [];
  var query = ''.obs;
  var isCari = false.obs;
  TextEditingController cari = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getMovie();
    cari.addListener((){
      if(cari.text.isEmpty){
        isCari.value = false;
        query.value = '';
      } else {
        isCari.value = true;
        query.value = cari.text;
        searchMovie();
      }
    });
  }

  // MovieController() {
  //   getMovie();
  //   cari.addListener((){
  //     if(cari.text.isEmpty){
  //       isCari.value = false;
  //       query.value = '';
  //     } else {
  //       isCari.value = true;
  //       query.value = cari.text;
  //       searchMovie();
  //     }
  //   });
  // }

  String baseUrl = "https://api.themoviedb.org/3/movie/";
  String imageUrl = 'https://image.tmdb.org/t/p/w500';

  void getMovie() async {
    listMovie.clear();
    String url =
        baseUrl + 'now_playing?api_key=8e1de2dc50ba06f92a4de60408dad66a';
    final response = await http.get(Uri.parse(url));
    var data = convert.jsonDecode(response.body);
    print(data);
    // List<Movie> _dataMovie =
    //     data.map((data) => Movie.fromJson(data)).toList();
    Movie _dataMovie = Movie.fromJson(data);

    _dataMovie.results!.map((e) {
      listMovie.add(e);
      listMovie.refresh();
    }).toList();
    isLoading.value = false;
  }

  void getDetailMovie(int id) async {
    // movieDetail.value.refresh();
    String url = baseUrl + '$id?api_key=8e1de2dc50ba06f92a4de60408dad66a';
    final response = await http.get(Uri.parse(url));
    var data = convert.jsonDecode(response.body);
    print(data);
    MovieDetail _dataMovieDetail = MovieDetail.fromJson(data);
    movieDetail.value = _dataMovieDetail;
    isLoadingDetail.value = false;
    // MovieDetail(
    //     adult: _dataMovieDetail.adult,
    //     backdropPath: _dataMovieDetail.backdropPath,
    //     belongsToCollection: _dataMovieDetail.belongsToCollection,
    //     budget: _dataMovieDetail.budget,
    //     genres: _dataMovieDetail.genres,
    //     homepage: _dataMovieDetail.homepage,
    //     id: id,
    //     imdbId: _dataMovieDetail.imdbId,
    //     originalLanguage: _dataMovieDetail.originalLanguage,
    //     originalTitle: _dataMovieDetail.originalTitle,
    //     overview: _dataMovieDetail.overview,
    //     popularity: _dataMovieDetail.popularity,
    //     posterPath: _dataMovieDetail.posterPath,
    //     productionCompanies: _dataMovieDetail.productionCompanies,
    //     productionCountries: _dataMovieDetail.productionCountries,
    //     releaseDate: _dataMovieDetail.releaseDate,
    //     revenue: _dataMovieDetail.revenue,
    //     runtime: _dataMovieDetail.runtime,
    //     spokenLanguages: _dataMovieDetail.spokenLanguages,
    //     status: _dataMovieDetail.status,
    //     tagline: _dataMovieDetail.tagline,
    //     title: _dataMovieDetail.title,
    //     video: _dataMovieDetail.video,
    //     voteAverage: _dataMovieDetail.voteAverage,
    //     voteCount: _dataMovieDetail.voteCount),
    // );
    // movieDetail.clear();
    // movieDetail.refresh();
    // isLoading.value = false;
  }

  void getGallery(String id) async {
    listBackdrop.clear();
    listPosters.clear();
    String url =
        baseUrl + '$id/images?api_key=8e1de2dc50ba06f92a4de60408dad66a';
    final response = await http.get(Uri.parse(url));
    var data = convert.jsonDecode(response.body);
    print('Ini data gallery${data}');
    // List<Gallery> _dataGallery = data.map((data) => Gallery.fromJson(data)).toList();
    // Movie _dataMovie = Movie.fromJson(data);
    Gallery _dataGallery = Gallery.fromJson(data);
    Gallery _dataGalleryPosters = Gallery.fromJson(data);

    _dataGallery.backdrops!.map((e) {
      listBackdrop.add(e);
      listBackdrop.refresh();
    }).toList();
    _dataGalleryPosters.posters!.map((e) {
      listPosters.add(e);
      listPosters.refresh();
    }).toList();
    isLoadGall.value = false;
  }

  void searchMovie() async {
    // final result = listMovie.mapMany((e) => e.title.wh)

    filter = [];
    for (int i = 0; i < listMovie.length; i++){
      var item = listMovie[i];
      if (item.title.toLowerCase().contains(query.toLowerCase())){
        filter.add(item);
      }
    }
    // List results = [];
    // if (movieTitle.isEmpty) {
    //   results = listMovie;
    // } else {
    //   results = listMovie
    //       .where((element) => listMovie[0].title
    //           .toString()
    //           .toLowerCase()
    //           .contains(movieTitle.toLowerCase()))
    //       .toList();
    // }
    // foodList.where((food) => food.name.toLowerCase().contains(userInputValue.toLowerCase()).toList();
  }
}
