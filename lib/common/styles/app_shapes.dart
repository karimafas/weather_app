import 'package:figma_squircle/figma_squircle.dart';

class AppShapes {
  static SmoothRectangleBorder smoothRectangle({double radius = 20}) =>
      SmoothRectangleBorder(
        borderRadius: SmoothBorderRadius.all(
          SmoothRadius(
            cornerRadius: radius,
            cornerSmoothing: 0.8,
          ),
        ),
      );
}
