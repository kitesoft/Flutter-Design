import 'dart:async';

import 'package:flutter/material.dart';

class SqueezeAndZooming extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SqueezeAndZoomingState();
  }
}

class _SqueezeAndZoomingState extends State<SqueezeAndZooming>
    with TickerProviderStateMixin {
  AnimationController buttonController;
  Animation buttonSqueezeAnimation;
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
    buttonSqueezeAnimation = new Tween(
      /* Start Width */
      begin: 320.0,
      /* End Width */
      end: 70.0,
    ).animate(new CurvedAnimation(
        parent: buttonController, curve: new Interval(0.0, 0.150)));

    /* And Also after the Squeeze, initialize Zoom out animation */
    buttonZoomOut = new Tween(
      /* Start Width */
      begin: 70.0,
      /* End Width */
      end: 1000.0,
    ).animate(new CurvedAnimation(
        parent: buttonController,
        curve: new Interval(0.550, 0.990,curve: Curves.bounceOut)));

    containerCircleAnimation = new EdgeInsetsTween(
      begin: const EdgeInsets.only(bottom: 50.0),
      end: const EdgeInsets.only(bottom: 0.0),
    ).animate(new CurvedAnimation(
      parent: buttonController,
      curve: new Interval(
        0.500,
        0.800,
        curve: Curves.bounceOut,
      ),
    ));
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
        child: new Hero(
            tag: "fade",
            child: new Container(
              width: buttonZoomOut.value == 70
                  ? buttonSqueezeAnimation.value
                  : buttonZoomOut.value,
              height: buttonZoomOut.value == 70 ? 60.0 : buttonZoomOut.value,
              alignment: FractionalOffset.center,
              decoration: new BoxDecoration(
                  color: Color.fromRGBO(247, 64, 106, 1.0),
                  borderRadius: new BorderRadius.all(Radius.circular(30.0))),
              child: buttonSqueezeAnimation.value > 75.0
                  ? new Text(
                "Sign In",
                style: new TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0.3),
              )
                  : buttonZoomOut.value < 300.0
                  ? new CircularProgressIndicator(
                value: null,
                strokeWidth: 1.0,
                valueColor:
                new AlwaysStoppedAnimation<Color>(Colors.white),
              )
                  : null,
            ),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    buttonController.addListener(() {
      if (buttonController.isCompleted) {
        Navigator.pushNamed(context, "/home");
      }
    });
    return new AnimatedBuilder(
        animation: buttonController, builder: _buildAnimatedButton);
  }
}
