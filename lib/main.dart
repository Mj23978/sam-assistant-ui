import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:objectbox/objectbox.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'models/settings/settings.dart';
import 'utils/helpers.dart';
import 'utils/objectbox.dart';
import 'views/home/home_view.dart';
import 'views/splash_view.dart';

late ObjectBox objectbox;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  objectbox = await ObjectBox.create();

  initConfig();
  await dotenv.load(fileName: ".env");
  
  await SentryFlutter.init(
    (options) {
      options.dsn = dotenv.env['SENTRY_DSN'];
      options.tracesSampleRate = 0.1;
    },
    // run the app
    appRunner: () => runZonedGuarded(
      () => runApp(
              EasyLocalization(
                supportedLocales: const [
                  Locale("en", "US"),
                  Locale("fa", "IR")
                ],
                path: 'assets/translations',
                fallbackLocale: const Locale("en", "US"),
                child: ProviderScope(
                  child: MyApp(),
                ),
              ),
            ),
      (error, stack) => logger.e(error)),
    );
}

class MyApp extends ConsumerWidget {
  final _router = GoRouter(
    initialLocation: "/",
    observers: [FlutterSmartDialog.observer],
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeView(),
        routes: const [],
      ),
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashView(),
      ),
    ],
  );

  MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final state = ref.read(appProvider);
    return StreamBuilder<Query<Settings>>(
      stream: objectbox.store.box<Settings>().query().watch(),
      builder: (BuildContext context,
          AsyncSnapshot<Query<Settings>> settingsSnapshot) {
        return MaterialApp.router(
          routerConfig: _router,
          builder: FlutterSmartDialog.init(),
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            ...context.localizationDelegates,
          ],
          debugShowCheckedModeBanner: false,
          theme: mDefaultTheme,
        );
      },
    );
  }
}

final ThemeData mDefaultTheme = ThemeData(
  useMaterial3: true,
  primaryColor: string2Color('#0a0a0a'),
);

initConfig() {
  Box<Settings> conf = objectbox.store.box<Settings>();
  if (conf.count() == 0) {
    conf.put(Settings(const Locale("fa", "IR").toString()));
  }
}
