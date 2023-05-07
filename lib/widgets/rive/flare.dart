import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:flutter/material.dart';

class CoolAlertContainer extends StatelessWidget {
  final double width;
  final bool loopAnimation;
  final double? borderRadius;
  final double? height;
  final Color? backgroundColor;
  final String? flareAsset;
  final String dialogFlr;
  final String? flareAnimationName;

  const CoolAlertContainer({
    required this.width,
    this.loopAnimation = false,
    this.dialogFlr = AppAnim.success,
    this.flareAnimationName,
    this.height,
    this.borderRadius,
    this.backgroundColor,
    this.flareAsset,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      height: width,
      width: width,
      child: FlareActor(
        dialogFlr,
        animation: loopAnimation ? flareAnimationName : null,
        controller: loopAnimation
            ? null
            : SingleLoopController(
                flareAnimationName ?? 'play',
                0.4,
                0.1
              ),
      ),
    );
  }
}

class SingleLoopController extends FlareController {
  final String _animation;
  final double _loopAmount;
  final double _mix;
  ActorAnimation? _actor;
  double _duration = 0;
  double _loopCount = 0;

  SingleLoopController(this._animation, this._loopAmount, [this._mix = 0.7]);

  @override
  void initialize(FlutterActorArtboard artBoard) {
    _actor = artBoard.getAnimation(_animation);
  }

  @override
  bool advance(FlutterActorArtboard artBoard, double elapsed) {
    if (_loopCount >= _loopAmount) {
      // Looped enough times!
      _actor!.apply(_actor!.duration , artBoard, 1);
      return false;
    }
    _duration += elapsed * 1.5;

    if (_duration >= _actor!.duration) {
      // Loop!
      _loopCount++;
      _duration %= _actor!.duration;
    }
    _actor!.apply(_duration, artBoard, _mix);
    return true;
  }

  @override
  void setViewTransform(Mat2D viewTransform) {}
}

class AppAnim {
  static const loading = 'assets/rive/loading.flr';
  static const success = 'assets/rive/success_check.flr';
  static const error = 'assets/rive/error_check.flr';
  static const warning = 'assets/rive/warning_check.flr';
  static const info = 'assets/rive/info_check.flr';
}
