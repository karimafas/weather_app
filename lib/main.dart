import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/common/router/app_router.dart';
import 'package:weather_app/common/services/service_locator.dart';
import 'package:weather_app/common/styles/app_colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await ServiceLocator.registerSingletons();

  const Locale englishLocale = Locale('en');
  runApp(EasyLocalization(
      supportedLocales: const <Locale>[englishLocale],
      path: 'assets/translations',
      fallbackLocale: englishLocale,
      child: const App()));
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return MaterialApp.router(
      title: 'Weather Forecast App',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
            background: AppColors.background,
          ),
          useMaterial3: true,
          textTheme: GoogleFonts.montserratTextTheme()),
      routerConfig: appRouter.config(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
