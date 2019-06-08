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
  var _currencies=['Rupees','Dollars','Pounds'];

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
      body:Container(
        child:ListView(
          children: <Widget>[
            getImageAsset(),
            Padding(
              padding: EdgeInsets.only(top:_minimumPadding,bottom: _minimumPadding),
              child: TextField(
                keyboardType:TextInputType.number,
                style: textStyle,
                decoration: InputDecoration(
                    labelText: 'Principal',
                    hintText: 'Enter Principal e.g. 1200',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),

                    ),
                    labelStyle: textStyle,
                    hintStyle: textStyle,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top:_minimumPadding,bottom: _minimumPadding),
              child: TextField(
                keyboardType:TextInputType.number,
                style: textStyle,
                decoration: InputDecoration(
                      labelText: 'Rate of Interest',
                      hintText: 'In percent',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      labelStyle: textStyle,
                      hintStyle: textStyle,
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
                        style: textStyle,
                        decoration: InputDecoration(
                            labelText: 'Term',
                            hintText: 'Time in years',
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
                        color: Theme.of(context).accentColor,
                        textColor: Theme.of(context).primaryColorDark,
                        child: Text(
                          'Calculate',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: (){
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
                style: textStyle ,
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