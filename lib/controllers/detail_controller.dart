// import 'dart:convert' as convert;
// import 'package:get/get.dart';
// import 'package:movie_getx/controllers/list_movie_controller.dart';
// import 'package:http/http.dart' as http;
// import 'package:movie_getx/model/model_movie_detail.dart';
//
// class DetailController extends GetxController{
//   var c = MovieController();
//   var movieDetail = MovieDetail();
//   MovieDetail? idMovie;
//
//   DetailController(){
//     getDetailMovie();
//   }
//
//
//   void getDetailMovie() async {
//     String url = c.baseUrl + '$id?api_key=8e1de2dc50ba06f92a4de60408dad66a';
//     final response = await http.get(Uri.parse(url));
//     var data = convert.jsonDecode(response.body);
//     print(data);
//     MovieDetail _dataMovieDetail = MovieDetail.fromJson(data);
//     movieDetail = _dataMovieDetail;
//     isLoadingDetail.value = false;
//     // MovieDetail(
//     //     adult: _dataMovieDetail.adult,
//     //     backdropPath: _dataMovieDetail.backdropPath,
//     //     belongsToCollection: _dataMovieDetail.belongsToCollection,
//     //     budget: _dataMovieDetail.budget,
//     //     genres: _dataMovieDetail.genres,
//     //     homepage: _dataMovieDetail.homepage,
//     //     id: id,
//     //     imdbId: _dataMovieDetail.imdbId,
//     //     originalLanguage: _dataMovieDetail.originalLanguage,
//     //     originalTitle: _dataMovieDetail.originalTitle,
//     //     overview: _dataMovieDetail.overview,
//     //     popularity: _dataMovieDetail.popularity,
//     //     posterPath: _dataMovieDetail.posterPath,
//     //     productionCompanies: _dataMovieDetail.productionCompanies,
//     //     productionCountries: _dataMovieDetail.productionCountries,
//     //     releaseDate: _dataMovieDetail.releaseDate,
//     //     revenue: _dataMovieDetail.revenue,
//     //     runtime: _dataMovieDetail.runtime,
//     //     spokenLanguages: _dataMovieDetail.spokenLanguages,
//     //     status: _dataMovieDetail.status,
//     //     tagline: _dataMovieDetail.tagline,
//     //     title: _dataMovieDetail.title,
//     //     video: _dataMovieDetail.video,
//     //     voteAverage: _dataMovieDetail.voteAverage,
//     //     voteCount: _dataMovieDetail.voteCount),
//     // );
//     // movieDetail.clear();
//     // movieDetail.refresh();
//     // isLoading.value = false;
//
//   }
// }