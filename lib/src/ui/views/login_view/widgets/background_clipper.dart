part of  tyba.ui.widgets;

class LoginBackground extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width, size.height);
    path.lineTo(size.width, size.height * 0.07);

    path.quadraticBezierTo(
      size.width * 0.90,
      size.height * 0.07,
      size.width * 0.80,
      size.height * 0.12,
    );
    path.quadraticBezierTo(
      size.width * 0.65,
      size.height * 0.20,
      size.width * 0.75,
      size.height * 0.50,
    );
    path.quadraticBezierTo(
      size.width * 0.8,
      size.height * 0.75,
      size.width * 0.2,
      size.height * 0.80,
    );
    path.quadraticBezierTo(
      size.width * 0.1,
      size.height * 0.81,
      0.0,
      size.height * 0.86,
    );
    path.lineTo(0.0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
