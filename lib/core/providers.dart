import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

import 'logger.dart';
import 'notifiers/app_provider.dart';
import 'notifiers/home_provider.dart';
import 'notifiers/splash_provider.dart';

final ProviderFamily<Logger, String> loggerProvider =
    Provider.family<Logger, String>((ref, scope) {
  return getLogger(scope);
});

final appProvider = Provider(
  (ref) => AppProvider(),
);

final homeProvider = ChangeNotifierProvider((ref) {
  return HomeProvider(ref.watch(appProvider));
});


final splashProvider =
    StateNotifierProvider<SplashNotifier, SplashState>((ref) {
  return SplashNotifier();
});
