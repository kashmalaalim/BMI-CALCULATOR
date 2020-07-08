import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:BMI_CALCULATOR/Result_page.dart';
import 'calculator.dart';

const   activeColor = Color(0xFF8E7596);
const heightBottom = 80.0;
const textColor = Color( 0xFFFFFFFF);
const colorAfter =  Color(0xFF824AA4);
const kTextStyleofHeight =  TextStyle(fontWeight: FontWeight.w900, fontSize: 30, color: textColor);
const textLable = TextStyle(fontSize: 25.0, color:textColor );
const kLargeButton = TextStyle(fontSize: 30.0, color:textColor , fontWeight: FontWeight.bold);
enum Gender {
  male, female
}


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}


class _InputPageState extends State<InputPage> {
  Gender selectedColor;
  int height = 180;
  int weight = 60;
  int age = 24;
  @override
  Widget build(BuildContext context) {
    return Scaffold(              
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body:
      Column(

        children: <Widget>[
          Expanded(
            child: Row(


              children: <Widget>[
                Expanded(

                  child:  ReuseableCard(

                  onPress:  (){setState(() {
                            selectedColor = Gender.male; });
                                      },
                  colour:selectedColor == Gender.male? colorAfter : activeColor ,
                cardChild: Icondata(genderSign: FontAwesomeIcons.male,genderType: "Male",),
                  ),),
                Expanded(child: ReuseableCard(
                  onPress:(){ setState(() {
                    selectedColor = Gender.female;
                  });},
                  colour:selectedColor == Gender.female? colorAfter: activeColor,
                  cardChild:Icondata(genderSign: FontAwesomeIcons.female,genderType: "Female",),),),


              ],
            ),
          ),
          Expanded(
            child: Row(

              children: <Widget>[
                Expanded(child: ReuseableCard(colour:activeColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(("HEIGHT"),style: textLable ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text((height.toString()), style: kTextStyleofHeight),
                        Text(("cm"), style:textLable),

                      ],

                    ),
                    SliderTheme(
                      data:SliderTheme.of(context).copyWith(
                        thumbColor:Color(0xFF4A195A) ,
                        overlayColor: Color(0x294A195A),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF4A195A) ,
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),

                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue){
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),

                  ],
                ),),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(

              children: <Widget>[
                Expanded(child: ReuseableCard(colour:activeColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(("WEIGHT"),style:textLable,),
                    Text((weight.toString()), style:kTextStyleofHeight),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(icon:FontAwesomeIcons.plus, onPressed: (){
                          setState(() {
                            weight++;
                          });
                        },),
                        SizedBox(

                          width: 10.0,
                        ),
                       RoundIconButton(icon:FontAwesomeIcons.minus, onPressed: (){
                         setState(() {
                           weight--;
                         });
                       },),
                      ],
                    ),

                  ],
                ),),
                ),
                Expanded(child: ReuseableCard(colour:activeColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(("AGE"),style:textLable,),
                      Text((age.toString()), style:kTextStyleofHeight),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(icon:FontAwesomeIcons.plus, onPressed: (){
                            setState(() {
                              age++;
                            });
                          },),
                          SizedBox(

                            width: 10.0,
                          ),

                          RoundIconButton(icon: FontAwesomeIcons.minus,onPressed: (){

                            setState(() {
                              age--;
                            });
                          },),
                        ],
                      ),


                    ],
                  ),

    ),),
              ],
            ),
          ),



                 BottomButton(buttonTitle: "CALCULATE" , onTap:  (){
                   Calculator calc = Calculator(height: height, weight: weight);
                   Navigator.push(context, MaterialPageRoute(builder: (context){
                     return ResultsPage(
                       bmiResult: calc.calculateBMI(),
                       resultText: calc.getResult(),
                       interpretation: calc.getInterpretation(),
                     );
                   },),);
                 },),

          Center(child: Text(("Developed By: Kashmala Ali : @KashmalaAliM"), style:TextStyle(fontSize: 15), textAlign: TextAlign.center),),



        ],



      ),
    
    );
  }
}

class BottomButton extends StatelessWidget {
  const BottomButton({@required  this.onTap, @required this.buttonTitle});
  final Function onTap;
  final buttonTitle;


  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        onTap:onTap,
        child: Container(
          child: Center(child: Text((buttonTitle), style: kLargeButton,)),
         color: Color(0xFF702963),


         padding: EdgeInsets.only(bottom: 20.0),
         margin: EdgeInsets.only(top:10.0),
          width: double.infinity,
          height: heightBottom,



                ),


    );
  }
}

class Icondata extends StatelessWidget {
  Icondata( {this.genderType, this.genderSign} );

       final  genderType ;
       final genderSign;


  @override
  Widget build(BuildContext context) {
    return

          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
            Icon(
              genderSign  ,
              size: 60,
              color: textColor,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(genderType, style: textLable,

            ),],



      );

  }
}

class ReuseableCard extends StatelessWidget {
  final Color colour;
  final  Widget cardChild;
  final Function onPress;

  ReuseableCard({@required this.colour, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        onTap: onPress,
        child: Container(
          child: cardChild,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),

    );
  }
}
class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon,@required this.onPressed});
  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 6.0,
      constraints:BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,) ,
      shape: CircleBorder(),
      fillColor: Color(0xFF4A195A),


    );
  }
}
