import 'package:design_login/Home/UI_Element/HeaderNotification.dart';
import 'package:flutter/material.dart';

class HeaderImage extends StatelessWidget {

  Animation<double> containerGrowAnimation;

  HeaderImage(this.containerGrowAnimation);

  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;
    return new Container(
      width: screenSize.width,
//      height: screenSize.height,
      child: new Container(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new HeaderNotification(containerGrowAnimation),
          ],
        ),
      ),
    );
  }

}