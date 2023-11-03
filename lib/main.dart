import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/common/router/app_router.dart';
import 'package:weather_app/common/services/service_locator.dart';
import 'package:weather_app/features/styles/bloc/styles_bloc.dart';

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

    return BlocProvider<StylesBloc>(
      create: (_) => StylesBloc(),
      child: AppView(
        appRouter: appRouter,
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    final StylesState stylesState = context.watch<StylesBloc>().state;
    return MaterialApp.router(
      title: 'Weather Forecast App',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.black,
            background: stylesState.background,
            primary: stylesState.primary,
            secondary: stylesState.secondary,
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
