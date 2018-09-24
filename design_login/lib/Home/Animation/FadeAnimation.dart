import 'package:flutter/material.dart';

class FadeAnimation extends StatelessWidget {
  final Animation<double> containerGrowAnimation;
  final Animation<Color> fadeScreenAnimation;

  FadeAnimation({this.containerGrowAnimation, this.fadeScreenAnimation});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return (new Hero(
        tag: "fade",
        child: new Container(

          /* This width and height have to be here to remove the cover of the fadeImage above the listview*/
          width: containerGrowAnimation.value < 1 ? screenSize.width : 0.0,
          height: containerGrowAnimation.value < 1 ? screenSize.height : 0.0,
          decoration: new BoxDecoration(
            color: fadeScreenAnimation.value,
          ),
        )));
  }
}
