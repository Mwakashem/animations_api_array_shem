import 'package:animations_api_array_shem/result.dart';
import 'package:animations_api_array_shem/todos.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart' as validator;
import 'fade_animation.dart';
import 'loginpage.dart';
import 'model.dart';

// void main() => runApp(Profile());

class Profile extends StatefulWidget {
  @override
  _Profile createState() => _Profile();
}
class _Profile extends State<Profile> {
  int _currentIndex = 0;

  final tabs = [
    TestForm(),
    Todos(),
    LoginPage(),
    LoginPage(),
      ];
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Scaffold(
        // backgroundColor: Color.fromRGBO(255, 140, 0, 1),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(255, 140, 0, 1),
          title: Center(child: Text('Profile Create')),
          
        ),
        body: tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: [
          BottomNavigationBarItem(icon: Icon(Icons.info_outline),
          backgroundColor: Colors.orangeAccent,
          title: Text('Info')
          ),
          BottomNavigationBarItem(icon: Icon(Icons.design_services),
          backgroundColor: Colors.orangeAccent,
          title: Text('Design')
          ),
          BottomNavigationBarItem(icon: Icon(Icons.repeat_rounded),
          backgroundColor: Colors.orangeAccent,
          title: Text('Response')
          ),
          BottomNavigationBarItem(icon: Icon(Icons.menu_rounded),
          backgroundColor: Colors.orangeAccent,
          title: Text('Dictionary')
          ),
        ],
        onTap: (index) {
          setState((){
            _currentIndex = index;
          });
        }, )
      ),
    );
  }
}

class TestForm extends StatefulWidget {
  @override
  _TestFormState createState() => _TestFormState();
}

class _TestFormState extends State<TestForm> {
  final _formKey = GlobalKey<FormState>();
  Model model = Model();

  @override
  Widget build(BuildContext context) {
    final halfMediaWidth = MediaQuery.of(context).size.width / 2.0;

    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          
          Container(
            alignment: Alignment.bottomCenter,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FadeAnimation(1.5,Container(
                  alignment: Alignment.bottomCenter,
                  width: halfMediaWidth,
                  child: MyTextFormField(
                    hintText: 'First Name',
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Enter your first name';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      model.firstName = value;
                    },
                  ),
                )),
                FadeAnimation(1.5,Container(
                  alignment: Alignment.topCenter,
                  width: halfMediaWidth,
                  child: MyTextFormField(
                    hintText: 'Last Name',
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Enter your last name';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      model.lastName = value;
                    },
                  ),
                ))
              ],
            ),
          ),
          MyTextFormField(
            hintText: 'Email',
            isEmail: true,
            validator: (String value) {
              if (!validator.isEmail(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
            onSaved: (String value) {
              model.email = value;
            },
          ),
          MyTextFormField(
            hintText: 'Phone Number',
            isPassword: false,
            validator: (String value) {
              if (value.length < 10) {
                return 'Phone Number should be minimum 10 characters';
              }

              _formKey.currentState.save();

              return null;
            },
            onSaved: (String value) {
              model.password = value;
            },
          ),
          // MyTextFormField(
          //   hintText: 'Confirm Password',
          //   isPassword: true,
          //   validator: (String value) {
          //     if (value.length < 7) {
          //       return 'Password should be minimum 7 characters';
          //     } else if (model.password != null && value != model.password) {
          //       print(value);
          //       print(model.password);
          //       return 'Password not matched';
          //     }

          //     return null;
          //   },
          // ),
          ElevatedButton( 
            // style: ButtonStyle(backgroundColor: Color(Colors.)
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Results(model: this.model)));
              }
            },
            child: Text(
              'Save',
              style: TextStyle(
                color: Colors.black
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MyTextFormField extends StatelessWidget {
  final String hintText;
  final Function validator;
  final Function onSaved;
  final bool isPassword;
  final bool isEmail;

  MyTextFormField({
    this.hintText,
    this.validator,
    this.onSaved,
    this.isPassword = false,
    this.isEmail = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.all(15.0),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[200],
        ),
        obscureText: isPassword ? true : false,
        validator: validator,
        onSaved: onSaved,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      ),
    );
  }
}