import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:sketch/ui/splash/app_splash.dart';

import 'generated/l10n.dart';
import 'providers/app_provider.dart';
import 'providers/authentication_provider.dart';
import 'providers/home_provider.dart';
import 'utils/cache_helper.dart';
import 'utils/enum/shared_preference_keys.dart';
import 'utils/styles/colors.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColor.primary,
      statusBarIconBrightness: Brightness.light
  ));
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static void setLocale(BuildContext context, Locale newLocale) async {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>()!;
    state.changeLanguage(newLocale);
  }

  static void changeThemeMode(BuildContext context) async {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>()!;
    state.changeThemeMode();
  }

  static bool themeMode(BuildContext context) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>()!;
    return state.isDarkMode;
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Locale _locale;
  late bool loggedIn = false;
  late bool showOnBoarding = false;
  bool isDarkMode = false;

  void changeThemeMode() {
    isDarkMode = !isDarkMode;
    setState(() {});
    if (isDarkMode) {
      CacheHelper.saveData(key: CacheKey.darkMode, value: true);
    } else {
      CacheHelper.saveData(key: CacheKey.darkMode, value: false);
    }
  }

  changeLanguage(Locale locale) {
    setState(() {
      _locale = locale;
    });
    log(locale.languageCode);
    CacheHelper.saveData(key: CacheKey.language, value: locale.languageCode);
  }

  @override
  initState() {
    loadData();
    if (CacheHelper.returnData(key: CacheKey.darkMode) != null) {
      isDarkMode = CacheHelper.returnData(key: CacheKey.darkMode);
    }
    super.initState();
  }

  void loadData() {
    if (CacheHelper.returnData(key: CacheKey.language) != null) {
      _locale = Locale(CacheHelper.returnData(key: CacheKey.language));
    }
    if (CacheHelper.returnData(key: CacheKey.loggedIn) != null) {
      loggedIn = CacheHelper.returnData(key: CacheKey.loggedIn);
    }
    if (CacheHelper.returnData(key: CacheKey.showOnBoarding) != null) {
      showOnBoarding = CacheHelper.returnData(key: CacheKey.showOnBoarding);
    }
    // if (CacheHelper.returnData(key: CacheKey.darkMode) != null) {
    //   isDarkMode = CacheHelper.returnData(key: CacheKey.darkMode);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => AppProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => AuthenticationProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => HomeProvider(),
          ),
        ],
        child: ResponsiveSizer(builder: (context, orientation, deviceType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'SKETCH',
            theme: isDarkMode
                ? ThemeData.dark().copyWith()
                : ThemeData(
              fontFamily: Intl.getCurrentLocale() == 'en' ? 'NetGilroy' : 'MMTSDR',
              primarySwatch: Colors.grey,
              appBarTheme: const AppBarTheme(
                  color: Colors.white,
                  iconTheme: IconThemeData(color: Colors.black)),
              scaffoldBackgroundColor: AppColor.primary,
            ),
            themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],

            supportedLocales: S.delegate.supportedLocales,
            locale: _locale,
            // home: const AppLayout(),
            home: const AppSplash(),
          );
        }));
  }
}
