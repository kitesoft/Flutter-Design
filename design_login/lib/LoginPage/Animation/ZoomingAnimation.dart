import 'dart:async';

import 'package:flutter/material.dart';

class ZoomingAnimation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ZoomingAnimationState();
  }
}

class _ZoomingAnimationState extends State<ZoomingAnimation>
    with TickerProviderStateMixin {
  AnimationController buttonController;
  Animation containerCircleAnimation;
  Animation buttonZoomOut;

  @override
  void initState() {
    super.initState();
    /* Button Controller to start the animation Initializer, it is the father class of all Animation */
    buttonController = new AnimationController(
      duration: new Duration(milliseconds: 3000),
      vsync: this,
    );

    /* After Initialize the Animation Controller, initialize Button Squeeze Animation */
    buttonZoomOut = new Tween(
      /* Start Width */
      begin: 70.0,
      /* End Width */
      end: 1000.0,
    ).animate(new CurvedAnimation(
        parent: buttonController,
        curve: new Interval(0.0, 0.15,curve: Curves.bounceOut)));

    containerCircleAnimation = new EdgeInsetsTween(
      begin: const EdgeInsets.only(bottom: 50.0),
      end: const EdgeInsets.only(bottom: 0.0),
    ).animate(
      new CurvedAnimation(
        parent: buttonController,
        curve: new Interval(
          0.500,
          0.800,
          curve: Curves.ease,
        ),
      ),
    );
  }

  /* Play Animation Function */
  /* Forward: Play Animation, Reverse: Reverse the Animation*/
  Future<Null> _playAnimation() async {
    try {
      /* Execute the forward so that animation can be show */
      await buttonController.forward();
      await buttonController.reverse();
    } on TickerCanceled {}
  }

  Widget _buildAnimatedButton(BuildContext context, Widget child) {

    return new InkWell(
      onTap: () {
        _playAnimation();
      },
      child: new Container(
          width: buttonZoomOut.value ,
          height: buttonZoomOut.value,
          alignment: FractionalOffset.center,
          decoration: new BoxDecoration(
              color: const Color.fromRGBO(247, 64, 106, 1.0),
              borderRadius: new BorderRadius.all(const Radius.circular(30.0))),
          child: buttonZoomOut.value < 300.0
              ? new CircularProgressIndicator(
                  value: null,
                  strokeWidth: 1.0,
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                )
              : null),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new AnimatedBuilder(
        animation: buttonController, builder: _buildAnimatedButton);
  }
}
