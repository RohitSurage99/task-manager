// // ignore_for_file: library_private_types_in_public_api
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class MultiActionButton extends StatefulWidget {
//   const MultiActionButton({super.key});
//
//   @override
//   _MultiActionButtonState createState() => _MultiActionButtonState();
// }
//
// class _MultiActionButtonState extends State<MultiActionButton> {
//   bool _isExpanded = false;
//
//   void _toggle() {
//     setState(() {
//       _isExpanded = !_isExpanded;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       alignment: Alignment.bottomRight,
//       children: [
//         // Secondary Icon Button 2
//         if (_isExpanded)
//           Positioned(
//             bottom: 90,
//             right: 0,
//             child: FloatingActionButton(
//               backgroundColor: Colors.blue,
//               heroTag: null,
//               child: Icon(Icons.help_outline),
//               onPressed: () async {
//                 // Navigate to different screen
//                 await Get.toNamed('/help-screen');
//               },
//             ),
//           ),
//         // Main Floating Action Button
//         FloatingActionButton(
//           onPressed: _toggle,
//           child: Icon(_isExpanded ? Icons.close : Icons.add),
//         ),
//         // Secondary Icon Button 1
//         if (_isExpanded)
//           Positioned(
//             bottom: 0,
//             right: 0,
//             child: FloatingActionButton(
//               backgroundColor: Colors.green,
//               heroTag: null,
//               child: Icon(Icons.task_alt),
//               onPressed: () async {
//                 // Navigate to the add/edit task screen
//                 await Get.toNamed('/add-edit-task');
//               },
//             ),
//           ),
//       ],
//     );
//   }
// }
