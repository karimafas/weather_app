import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/styles/bloc/styles_bloc.dart';

class ColorButton extends StatelessWidget {
  const ColorButton({super.key});

  @override
  Widget build(BuildContext context) {
    final StylesState stylesState = context.watch<StylesBloc>().state;
    return Stack(
      alignment: Alignment.bottomRight,
      children: <Widget>[
        GestureDetector(
          onTap: () => _swapColors(context),
          child: Container(
            height: 50,
            width: 50,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              shape: BoxShape.circle,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: stylesState.background,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _swapColors(BuildContext context) {
    HapticFeedback.heavyImpact();
    context.read<StylesBloc>().add(const SwapColors());
  }
}
