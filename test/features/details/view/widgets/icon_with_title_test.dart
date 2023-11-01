import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/common/styles/app_images.dart';
import 'package:weather_app/features/details/view/widgets/icon_with_title.dart';

import '../../../../utils/widget_utils.dart';

void main() {
  setUpAll(() => TestWidgetsFlutterBinding.ensureInitialized());

  group('$IconWithTitle', () {
    final String iconPath = AppImages.cloud.path;
    const String title = 'title';

    testWidgets('it should render the widget correctly',
        (WidgetTester widgetTester) async {
      await widgetTester.pumpWidget(TestHelperWidget(
          child: IconWithTitle(
        iconPath: iconPath,
        title: title,
      )));

      expect(find.text(title.toUpperCase()), findsOneWidget);
    });
  });
}
