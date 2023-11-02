import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/common/styles/app_colors.dart';
import 'package:weather_app/common/styles/app_images.dart';
import 'package:weather_app/common/styles/app_shapes.dart';
import 'package:weather_app/features/details/view/widgets/icon_with_title.dart';
import 'package:weather_app/features/details/view/widgets/tall_info_box.dart';

import '../../../../utils/widget_utils.dart';

void main() {
  setUpAll(() => TestWidgetsFlutterBinding.ensureInitialized());
  group('$TallInfoBox', () {
    final String iconPath = AppImages.cloud.path;
    final String imagePath = AppImages.cloud.path;
    const String title = 'title';
    const String value = 'value';

    testWidgets('it should render the widget correctly',
        (WidgetTester widgetTester) async {
      await widgetTester.pumpWidget(TestHelperWidget(
          child: TallInfoBox(
        value: value,
        iconPath: iconPath,
        imagePath: iconPath,
        title: title,
        index: 0,
      )));
      await widgetTester.pumpAndSettle(500.ms);

      final Container containerWithImage =
          widgetTester.widget(find.byType(Container).first);
      expect(
          containerWithImage.decoration,
          equals(ShapeDecoration(
            color: AppColors.medium,
            shape: AppShapes.smoothRectangle(),
            image: DecorationImage(
              image: AssetImage(imagePath),
              scale: 1.5,
            ),
          )));

      expect(find.text(value), findsOneWidget);
      expect(find.text(title.toUpperCase()), findsOneWidget);
      expect(find.byType(IconWithTitle), findsOneWidget);
    });
  });
}
