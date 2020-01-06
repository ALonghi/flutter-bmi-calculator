import 'package:flutter/cupertino.dart';

const Color boxColor = Color(0xFF1D1E33);

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.color, this.cardChild, @required this.onPress});
  final Color color;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: cardChild),
    );
  }
}
