import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';

class AnimatedDropDownButton extends HookConsumerWidget {
  final Duration duration;
  final Function? onTap;
  final Function? onDismiss;
  final Key animationKey;
  final JustTheController tooltipController;
  final Widget content;

  const AnimatedDropDownButton({
    required this.animationKey,
    required this.tooltipController,
    required this.content,
    this.duration = const Duration(milliseconds: 100),
    this.onTap,
    this.onDismiss,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useAnimationController(duration: duration);
    final Animation<double> rotationAnimation = useMemoized(() {
      return Tween<double>(begin: 0, end: 0.5).animate(controller);
    }, []);

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return InkWell(
          key: animationKey,
          onTap: () {},
          child: JustTheTooltip(
            onShow: () {
              controller.forward();
              if (onTap != null) {
                onTap!();
              }
            },
            onDismiss: () {
              controller.reverse();
              if (onDismiss != null) {
                onDismiss!();
              }
            },
            backgroundColor: Colors.white,
            controller: tooltipController,
            tailLength: 0,
            tailBaseWidth: 0.0,
            isModal: true,
            preferredDirection: AxisDirection.down,
            margin: EdgeInsets.only(top: 100),
            borderRadius: BorderRadius.circular(8.0),
            offset: 10,
            content: content,
            child: RotationTransition(
              turns: rotationAnimation,
              child: const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.black38,
                size: 18,
              ),
            ),
          ),
        );
      },
    );
  }
}
