// import 'package:flutter/material.dart';
// import 'package:plecement_projects/placement_day1/provider/pro_provider1/pro_provider1.dart';
// import 'package:plecement_projects/placement_day1/views/screens/ProOneDay/ProOneDay.dart';
// import 'package:provider/provider.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (context) => ProProvider(),)
//       ],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: homePage(),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plecement_projects/placement_day2/helper/helper.dart';
import 'package:plecement_projects/placement_day2/service/service.dart';
import 'package:plecement_projects/placement_day2/views/details/details.dart';
import 'package:plecement_projects/placement_day2/views/login/login.dart';
import 'package:plecement_projects/placement_day2/views/screens/home1/home1.dart';
import 'package:plecement_projects/placement_day2/views/screens/home2/home2.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final userDetails = await StorageHelper.getUserDetails();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.getBool('loginOrLogOut') ?? false;
  var con = Get.put(LoginController());
  runApp(
    GetMaterialApp(
      initialRoute: userDetails == null || con.loginOrLogOut != true ? '/login' : '/home',
      getPages: [
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/home', page: () => HomeScreenData()),
        GetPage(name: '/logOutData', page: () => LogoutUser()),
        GetPage(name: '/details', page: () => DetailsScreen()),
      ],
    ),
  );
}
