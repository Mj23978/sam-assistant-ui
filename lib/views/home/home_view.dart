import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/providers.dart';
import 'sidebar.dart';
import 'template_view.dart';

class HomeView extends ConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final provider = ref.watch(homeProvider);
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 19,
            child: Row(
              children: const [
                Flexible(
                  flex: 2,
                  child: SidebarWidgets(),
                ),
                Flexible(
                  flex: 8,
                  child: SpaceTemplateView(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
