// import 'package:flutter/material.dart';

// class CustomAlertDialog extends StatelessWidget {
//   final Color bgColor;
//   final String? title;
//   final String? message;
//   final String? positiveBtnText;
//   final String? negativeBtnText;
//   final Function? onPostivePressed;
//   final Function? onNegativePressed;
//   final double circularBorderRadius;

//   CustomAlertDialog({
//     this.title,
//     this.message,
//     this.circularBorderRadius = 15.0,
//     this.bgColor = Colors.white,
//     this.positiveBtnText,
//     this.negativeBtnText,
//     this.onPostivePressed,
//     this.onNegativePressed,
//   })  : assert(bgColor != null),
//         assert(circularBorderRadius != null);

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: title != null ? Text(title!) : null,
//       content: message != null ? Text(message!) : null,
//       backgroundColor: bgColor,
//       shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(circularBorderRadius)),
//       actions: <Widget>[
//         if (negativeBtnText != null)
//           TextButton(
//             child: Text(
//               negativeBtnText!,
//               style: TextStyle(color: Colors.black87, fontSize: 16),
//             ),
//             onPressed: () {
//               Navigator.of(context).pop();
//               if (onNegativePressed != null) {
//                 onNegativePressed!();
//               }
//             },
//           ),
//         if (positiveBtnText != null)
//           TextButton(
//             child: Text(
//               positiveBtnText!,
//               style: TextStyle(color: Colors.black87, fontSize: 16),
//             ),
//             onPressed: () {
//               Navigator.of(context).pop();
//               if (onPostivePressed != null) {
//                 onPostivePressed!();
//               }
//             },
//           )
//       ],
//     );
//   }
// }

// class ImageDialog extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       child: Container(
//         width: 200,
//         height: 200,
//         decoration: BoxDecoration(
//             image: DecorationImage(
//                 image: ExactAssetImage('assets/images/0.jpg'),
//                 fit: BoxFit.cover)),
//       ),
//     );
//   }
// }