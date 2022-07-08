import 'package:flutter/material.dart';

// class MyBarrier extends StatelessWidget {
  
//   final barrierWidth;
//   final barrierHeight;
//   final barrierX;
//   final bool isThisBottom;

//   MyBarrier({
//     this.barrierHeight,
//     this.barrierWidth,
//     this.barrierX,
//     required this.isThisBottom,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment((2 * barrierX + barrierWidth) / (2 - barrierWidth), isThisBottom ? 1 : -1),
//       child: Container(
//         color: Colors.green,
//         width: MediaQuery.of(context).size.width * barrierWidth / 2,
//         height: MediaQuery.of(context).size.height * 3 / 4 * barrierHeight / 2,
//       ),
//     );
//   }
// }

class MyBarrier extends StatelessWidget {
  
  final double size;
  MyBarrier(this.size);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: size,
      decoration: BoxDecoration(
        color: Colors.green,
        // since Colors.green[800] gave error, hex value used
        border: Border.all(width: 10, color: Color(0xFF1B5E20)),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}