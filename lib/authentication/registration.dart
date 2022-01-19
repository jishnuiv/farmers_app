import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController first_namecontroller = TextEditingController();
  TextEditingController username_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();
  TextEditingController password1_controller = TextEditingController();
  TextEditingController password2_controller = TextEditingController();
  TextEditingController phone_controller = TextEditingController();
  String First_name = "";
  String User_name = "";
  String Email = "";
  String Password1 = "";
  String Password2 = "";
  String Phone = "";

  AddDetails(
      {First_name,

        User_name,
        Email,
        Password1,
        Password2,

        Phone}) async {
    RegExp emailExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)$");
    if (!emailExp.hasMatch(Email)) {
      print("not a valid email");
      return;
    }
    var parameters = {
      "first_name": First_name,
      "username": User_name,
      "email": Email,
      "password1": Password1,
      "password2": Password2,
      "state": State,
      "phone": Phone
    };
    // print(parameters);
    http.Response result = await http.post(
        Uri.parse("https://embraceapp.herokuapp.com/userregister"),
        body: parameters);
    print("result from web : ${result.statusCode}");
    var jsonObject = jsonDecode(result.body);
    bool status = jsonObject['result'];
    if (result.statusCode == 200) {
      var message = "invalid submission";
      if (status) {
        message = "Registration successful";
      }
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xff253b5f),title: Center(child: Text("Registration")),),
      body: Stack(children: <Widget>[

        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.transparent,
                Colors.transparent,

              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        ),
        ListView(
          children: [


                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50,
                        margin: EdgeInsets.only(left: 40, right: 40),
                        child: TextField(
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          decoration: InputDecoration(
                            hintText: "First Name",
                            hintStyle: TextStyle(color: Colors.grey.shade700),
                            filled: true,

                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.blueGrey)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.blueGrey)),
                          ),
                          controller: first_namecontroller,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50,
                        margin: EdgeInsets.only(left: 40, right: 40),
                        child: TextField(
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          decoration: InputDecoration(
                            hintText: "Username",
                            hintStyle: TextStyle(color: Colors.grey.shade700),
                            filled: true,

                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.blueGrey)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.blueGrey)),
                          ),
                          controller: username_controller,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50,
                        margin: EdgeInsets.only(left: 40, right: 40),
                        child: TextField(
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(color: Colors.grey.shade700),
                            filled: true,

                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.blueGrey)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.blueGrey)),
                          ),
                          controller: email_controller,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50,
                        margin: EdgeInsets.only(left: 40, right: 40),
                        child: TextField(
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          decoration: InputDecoration(
                            hintText: "Phone Number",
                            hintStyle: TextStyle(color: Colors.grey.shade700),
                            filled: true,
                            fillColor: Colors.transparent,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.blueGrey)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.blueGrey)),
                          ),
                          controller: phone_controller,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50,
                        margin: EdgeInsets.only(left: 40, right: 40),
                        child: TextField(
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          decoration: InputDecoration(
                            hintText: "Set_Password",
                            hintStyle: TextStyle(color: Colors.grey.shade700),
                            filled: true,

                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.blueGrey)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.blueGrey)),
                          ),
                          controller: password1_controller,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50,
                        margin: EdgeInsets.only(left: 40, right: 40),
                        child: TextField(
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          decoration: InputDecoration(
                            hintText: "Re_Enter Password",
                            hintStyle: TextStyle(color: Colors.grey.shade700),
                            filled: true,

                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.blueGrey)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.blueGrey)),
                          ),
                          controller: password2_controller,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),









              // ),


            TextButton(
              onPressed: () {
                setState(() {
                  First_name = first_namecontroller.text;
                  User_name = username_controller.text;
                  Email = email_controller.text;
                  Password1 = password1_controller.text;
                  Password2 = password2_controller.text;
                  Phone = phone_controller.text;
                  AddDetails(
                      First_name: First_name,
                      User_name: User_name,
                      Email: Email,
                      Password1: Password1,
                      Password2: Password2,
                      Phone: Phone);

                },);
               // Navigator.of(context).pushNamed('login');
              },

              child: Text("Add Your Data",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 20,color: Colors.black87),),
            ),
          ],
        ),
      ],),);
  }
}
