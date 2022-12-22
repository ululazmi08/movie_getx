// import 'package:get/get.dart';
//
// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: GetBuilder<HomeController>(
//           init: HomeController(),
//           builder: (controller) {
//             if (controller.user.value == null) {
//               return CircularProgressIndicator();
//             }
//             return Text(controller.user.value.name);
//           },
//         ),
//       ),
//     );
//   }
// }
//
// class HomeController extends GetxController {
//   final user = Rx<User>();
//
//   @override
//   void onInit() {
//     fetchUser();
//   }
//
//   Future<void> fetchUser() async {
//     final response = await http.get('https://my-api.com/user');
//     user.value = User.fromJson(response.body);
//   }
// }
//
// class User {
//   final String name;
//
//   User({this.name});
//
//   factory User.fromJson(String json) {
//     final parsed = jsonDecode(json);
//     return User(name: parsed['name']);
//   }
// }