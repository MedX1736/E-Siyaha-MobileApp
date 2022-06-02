import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_e_siyaha/screens/SignUp_screen.dart';
import 'package:flutter_e_siyaha/screens/mappage.dart';
import 'package:flutter_e_siyaha/screens/splash_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //form key
  final _formKey = GlobalKey<FormState>();

  //editing controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  //firebase
  // final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    //email field
    final emailField = Container(
      child: Column(children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'E-mail',
            style: TextStyle(
                color: Color(0xffFF5931), fontFamily: 'lexend', fontSize: 16),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
            autocorrect: false,
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value!.isEmpty) {
                return ("Veuillez saisir votre E-mail");
              }
              //reg expression for email validation
              if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+.[a-z]")
                  .hasMatch(value)) {
                return ("Veillez saisir une addrese e-mail valide");
              }
              return null;
            },
            onSaved: (value) {
              emailController.text = value!;
            },
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              fillColor: Color(0xffF2F2F2),
              filled: true,
              prefixIcon: Icon(Icons.mail),
              iconColor: Color(0xffFF5931),
              contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(width: 0)),
            ))
      ]),
    );

    //password field
    final passwordField = Container(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Mot de passe',
              style: TextStyle(
                  color: Color(0xffFF5931), fontFamily: 'lexend', fontSize: 16),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            autocorrect: false,
            obscureText: true,
            controller: passwordController,
            validator: (value) {
              RegExp regex = new RegExp(r'^,{6,}$');
              if (value!.isEmpty) {
                return ("Veuillez saisir votre mot de passe");
              }
              if (!regex.hasMatch(value)) {
                return ("Veillez saisir un mot de passe valide (min 6 characteres)");
              }
            },
            onSaved: (value) {
              passwordController.text = value!;
            },
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              fillColor: Color(0xffF2F2F2),
              filled: true,
              prefixIcon: Icon(Icons.vpn_key),
              contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            ),
          )
        ],
      ),
    );

    //login button
    final loginButton = Material(
      borderRadius: BorderRadius.circular(10),
      color: Color(0xff40D86B),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 2, 20, 2),
        //minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MapPage()));
        },
        child: Text(
          "Se connecter",
          style: TextStyle(
              fontSize: 16, color: Colors.white, fontFamily: 'lexend'),
        ),
      ),
    );

    //user image
    final userImage = SizedBox(
      height: 120,
      child: Image.asset(
        'assets/touriste.png',
        fit: BoxFit.contain,
      ),
    );

    //messsage for signup
    final signupMessage = Column(
      children: [
        Text(
          'Vous n' 'avez pas un compte ?',
          style: TextStyle(fontFamily: 'lexend', fontSize: 14),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: Text(
            'Créer un compte',
            style: TextStyle(
                fontFamily: 'lexend',
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xffFF5931)),
          ),
        )
      ],
    );

    //login slide
    final loginslide = SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(36.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                userImage,
                SizedBox(height: 15),
                emailField,
                SizedBox(height: 10),
                passwordField,
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: loginButton,
                ),
                SizedBox(height: 20),
                signupMessage
              ],
            ),
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Color(0xFFEBDAF8),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 90),
                child: Column(children: [
                  Image.asset(
                    'assets/logo.png',
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'E-SIYAHA',
                    style: TextStyle(
                        fontFamily: 'lexend',
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffFF5931)),
                  )
                ]),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: loginslide),
          ),
        ],
      ),
    );
  }
}