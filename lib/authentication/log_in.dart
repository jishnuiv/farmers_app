import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  String userid = "";

  // loginData({Username, Password}) async {
  //   var parameters = {
  //     "username": Username,
  //     "password": Password,
  //   };
  //   http.Response result = await http.post(
  //      // Uri.parse("https://embraceapp.herokuapp.com/userlogin"),
  //      // body: parameters);
  //
  //   print("result from web : ${result.statusCode}");
  //   if (result.statusCode == 200) {
  //     var jsonObject = jsonDecode(result.body);
  //     print(jsonObject);
  //     bool status = jsonObject['result'];
  //     print(status);
  //     var message = "invalid username or password";
  //     if (status) {
  //
  //       message = "login successful";
  //       userid = jsonObject['userdetails']['id'];
  //
  //       print(userid);
  //       SharedPreferences prefs = await SharedPreferences.getInstance();
  //       await prefs.setString("user", userid.toString());
  //       Navigator.of(context).pushReplacementNamed('home');
  //     }
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text(message)));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(
          decoration: BoxDecoration(


              color: Colors.white70,
              gradient: LinearGradient(colors: [
                Colors.transparent,
                Colors.transparent,
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),),
          child: ListView(

            children: <Widget>[
              SizedBox(height: 50,),
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Log In',
                    style: TextStyle(
                        color: Colors.deepOrangeAccent,
                        fontWeight: FontWeight.w700,
                        fontSize: 30, ),
                  )),
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    '',
                    style: TextStyle(fontSize: 20),
                  )),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  controller: usernamecontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  obscureText: true,
                  controller: passwordcontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),

              Container(
                  height: 50,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Colors.blue,
                    child: Text('Login'),
                    onPressed: () {
                      // loginData(
                      //     Username: usernamecontroller.text,
                      //     Password: passwordcontroller.text
                    },
                  )),
              Container(
                  child: Row(
                    children: <Widget>[
                      Text('Does not have account?'),
                      FlatButton(
                        textColor: Color(0xFF084349),
                        child: Text(
                          'Sign in',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed('Registration');
                        },
                      ),

                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                  )),Container(height:150,width: 150,decoration: BoxDecoration(image: DecorationImage(
                image: NetworkImage("https://cdni.iconscout.com/illustration/premium/thumb/young-farmer-pushing-a-wheelbarrow-of-vegetables-and-fruit-3119996-2612454.png"),
                fit: BoxFit.fill,    // -> 02
              ),),),
            ],
          ),
        ),

      ]),
    );
  }
}
