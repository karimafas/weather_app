import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/common/styles/app_colors.dart';
import 'package:weather_app/features/styles/enums/color_mode.dart';

part 'styles_event.dart';
part 'styles_state.dart';

class StylesBloc extends Bloc<StylesEvent, StylesState> {
  StylesBloc() : super(const StylesState()) {
    on<SwapColors>(_swapColors);
  }

  void _swapColors(SwapColors event, Emitter<StylesState> emit) =>
      emit(state.copyWith(
          colorMode: state.colorMode == ColorMode.dark
              ? ColorMode.light
              : ColorMode.dark));
}
