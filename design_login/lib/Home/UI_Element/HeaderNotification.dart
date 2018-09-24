import 'package:flutter/material.dart';

class HeaderNotification extends StatelessWidget {
  Animation<double> containerGrowAnimation;

  HeaderNotification(this.containerGrowAnimation);

  /* Build the head Image */
  Widget _buildHeadImage(BuildContext context) {
    return new Column(
      children: [
        new Container(
            width: containerGrowAnimation.value * 35,
            height: containerGrowAnimation.value * 35,
            margin: new EdgeInsets.only(left: 80.0),
            child: new Center(
              child: new Text("3",
                  style: new TextStyle(
                      fontSize: containerGrowAnimation.value * 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.white)),
            ),
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              color: const Color.fromRGBO(80, 210, 194, 1.0),
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: containerGrowAnimation.value * 120,
      height: containerGrowAnimation.value * 120,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.amber
      ),
      child: _buildHeadImage(context),
    );
  }
}
