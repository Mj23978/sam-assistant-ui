import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rive_splash_screen/rive_splash_screen.dart';

import '../core/providers.dart';

class SplashView extends HookConsumerWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(splashProvider);
    useCallback(() {
      ref.watch(splashProvider.notifier).load();
    }, []);
    return SplashScreen.callback(
      name: 'assets/rive/game-controller.riv',
      // name: 'assets/flare/space-coffee.riv',
      // backgroundColor: Color(0xFF1F0520),
      backgroundColor: const Color(0xFF401734),
      onSuccess: (data) {
        context.go("/");
        // ref.watch(splashProvider.notifier).load();
      },
      onError: (err, stack) {
        print(err);
      },
      alignment: Alignment.center,
      // fit: BoxFit.cover,
      isLoading: state.value,
      startAnimation: 'Animation 1',
    );
  }
}
