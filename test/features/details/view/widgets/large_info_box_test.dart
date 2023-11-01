import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/common/styles/app_images.dart';
import 'package:weather_app/features/details/view/widgets/icon_with_title.dart';
import 'package:weather_app/features/details/view/widgets/large_info_box.dart';

import '../../../../utils/widget_utils.dart';

void main() {
  setUpAll(() => TestWidgetsFlutterBinding.ensureInitialized());
  group('$LargeInfoBox', () {
    const (String, String) entry = ('test1', 'test2');
    final String iconPath = AppImages.cloud.path;
    const String title = 'title';

    testWidgets('it should render the widget correctly',
        (WidgetTester widgetTester) async {
      await widgetTester.pumpWidget(TestHelperWidget(
          child: LargeInfoBox(
        entries: const <(String, String)>[entry],
        iconPath: iconPath,
        title: title,
        index: 0,
      )));
      await widgetTester.pumpAndSettle(500.ms);

      expect(find.text(entry.$1), findsOneWidget);
      expect(find.text(entry.$2), findsOneWidget);
      expect(find.text(title.toUpperCase()), findsOneWidget);
      expect(find.byType(IconWithTitle), findsOneWidget);
    });
  });
}
