import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(home: Tip_calculator(),));
}
class Tip_calculator extends StatefulWidget {
  @override
  _Tip_calculatorState createState() => _Tip_calculatorState();
}

class _Tip_calculatorState extends State<Tip_calculator> {
  int _tipPercentage= 0;
  int _personCounter= 1;
  double _billAmount= 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.1),
        alignment: Alignment.center,
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20.5),
          children: <Widget>[
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.redAccent.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Total per person",style: TextStyle(color: Colors.deepPurpleAccent.shade700,
                      fontWeight: FontWeight.normal,
                      fontSize: 15),
                  ),
                  Text("\$${calculateperperson(_billAmount, _personCounter, _tipPercentage)}",style: TextStyle(color: Colors.deepPurpleAccent.shade700,
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top:20.0),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(12.0),
                border:Border.all(
                  color: Colors.blueGrey.shade100,
                  style:BorderStyle.solid
                )


              ),
              child: Column(
                children: <Widget>[
                  TextField(keyboardType: TextInputType.numberWithOptions(decimal: true),
                  style: TextStyle(color: Colors.deepPurpleAccent.shade700),
                    decoration: InputDecoration(
                      prefixText: "Bill Amount",
                      prefixIcon: Icon(Icons.attach_money),


                    ),
                    onChanged:(String value){
                    try{
                      _billAmount=double.parse(value);
                    }
                    catch(exception)
                      {
                        _billAmount=0.0;
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Split",style: TextStyle(color: Colors.deepPurpleAccent.shade700),),
                      Row(
                        children: <Widget>[
                          InkWell(
                            onTap: (){ setState(() {
                                 if (_personCounter>1)
                             {
                                       _personCounter--;
                               }
                            });
                              
                              
                                   },
                                child: Container(
                                height: 40,
                                width: 40,
                                margin: EdgeInsets.all(10),
    decoration: BoxDecoration(
    color: Colors.redAccent.shade100,
    borderRadius: BorderRadius.circular(7),
    ),
     child: Center
       (child:Text("-",
       style: TextStyle(color: Colors.deepPurpleAccent.shade700,
       fontWeight: FontWeight.bold,
         fontSize: 20,
       ),
     ),
     ),
                                ),

                           ),

                          Text("$_personCounter",style:TextStyle(color: Colors.deepPurpleAccent.shade700) ,),
                          InkWell(
                            onTap: (){ setState(() {


                                _personCounter++;

                            });


                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.redAccent.shade100,
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Center
                                (child:Text("+",
                                style: TextStyle(color: Colors.deepPurpleAccent.shade700,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              ),
                            ),

                          ),

                          ],
                       ),
                        ],
                      ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: <Widget>[
                      Text("Tip",style: TextStyle(color: Colors.deepPurpleAccent.shade700),),
                     Container(
                       margin: EdgeInsets.all(10),
                       child:  Text("\$${calculatetip(_billAmount, _tipPercentage)}",style: TextStyle(color:Colors.redAccent.shade100,
                         fontWeight: FontWeight.bold,
                         fontSize: 20,
                       ),
                       ),
                     ) ,
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text("$_tipPercentage%",
                      style: TextStyle(
                        color: Colors.redAccent.shade100,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      Slider(
                          value: _tipPercentage.toDouble(),
                          min: 0,
                          max: 100,
                          divisions: 10,
                          activeColor: Colors.redAccent.shade100,
                          inactiveColor: Colors.grey,
                          onChanged: (double val){
                        setState(() {
                          _tipPercentage=val.round();
                        });
                          }

                      ),
                    ],
                  ),
                    ],
                  ),
            ),
                ],

              ),
            ),

        );


  }
  calculateperperson(double bill,int count,int percent)
  {
    var total=(calculatetip(bill,percent)+bill)/count;
    return total.toStringAsFixed(2);
  }
  calculatetip(double bill,int percent)
  {
    double tip=0.0;
    if(bill<0||bill.toString().isEmpty||bill==Null)
      {

      }
    else
      {
        tip=(bill*percent)/100;
        return tip;
      }
  }
}
