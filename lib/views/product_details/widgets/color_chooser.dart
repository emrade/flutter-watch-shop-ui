import 'package:flutter/material.dart';
import 'package:flutter_watch_shop/utils/utils.dart';

class ColorChooser extends StatelessWidget {
  final List<String> colors;
  final int selectedColorIndex;
  final Function(int) onColorSelected;

  const ColorChooser({
    Key key,
    @required this.colors,
    @required this.onColorSelected,
    @required this.selectedColorIndex,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      height: 50.0,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: colors.map((color) {
          int currentIndex = colors.indexOf(color);
          bool isSelected = currentIndex == selectedColorIndex;
          return colorBall(
            color: color,
            isSelected: isSelected,
            onSelected: () => onColorSelected(currentIndex),
          );
        }).toList(),
      ),
    );
  }

  Widget colorBall({String color, bool isSelected, Function onSelected}) {
    final checked = isSelected
        ? Icon(
            Icons.check,
            color: Colors.white,
          )
        : Container();
    return MaterialButton(
      elevation: isSelected ? 4.0 : 0.0,
      minWidth: 60.0,
      color: AppFunctions.formatColor(color),
      splashColor: AppFunctions.formatColor(color),
      shape: CircleBorder(),
      onPressed: onSelected,
      child: checked,
    );
  }
}
