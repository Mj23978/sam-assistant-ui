import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

import 'api/chat.dart';
import 'api/client.dart';
import 'logger.dart';
import 'notifiers/app_provider.dart';
import 'notifiers/home_provider.dart';
import 'notifiers/splash_provider.dart';

final ProviderFamily<Logger, String> loggerProvider =
    Provider.family<Logger, String>((ref, scope) {
  return getLogger(scope);
});

final appProvider = ChangeNotifierProvider((_) => AppProvider());

final homeProvider = ChangeNotifierProvider((ref) {
  final app = ref.read(appProvider);
  return HomeProvider(app);
});

final splashProvider =
    StateNotifierProvider<SplashNotifier, SplashState>((ref) {
  return SplashNotifier();
});

final _grpcProvider = Provider((ref) {
  return NetworkConfigModule();
});

final chatServerProvider = Provider((ref) {
  final provider = ref.watch(_grpcProvider);
  return ChatServiceGRPC(provider.samChatClient);
});
