import 'package:design_login/Home/UI_Element/ListCard.dart';
import 'package:flutter/material.dart';

class ListViewContent extends StatelessWidget {
  final Animation<double> listTileWidth;
  final Animation<Alignment> listSlideAnimation;
  final Animation<EdgeInsets> listSlidePosition;

  ListViewContent(
      {this.listTileWidth, this.listSlideAnimation, this.listSlidePosition});

  @override
  Widget build(BuildContext context) {
    return new Stack(
      alignment: listSlideAnimation.value,
      children: <Widget>[
        new ListCard(margin: listSlidePosition.value * 11.5, width: listTileWidth.value),
        new ListCard(margin: listSlidePosition.value * 10.5, width: listTileWidth.value),
        new ListCard(margin: listSlidePosition.value * 9.5, width: listTileWidth.value),
        new ListCard(margin: listSlidePosition.value * 8.5, width: listTileWidth.value),
        new ListCard(margin: listSlidePosition.value * 7.5, width: listTileWidth.value),
        new ListCard(margin: listSlidePosition.value * 6.5, width: listTileWidth.value),
        new ListCard(margin: listSlidePosition.value * 5.5, width: listTileWidth.value),
        new ListCard(margin: listSlidePosition.value * 4.5, width: listTileWidth.value),
        new ListCard(margin: listSlidePosition.value * 3.5, width: listTileWidth.value),
        new ListCard(margin: listSlidePosition.value * 2.5, width: listTileWidth.value),
        new ListCard(margin: listSlidePosition.value * 1.5, width: listTileWidth.value),
        new ListCard(margin: listSlidePosition.value * 0.5, width: listTileWidth.value),
      ],
    );
  }
}
