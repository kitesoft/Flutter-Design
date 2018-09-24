import 'dart:async';

import 'package:flutter/material.dart';

class LoginBtnAnimation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginBtnAnimationState();
  }
}

class _LoginBtnAnimationState extends State<LoginBtnAnimation>
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
  }

  /*LoginBtnAnimation({Key key, this.buttonController}) {
    buttonSqueezeAnimation = new Tween(
      begin: 320.0,
      end: 70.0,
    ).animate(new CurvedAnimation(
        parent: buttonController, curve: new Interval(0.0, 0.150)));
  }*/

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
          width: buttonSqueezeAnimation.value,
          height: 60.0,
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
              : new CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation(Colors.white),
                ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return new AnimatedBuilder(
        animation: buttonController, builder: _buildAnimatedButton);
  }
}
