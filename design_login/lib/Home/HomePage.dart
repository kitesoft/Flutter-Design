import 'dart:async';

import 'package:design_login/Home/Animation/FadeAnimation.dart';
import 'package:design_login/Home/UI_Element/HeaderImage.dart';
import 'package:design_login/Home/UI_Element/HeaderNotification.dart';
import 'package:design_login/Home/UI_Element/ListViewContent.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  /* Father: Animation Controller*/
  AnimationController _screenController;

  /* Father: Button Controller */
  AnimationController _buttonController;

  /* Head Image and Button Container grow bigger Animation */
  Animation<double> containerGrowAnimation;

  /* Background Color Fade Out Animation*/
  Animation<Color> fadeScreenAnimation;

  Animation<double> listTileWidth;
  Animation<Alignment> listSlideAnimation;
  Animation<EdgeInsets> listSlidePosition;

  var animateStatus = 0;

  @override
  void initState() {
    super.initState();

    /* Father: Screen Animation Controller Initiate */
    _screenController = new AnimationController(
        duration: new Duration(milliseconds: 2000), vsync: this);
    _buttonController = new AnimationController(
        duration: new Duration(milliseconds: 1500), vsync: this);

    /* Define how the Fade Screen Animation Perform */
    fadeScreenAnimation = new ColorTween(
      begin: const Color.fromRGBO(247, 64, 106, 1.0),
      end: const Color.fromRGBO(247, 64, 107, 0.0),
    ).animate(
      new CurvedAnimation(
        parent: _screenController,
        curve: Curves.ease,
      ),
    );

    /* Container Grow Animation Initiate and it has a status value from 0 to 1*/
    containerGrowAnimation = new CurvedAnimation(
      parent: _screenController,
      curve: Curves.easeIn,
    );

    /* I dont know but this have to here and the below also have to be here */
    containerGrowAnimation.addListener(() {
      this.setState(() {});
    });
    containerGrowAnimation.addStatusListener((AnimationStatus status) {});


    listTileWidth = new Tween<double>(
      begin: 1000.0,
      end: 600.0,
    ).animate(
      new CurvedAnimation(
        parent: _screenController,
        curve: new Interval(
          0.225,
          0.600,
          curve: Curves.bounceIn,
        ),
      ),
    );

    listSlideAnimation = new AlignmentTween(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ).animate(
      new CurvedAnimation(
        parent: _screenController,
        curve: new Interval(
          0.325,
          0.700,
          curve: Curves.ease,
        ),
      ),
    );

    listSlidePosition = new EdgeInsetsTween(
      begin: const EdgeInsets.only(bottom: 16.0),
      end: const EdgeInsets.only(bottom: 80.0),
    ).animate(
      new CurvedAnimation(
        parent: _screenController,
        curve: new Interval(
          0.325,
          0.800,
          curve: Curves.ease,
        ),
      ),
    );

    /* Start the Animation after the Controller Initiate */
    _screenController.forward();
  }

  /* Father: Animation Controller */
  Future<Null> _playAnimation() async {
    try {
      await _buttonController.forward();
    } on TickerCanceled {}
  }

  /* Build the main Screen */
  Widget _buildMainScreen(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return new Container(
      width: screenSize.width,
      height: screenSize.height,
      child: new Stack(
//        alignment: Alignment.bottomRight,
        children: <Widget>[
          new ListView(
            shrinkWrap: _screenController.value < 1 ? false : true,
            children: <Widget>[
//              new HeaderImage(containerGrowAnimation),
              new ListViewContent(
                listSlideAnimation: listSlideAnimation,
                listSlidePosition: listSlidePosition,
                listTileWidth: listTileWidth,
              ),
            ],
          ),
          new FadeAnimation(
            fadeScreenAnimation: fadeScreenAnimation,
            containerGrowAnimation: containerGrowAnimation,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _buildMainScreen(context),
    );
  }
}
