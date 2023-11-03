part of 'styles_bloc.dart';

class StylesState extends Equatable {
  const StylesState({this.colorMode = ColorMode.dark});
  final ColorMode colorMode;

  @override
  List<Object?> get props => <Object?>[colorMode];

  StylesState copyWith({ColorMode? colorMode}) {
    return StylesState(colorMode: colorMode ?? this.colorMode);
  }

  Color get background =>
      colorMode == ColorMode.dark ? AppColors.dark : Colors.white;
  Color get primary =>
      colorMode == ColorMode.dark ? AppColors.medium : AppColors.grey;
  Color get secondary =>
      colorMode == ColorMode.dark ? Colors.white : Colors.black;
}
