import 'package:flutter/material.dart';

class Login_Page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new loginpage();
  }
}

class loginpage extends State<Login_Page> {
  TextEditingController _userController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  String _usernameShow = "";

  void _erase(){
    setState(() {
      _userController.clear();
      _passwordController.clear();
      debugPrint("Clear");
      _usernameShow = "Enter Username and Password";
    });
  }

  void _showUser (){
    setState(() {
      if(_userController.text.isNotEmpty && _passwordController.text.isNotEmpty){
        _usernameShow = "Welcome ${_userController.text}!";
        debugPrint("Login");
      }
      else{
        _usernameShow = "Enter Username and Password";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Login",
          style:
              new TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Center(
        child: new ListView(
          children: <Widget>[
            new Image.asset(
              'lib/images/face.png',
              color: Colors.amber,
              width: 90,
              height: 90,
            ),
            new Container(
              width: 380,
              height: 180,
              color: Colors.white,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _userController,
                    decoration: new InputDecoration(
                        hintText: "Username", icon: new Icon(Icons.person)),
                  ),
                  new TextField(
                    controller: _passwordController,
                    decoration: new InputDecoration(
                        hintText: "Password", icon: new Icon(Icons.lock),),
                    obscureText: true,
                  ),
                  new Padding(padding: new EdgeInsets.all(10)),
                  new Container(
                    child: new Row(
                      children: <Widget>[
                        new Padding(padding: new EdgeInsets.only(left: 38.0)),
                        new RaisedButton(onPressed: _showUser,
                        child: new Text("Login",
                        style: new TextStyle(color: Colors.white,
                        fontWeight: FontWeight.w500),),
                        color: Colors.amber,),
                        new Padding(padding: new EdgeInsets.only(left: 65.0)),
                        new RaisedButton(onPressed: _erase,
                        child: new Text("Clear",
                        style: new TextStyle(color: Colors.white,
                        fontWeight: FontWeight.w500),),
                        color: Colors.amber,)
                      ],
                    ),
                  )
                ],
              ),
            ),
               new Padding(padding: new EdgeInsets.all(10)),
               new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text( _usernameShow,
                    style: new TextStyle(color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 20),)
                ],
              ),
          ],
        ),
      ),
    );
  }
}
