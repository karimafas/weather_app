import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/features/locations/view/widgets/color_button.dart';
import 'package:weather_app/features/styles/bloc/styles_bloc.dart';

void main() {
  group('$ColorButton', () {
    testWidgets('it should render the widget correctly',
        (WidgetTester widgetTester) async {
      await widgetTester.pumpWidget(BlocProvider<StylesBloc>(
        create: (_) => StylesBloc(),
        child: const ColorButton(),
      ));

      expect(find.byType(GestureDetector), findsOneWidget);
      expect(find.byType(Container), findsNWidgets(2));
    });
  });
}
