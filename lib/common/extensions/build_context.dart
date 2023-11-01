import 'package:flutter/widgets.dart';

extension BuildContextHelpers on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;
}
