import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/features/styles/bloc/styles_bloc.dart';
import 'package:weather_app/features/styles/enums/color_mode.dart';

void main() {
  group('$StylesBloc', () {
    blocTest<StylesBloc, StylesState>(
      'it should change the colorMode to what is passed in',
      build: () => StylesBloc(),
      act: (StylesBloc bloc) => bloc.add(const SwapColors()),
      expect: () =>
          <StylesState>[const StylesState(colorMode: ColorMode.light)],
    );
  });
}
