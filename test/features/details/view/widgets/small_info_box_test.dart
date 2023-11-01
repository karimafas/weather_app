import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/common/styles/app_images.dart';
import 'package:weather_app/features/details/view/widgets/icon_with_title.dart';
import 'package:weather_app/features/details/view/widgets/small_info_box.dart';

import '../../../../utils/widget_utils.dart';

void main() {
  setUpAll(() => TestWidgetsFlutterBinding.ensureInitialized());
  group('$SmallInfoBox', () {
    final String iconPath = AppImages.cloud.path;
    const String title = 'title';
    const String value = 'value';

    testWidgets('it should render the widget correctly',
        (WidgetTester widgetTester) async {
      await widgetTester.pumpWidget(TestHelperWidget(
          child: SmallInfoBox(
        value: value,
        iconPath: iconPath,
        title: title,
        index: 0,
      )));
      await widgetTester.pumpAndSettle(500.ms);

      expect(find.text(value), findsOneWidget);
      expect(find.text(title.toUpperCase()), findsOneWidget);
      expect(find.byType(IconWithTitle), findsOneWidget);
    });
  });
}
