import 'package:flutter/material.dart';
final _minimumPadding=5.0;

final textColor=Colors.black;
final borderColor=Colors.white30;
final backgroundColor=Colors.white;
final appBarColor=Colors.deepPurple;

void main(){
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title:'Simple Interest Calculator App',
        home:SIForm(),
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.indigo,
          accentColor: Colors.indigoAccent,
        ),
      )
  );
}

class SIForm extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _SIFormState();
  }
}

class _SIFormState extends State<SIForm>
{
  var _formKey=GlobalKey<FormState>();

  var _currencies=['Rupees','Dollars','Pounds'];
  var _currentItemSelected='';
  var displayResult='';

  @override
  void initState(){
    super.initState();
    _currentItemSelected=_currencies[0];
  }

  TextEditingController principalController=TextEditingController();
  TextEditingController rateOfInterestController=TextEditingController();
  TextEditingController termController=TextEditingController();

  void _onDropDownItemSelected(String newValueSelected){
    setState((){
      this._currentItemSelected=newValueSelected;
    });
  }

  @override
  Widget build(BuildContext context)
  {
    TextStyle textStyle=Theme.of(context).textTheme.title;
    return Scaffold(
      //backgroundColor: backgroundColor,
      //resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title:Text('Simple Interest App'),
        //backgroundColor: appBarColor,
      ),
      body:Form(
          key:_formKey,
          child:Padding(
            padding: EdgeInsets.all(_minimumPadding*2) ,
            child:ListView(
              children: <Widget>[
                //Image
                getImageAsset(),
                //First Text Field (TextFormField)
                Padding(
                  padding: EdgeInsets.only(top:_minimumPadding,bottom: _minimumPadding),
                  child: TextFormField(
                    keyboardType:TextInputType.number,
                    style: textStyle,
                    controller: principalController,

                    validator: (String value){
                      if(value.isEmpty){
                        return 'Plese enter principal amount';
                      }
                    },

                    decoration: InputDecoration(
                      labelText: 'Principal',
                      hintText: 'Enter Principal e.g. 1200',
                      errorStyle: TextStyle(
                        color: Colors.yellowAccent,
                        fontSize: 15.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      labelStyle: textStyle,
                      hintStyle: textStyle,
                    ),
                  ),
                ),
                //Second Text Field (TextFormField)
                Padding(
                  padding: EdgeInsets.only(top:_minimumPadding,bottom: _minimumPadding),
                  child: TextFormField(
                    keyboardType:TextInputType.number,
                    style: textStyle,
                    controller: rateOfInterestController,

                    validator: (String value){
                      if(value.isEmpty){
                        return 'Plese enter rate of interest value';
                      }
                    },

                    decoration: InputDecoration(
                      labelText: 'Rate of Interest',
                      hintText: 'In percent',
                      errorStyle: TextStyle(
                        color: Colors.yellowAccent,
                        fontSize: 15.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      labelStyle: textStyle,
                      hintStyle: textStyle,
                    ),
                  ),
                ),
                //Third Text Field (TextFormField) and DropDown
                Padding(
                    padding: EdgeInsets.only(top:_minimumPadding,bottom: _minimumPadding),
                    child:Row(
                      children: <Widget>[
                        Expanded(
                          child:TextFormField(
                            keyboardType:TextInputType.number,
                            style: textStyle,
                            controller: termController,

                            validator: (String value){
                              if(value.isEmpty){
                                return 'Plese enter principal amount';
                              }
                            },

                            decoration: InputDecoration(
                              labelText: 'Term',
                              hintText: 'Time in years',
                              errorStyle: TextStyle(
                                color: Colors.yellowAccent,
                                fontSize: 15.0,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),

                              ),
                              labelStyle: textStyle,
                              hintStyle: textStyle,
                            ),
                          ),
                        ),

                        Container(
                          width: _minimumPadding*5,
                        ),

                        Expanded(
                            child:DropdownButton<String>(
                              items:_currencies.map((String value)
                              {
                                return DropdownMenuItem<String>(
                                  value:value,
                                  child:Text(
                                      value,
                                      textAlign: TextAlign.center,
                                      style: textStyle
                                  ),
                                );
                              }).toList(),
                              value: _currentItemSelected,
                              onChanged: (String newValueSelected){
                                _onDropDownItemSelected(newValueSelected);
                                //_currentItemSelected=newValueSelected;
                              },
                            )
                        ),
                      ],
                    )
                ),
                //The buttons
                Padding(
                    padding: EdgeInsets.only(top:_minimumPadding,bottom: _minimumPadding),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child:RaisedButton(
                              color: Theme.of(context).accentColor,
                              textColor: Theme.of(context).primaryColorDark,
                              child: Text(
                                'Calculate',
                                textScaleFactor: 1.5,
                              ),
                              onPressed: (){
                                setState((){
                                  if(_formKey.currentState.validate()){
                                    this.displayResult=_calculateTotalReturns();
                                  }
                                });
                              },
                            )
                        ),
                        Expanded(
                            child:RaisedButton(
                              color: Theme.of(context).primaryColorDark,
                              textColor: Theme.of(context).primaryColorLight,
                              child: Text(
                                'Reset',
                                textScaleFactor: 1.5,
                              ),
                              onPressed: (){
                                setState(() {
                                  _reset();
                                });
                              },
                            )
                        ),
                      ],
                    )
                ),
                //Result Text
                Padding(
                  padding: EdgeInsets.all(_minimumPadding*2),
                  child: Text(
                    displayResult,
                    textAlign: TextAlign.center,
                    style: textStyle ,
                  ),
                )
              ],
            ),
          )
      ),
    );
  }

  Widget getImageAsset(){
    AssetImage assetImage=AssetImage('Assets/images/INART_Logo.png');
    Image image=Image(image:assetImage,width:125.0,height:125.0,);

    return Center(
        child: Container(
          child:image,
          margin:EdgeInsets.all(_minimumPadding*10),
        )
    );
  }

  String _calculateTotalReturns(){
    double principal= double.parse(principalController.text);
    double rateOfInterest= double.parse(rateOfInterestController.text);
    double term= double.parse(termController.text);

    double totalAmoutnPayable=principal+(principal*rateOfInterest*term)/100;

    String result= 'After $term years, your investment will be $totalAmoutnPayable $_currentItemSelected';
    return result;
  }

  void _reset(){
    principalController.text='';
    rateOfInterestController.text='';
    termController.text='';
    displayResult='';
    _currentItemSelected=_currencies[0];
  }
}


