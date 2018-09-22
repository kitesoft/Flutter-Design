import 'dart:async';
import 'package:design_login/LoginPage/Animation/loginAnimation.dart';
import 'package:design_login/LoginPage/UI_Element/Sign_In_Btn.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  var animationStatus = 0;

  AnimationController _loginButtonController;

  /* Play Animation Function */
  Future<Null> _playAnimation() async {
    try {
    print("on Tap Call");
      await _loginButtonController.forward();
      await _loginButtonController.reverse();
    } on TickerCanceled {}
  }

  @override
  void initState() {
    super.initState();
    _loginButtonController = new AnimationController(
      duration: new Duration(milliseconds: 3000),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: animationStatus == 0?new InkWell(
          onTap: (){
            setState(() {
              animationStatus = 1;
            });
            _playAnimation();
          },
          child: new Sign_In_Btn(),
        ):new LoginBtnAnimation(buttonController:  _loginButtonController.view,),

      ),
    );
  }

}
