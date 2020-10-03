import "package:flutter/material.dart";
import 'package:flutter/services.dart';

void main()=> runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new LoginPage(),
      theme: new ThemeData(
        primarySwatch: Colors.blue
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {

  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState (){
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this,
    duration: new Duration(milliseconds: 300)
        );
    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController,
        curve: Curves.easeOut);
    _iconAnimation.addListener(()=> this.setState(() {
    }));
    _iconAnimationController.forward();
  }



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/avengers1.png"),
            fit: BoxFit.cover,
            color: Colors.black54,
            colorBlendMode: BlendMode.darken,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new FlutterLogo(
                size: _iconAnimation.value * 100,
              ),
              new Form(
                  child: new Theme(
                    data: new ThemeData(
                      brightness: Brightness.dark,
                        primarySwatch: Colors.teal,
                    inputDecorationTheme: new InputDecorationTheme(
                      labelStyle: new TextStyle(
                        color: Colors.white, fontSize: 18.0
                      )
                    )),
                    child: new Container(
                      padding: const EdgeInsets.all(40.0),
                      child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new TextFormField(
                          decoration: new InputDecoration(
                            labelText: "Avenger ID",


                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        new TextFormField(
                          decoration: new InputDecoration(
                            labelText: "Password",
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        new Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                        ),
                        new MaterialButton(
                          height: 40.0,
                          minWidth: 100.0,
                          color: Colors.lightBlueAccent,
                          textColor: Colors.black,
                          child: new Text("Assemble" , style: new TextStyle(
                            fontSize: 17.0,
                          )),
                          onPressed: ()=> {},
                          splashColor: Colors.black,
                        )
                      ],
                    ),
                  ))
              )],
          )

        ],
      ),
    );
  }
}

