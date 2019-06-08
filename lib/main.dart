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
  var _currencies=['Rupees','Dollars','Pounds'];

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: backgroundColor,
      //resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title:Text('Simple Interest App'),
        backgroundColor: appBarColor,
      ),
      body:Container(
        child:ListView(
          children: <Widget>[
            getImageAsset(),
            Padding(
              padding: EdgeInsets.only(top:_minimumPadding,bottom: _minimumPadding),
              child: TextField(
                keyboardType:TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Principal',
                    hintText: 'Enter Principal e.g. 1200',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),

                    ),
                    labelStyle: TextStyle(
                        color: textColor
                    ),
                    hintStyle: TextStyle(
                        color: textColor
                    )
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top:_minimumPadding,bottom: _minimumPadding),
              child: TextField(              keyboardType:TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Rate of Interest',
                      hintText: 'In percent',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      labelStyle: TextStyle(
                          color: textColor
                      ),
                      hintStyle: TextStyle(
                          color: textColor
                      )
                  ),
                ),
            ),
            Padding(
                padding: EdgeInsets.only(top:_minimumPadding,bottom: _minimumPadding),
                child:Row(
                  children: <Widget>[

                    Expanded(
                      child:TextField(
                        keyboardType:TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Term',
                            hintText: 'Time in years',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),

                            ),
                            labelStyle: TextStyle(
                                color: textColor
                            ),
                            hintStyle: TextStyle(
                                color: textColor
                            )
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
                                style: TextStyle(
                                    color: textColor
                                ),
                              ),
                            );
                          }).toList(),
                          value:'Dollars',
                          onChanged: (String newValueSelected){
                          },
                        )
                    ),
                  ],
                )
            ),

            Padding(
              padding: EdgeInsets.only(top:_minimumPadding,bottom: _minimumPadding),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child:RaisedButton(
                        child: Text('Calculate'),
                        onPressed: (){
                        },
                      )
                    ),
                    Expanded(
                        child:RaisedButton(
                          child: Text('Reset'),
                          onPressed: (){
                          },
                        )
                    ),
                  ],
                )
            ),
            Padding(
              padding: EdgeInsets.all(_minimumPadding*2),
              child: Text(
                'Todo Text',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textColor
                ),
              ),
            )
          ],
        ),
      ),

    );
  }
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