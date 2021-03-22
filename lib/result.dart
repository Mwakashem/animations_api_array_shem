import 'package:flutter/material.dart';
import 'fade_animation.dart';
import 'model.dart';

class Results extends StatelessWidget {
  final Model model;

  Results({this.model});

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      
      appBar: AppBar(title: Text('Profile Info')),
      body: Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              FadeAnimation(1.2,Text(
                model.firstName + " " +model.lastName,
                style: TextStyle(
                  fontFamily: 'Sacramento',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )),
              SizedBox(
                height: 2,
              ),
              SizedBox(
                height: 10,
                width: 150,
                child: Divider(
                  thickness: 1,
                  color: Colors.deepOrangeAccent,
                ),
              ),
             FadeAnimation(1.5, Card(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                color: Colors.orangeAccent,
                child: ListTile(
                  leading: Icon(Icons.phone, color: Colors.black,),
                  title: Text(model.password),
                ),
              )),
              FadeAnimation(1.2,Card(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                color: Colors.orangeAccent,
                child: ListTile(
                  leading: Icon(Icons.mail, color: Colors.black),
                  title: Text(model.email),
                ),
              ))
            ],
          ),
      ),
    )
    );
  }
}