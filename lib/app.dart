import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:world_time/configs/configs.dart';
import 'package:world_time/provider/app.dart';
import 'package:world_time/provider/language.dart';
import 'package:world_time/provider/navigation.dart';
import 'package:world_time/router/router.dart';
import 'package:world_time/router/routes.dart';

class WorldTimeApp extends StatefulWidget {
  const WorldTimeApp({super.key});

  @override
  State<WorldTimeApp> createState() => _WorldTimeAppState();
}

class _WorldTimeAppState extends State<WorldTimeApp> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return MultiProvider(
      providers: [
        // bloc

        // provider
        ChangeNotifierProvider(create: (_) => AppProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        ChangeNotifierProvider(create: (_) => AppNavigation()),
      ],
      child: Consumer2<AppProvider, LanguageProvider>(
        builder: (context, appState, langState, child) {
          return MaterialApp(
            title: 'Plant Scanner',
            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: false,
            theme: materialLightTheme,
            darkTheme: materialDarkTheme,
            themeMode: appState.themeMode,
            locale: langState.currentLocale,
            supportedLocales: const [
              Locale('en'),
              Locale('es'),
              Locale('fr'),
              Locale('hi'),
              Locale('pt'),
              Locale('fa'),
              Locale('bn'),
              Locale('ar'),
              Locale('de'),
              Locale('zh'),
            ],
            // localizationsDelegates: const [
            //   AppLocalizations.delegate,
            //   GlobalMaterialLocalizations.delegate,
            //   GlobalWidgetsLocalizations.delegate,
            //   GlobalCupertinoLocalizations.delegate,
            // ],
            initialRoute: AppRoutes.splash,
            routes: appRoutes,
            // onGenerateRoute: AppRouter.generateRoute,
          );
        },
      ),
    );
  }
}
