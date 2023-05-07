import 'package:collection/collection.dart' show IterableExtension;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class RiveLoading extends StatefulWidget {
  final String name;
  final Function(dynamic data) onSuccess;
  final Function(dynamic error, dynamic stacktrace) onError;
  final BoxFit fit;
  final double? width;
  final double? height;
  final Alignment alignment;
  final Future Function()? until;
  final String? loopAnimation;
  final String? endAnimation;
  final String? startAnimation;
  final bool? isLoading;

  const RiveLoading({
    Key? key,
    required this.name,
    required this.onSuccess,
    required this.onError,
    this.fit = BoxFit.contain,
    this.width,
    this.height,
    this.alignment = Alignment.center,
    this.until,
    this.loopAnimation,
    this.endAnimation,
    this.startAnimation,
    this.isLoading,
  }) : super(key: key);

  @override
  _RiveLoadingState createState() => _RiveLoadingState();
}

class _RiveLoadingState extends State<RiveLoading> {
  late _LoadingRiveController _controller;
  Artboard? _riveArtboard;
  dynamic _data; //save data from the future for the callback
  dynamic _error; //save error from the future for the callback
  dynamic _stack; //save stack from the future for the callback
  bool _isSuccessful = false; //bool to know if the until future is successful

  @override
  void initState() {
    _processCallback();
    super.initState();
    // Load the animation file from the bundle, note that you could also
    // download this. The RiveFile just expects a list of bytes.
    rootBundle.load(widget.name).then(
      (data) async {
        // Load the RiveFile from the binary data.
        final file = RiveFile.import(data);

        // The artboard is the root of the animation and gets drawn in the
        // Rive widget.
        final artboard = file.mainArtboard;
        // Add a controller to play back a known animation on the main/default
        // artboard.We store a reference to it so we can toggle playback.
        _controller = _LoadingRiveController(
          widget.startAnimation,
          widget.loopAnimation,
          widget.endAnimation,
          () {
            if (!_controller.hasEndAnimation &&
                !_controller.hasLoopAnimation &&
                _isSuccessful) {
              _finished();
            } else if (_isSuccessful) {
              _finished();
            }
          },
        );
        artboard.addController(_controller);
        setState(() => _riveArtboard = artboard);
      },
    );
  }

  @override
  void didUpdateWidget(RiveLoading oldWidget) {
    if (widget.isLoading != null && widget.isLoading != oldWidget.isLoading) {
      setState(() {
        _controller.isLoading = widget.isLoading;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: widget.alignment,
        child: SizedBox(
          width: widget.width,
          height: widget.height,
          child: _riveArtboard == null
              ? Container()
              : Rive(
                  artboard: _riveArtboard!,
                  fit: widget.fit,
                ),
        ),
      ),
    );
  }

  Future _processCallback() async {
    if (widget.until == null) {
      _isSuccessful = true; //based on boolean field we're always sucessful
    } else {
      try {
        _data = await widget.until!();
        _isSuccessful = true;
      } catch (err, stack) {
        _error = err;
        _stack = stack;
        _isSuccessful = false;
      }
      setState(() {
        _controller.isLoading = false;
      });
      if (!_controller.hasLoopAnimation &&
              !_controller.hasEndAnimation &&
              _controller.isIntroFinished ||
          _controller.isCompleted) {
        _finished();
      }
    }
  }

  _finished() {
    if (!_controller.isLoading!) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        if (_isSuccessful) {
          widget.onSuccess(_data);
        } else {
          widget.onError(_error, _stack);
        }
      });
    }
  }
}

class _LoadingRiveController extends RiveAnimationController<RuntimeArtboard> {
  final String? _startAnimation, _loopAnimation, _endAnimation;
  final VoidCallback onFinished;
  bool isIntroFinished = false;
  bool _isLastLoadingFinished = false;
  bool? _isLoading = true;

  bool? get isLoading => _isLoading;

  set isLoading(bool? value) {
    _isLoading = value;
    if (_isLoading!) {
      _isLastLoadingFinished = false;
      isCompleted = false;
      isActive = true;
    }
  }

  bool isCompleted = false;
  LinearAnimationInstance? _start, _loading, _complete;

  _LoadingRiveController(this._startAnimation, this._loopAnimation,
      this._endAnimation, this.onFinished);

  bool get hasStartAnimation => _startAnimation != null;

  bool get hasLoopAnimation => _loopAnimation != null;

  bool get hasEndAnimation => _endAnimation != null;

  @override
  bool init(RuntimeArtboard artboard) {
    if (_startAnimation != null) {
      final start = artboard.animations
          .firstWhereOrNull((a) => a.name == _startAnimation);
      if (start != null) {
        _start = LinearAnimationInstance(start as LinearAnimation);
      }
    }
    if (_loopAnimation != null) {
      final loading =
          artboard.animations.firstWhereOrNull((a) => a.name == _loopAnimation);
      if (loading != null) {
        _loading = LinearAnimationInstance(loading as LinearAnimation);
      }
    }
    if (_endAnimation != null) {
      final complete =
          artboard.animations.firstWhereOrNull((a) => a.name == _endAnimation);
      if (complete != null) {
        _complete = LinearAnimationInstance(complete as LinearAnimation);
      }
    }
    isActive = _endAnimation != null ||
        _loopAnimation != null ||
        _startAnimation != null;
    return isActive;
  }

  @override
  void apply(RuntimeArtboard artboard, double elapsed) {
    if (!isIntroFinished && _start != null) {
      _start!.animation.loop = Loop.oneShot;
      _start!.animation.apply(_start!.time, coreContext: artboard, mix: 1);
      if (_start!.advance(elapsed)) {
        // animation not finished, let's continue
        return;
      } else {
        //anim finished
        isIntroFinished = true;
        //reset animation in case it's same one as the start one
        _loading?.reset();
        if (_loading == null && _complete == null) {
          isLoading = false;
          onFinished();
          // set the controller a inactive has nothing to run anymore
          isActive = false;
          return;
        }
      }
    }

    if (isLoading! && _loading != null) {
      _loading!.animation.loop = Loop.loop;
      // Still loading...
      _loading!.animation.apply(_loading!.time, coreContext: artboard, mix: 1);
      _loading!.advance(elapsed);
    } else if (_loading != null && !_isLastLoadingFinished) {
      _loading!.animation.loop = Loop.oneShot;
      // Complete, but need to finish loading animation...
      _loading!.animation.apply(_loading!.time, coreContext: artboard, mix: 1);
      _isLastLoadingFinished = !_loading!.advance(elapsed);
      if (_isLastLoadingFinished) {
        //reset animation in case it's same one as the others before
        _complete?.reset();
      }
    } else if (_complete == null) {
      isLoading = false;
      onFinished();
      isActive = false;
      return; // false;
    } else if (!isCompleted) {
      _complete!.animation.loop = Loop.oneShot;
      // Chain completion animation
      _complete!.animation
          .apply(_complete!.time, coreContext: artboard, mix: 1);
      if (!_complete!.advance(elapsed)) {
        // Notify we're done and stop advancing.
        isCompleted = true;
        isLoading = false;
        onFinished();
        isActive = false;
        return; // false;
      }
    }
  }
}
