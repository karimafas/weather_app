import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TestHelperWidget extends StatelessWidget {
  const TestHelperWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: child,
      ),
    );
  }
}

Future<Widget> buildLocalisedWidget({
  required Widget child,
}) async {
  const Locale supportedLocale = Locale('en');
  SharedPreferences.setMockInitialValues(<String, String>{});
  await EasyLocalization.ensureInitialized();
  return EasyLocalization(
    supportedLocales: const <Locale>[supportedLocale],
    path: 'assets/translations',
    child: Builder(
      builder: (BuildContext context) {
        return MaterialApp(
          locale: EasyLocalization.of(context)?.locale,
          supportedLocales: const <Locale>[supportedLocale],
          localizationsDelegates: EasyLocalization.of(context)?.delegates,
          home: Builder(
            builder: (BuildContext context) => child,
          ),
        );
      },
    ),
  );
}
