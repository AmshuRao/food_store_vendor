import 'package:flutter/material.dart';

class CustomCurvedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    /**
     * 
     *    (0,0) -----> x-axis
     *       ----------------------------------   |
     *       |                                |   |
     *       |                                |   |
     *       |                                |   |
     *       |                                |   |
     *       |                                |   V
     *       |                                |  y-axis
     *       |                                |
     *       |  ----------------------------  |
     *       | / ######## clipped ######### \ |
     *       ---------------------------------- (size.width, size.height)
     */

    var path = Path();

    path.lineTo(0, size.height);

    final controller1 = Offset(0, size.height - 20);
    final destPoint1 = Offset(30, size.height - 20);
    path.quadraticBezierTo(
      controller1.dx,
      controller1.dy,
      destPoint1.dx,
      destPoint1.dy,
    );

    path.lineTo(size.width - 30, size.height - 20);

    final controller2 = Offset(size.width, size.height - 20);
    final destPoint2 = Offset(size.width, size.height);
    path.quadraticBezierTo(
      controller2.dx,
      controller2.dy,
      destPoint2.dx,
      destPoint2.dy,
    );

    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  // something complicated not to worry about now, just return true
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
