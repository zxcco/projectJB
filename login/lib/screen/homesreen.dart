// import 'package:flutter/material.dart';
// import 'package:sign_language/Screens/homepage.dart';
// import 'package:sign_language/models/constants.dart';


// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Sign Language',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         scaffoldBackgroundColor: appBGColor,
//         primaryColor: appPrimaryColor,
//         //textTheme: Theme.of(context).textTheme.apply(bodyColor: appTextColor),
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: const Splash(),
//     );
//   }
// }

// class Splash extends StatefulWidget {
//   const Splash({Key? key}) : super(key: key);

//   @override
//   State<Splash> createState() => _SplashState();
// }

// class _SplashState extends State<Splash> {
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(const Duration(seconds: 0), () {
//       Navigator.pushReplacement(
//           context, MaterialPageRoute(builder: (context) => const homepage()));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: appBGColor,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               'assets/images/logo01.jpg',
//               height: 130,
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             const Text('Sign Language',
//                 style: TextStyle(
//                     color: appTextColor,
//                     fontFamily: 'Klasik',
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold))
//             //reload
//             /*if (Platform.isIOS)
//               const CupertinoActivityIndicator(
//                 radius: 15,
//               )
//             else
//               const CircularProgressIndicator(
//                 color: Colors.white,
//               )*/
//           ],
//         ),
//       ),
//     );
//   }
// }