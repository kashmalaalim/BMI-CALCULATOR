import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';

const kBodyText = TextStyle( fontSize: 22);
const kBmiText = TextStyle(fontSize: 100, fontWeight: FontWeight.bold) ;
const kTitleStyle = TextStyle(
  fontSize: 30.0,
  fontWeight: FontWeight.bold,
);
const kResultText = TextStyle(
  color: Color(0xFF4A195A),
  fontSize: 30,
  fontWeight: FontWeight.bold,
);
class ResultsPage extends StatelessWidget {
  ResultsPage({@required this.bmiResult, @required this.resultText, @required this.interpretation});
  final String bmiResult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("BMI CALCULATOR",
      ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(("Your Result"),style:kTitleStyle),
            ),
          ),Expanded(
            flex: 5,
            child: ReuseableCard(
              colour: activeColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text((resultText),style: kResultText,),
                  Text((bmiResult), style: kBmiText,),
                  Text((interpretation), style:kBodyText, textAlign: TextAlign.center,),



                ],
              ),

            ) ,
          ),
          BottomButton(buttonTitle: "RE- CALCULATE",onTap:  (){ Navigator.pop(context);

            
          },),
          Center(child: Text(("Developed By: Kashmala Musarrat Ali : @KashmalaAliM"), style:TextStyle(fontSize: 15),textAlign: TextAlign.center,)),

        ],
      ),
    );
  }
}
