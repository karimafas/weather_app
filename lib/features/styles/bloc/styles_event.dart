part of 'styles_bloc.dart';

abstract class StylesEvent {
  const StylesEvent();
}

class SwapColors extends StylesEvent {
  const SwapColors();
}
