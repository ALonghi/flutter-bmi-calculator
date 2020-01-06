import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';
import 'icon_content.dart';
import 'results_page.dart';
import 'reusable_card.dart';

enum GenderEnum { MALE, FEMALE }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderEnum selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: (() =>
                        setState(() => selectedGender = GenderEnum.MALE)),
                    color: selectedGender == GenderEnum.MALE
                        ? kactiveCardColor
                        : kinactiveCardColor,
                    cardChild: CardContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: (() =>
                        setState(() => selectedGender = GenderEnum.FEMALE)),
                    color: selectedGender == GenderEnum.FEMALE
                        ? kactiveCardColor
                        : kinactiveCardColor,
                    cardChild: CardContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('HEIGHT', style: klabelTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kdisplayTextStyle,
                      ),
                      Text('cm', style: klabelTextStyle),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 80.0,
                    max: 240.0,
                    onChanged: (double newHeight) {
                      setState(() {
                        height = newHeight.round();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: kactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text('WEIGHT', style: klabelTextStyle),
                        Text(weight.toString(), style: kdisplayTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                onPressed: (() => setState(() => weight--)),
                                icon: Icons.remove),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                                onPressed: (() => setState(() => weight++)),
                                icon: Icons.add),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text('AGE', style: klabelTextStyle),
                        Text(age.toString(), style: kdisplayTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                onPressed: (() => setState(() => age--)),
                                icon: Icons.remove),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                                onPressed: (() => setState(() => age++)),
                                icon: Icons.add),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResultsPage()));
            },
            child: Container(
                child: Text('CALCULATE'),
                color: kbottomContainerColor,
                width: double.infinity,
                height: kbottomContainerHeight),
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.onPressed, this.icon});
  final Function onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(icon),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
