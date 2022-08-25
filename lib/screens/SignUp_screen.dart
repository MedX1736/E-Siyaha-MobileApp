import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_siyaha/components/user_model.dart';
import 'package:flutter_e_siyaha/screens/mappage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpScreen extends StatefulWidget {
  static String routename = "/signup" ; 
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _auth = FirebaseAuth.instance;

  //form key
  final _formKey = GlobalKey<FormState>();

  //editing controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController firstNameController = new TextEditingController();
  final TextEditingController secondNameController =
      new TextEditingController();
  final TextEditingController ConfirmPasswordController =
      new TextEditingController();
  final TextEditingController phoneNumberController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    //First name field
    final firstNameField = Container(
      child: Column(children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Nom',
            style: TextStyle(
                color: Colors.orange[900], fontFamily: 'lexend', fontSize: 18),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
            autocorrect: false,
            controller: firstNameController,
            validator: (value) {
              RegExp regex = new RegExp(r'^.{3,}$');
              if (value!.isEmpty) {
                return ("Le nom ne peut pas etre vide");
              }
              if (!regex.hasMatch(value)) {
                return ("Veillez saisir un Nom valide (min 3)");
              }
              return null;
            },
            keyboardType: TextInputType.name,
            onSaved: (value) {
              firstNameController.text = value!;
            },
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              fillColor: Colors.grey[100],
              filled: true,
              prefixIcon: Icon(Icons.account_circle),
              iconColor: Colors.orange[900],
              contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(width: 0)),
            ))
      ]),
    );

    //Second name field
    final secondNameField = Container(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Prénom',
              style: TextStyle(
                  color: Color(0xffFF5931), fontFamily: 'lexend', fontSize: 16),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            autocorrect: false,
            controller: secondNameController,
            validator: (value) {
              if (value!.isEmpty) {
                return ("Le prenom ne peut pas etre vide");
              }
              return null;
            },
            keyboardType: TextInputType.name,
            onSaved: (value) {
              secondNameController.text = value!;
            },
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              fillColor: Colors.grey[100],
              filled: true,
              prefixIcon: Icon(Icons.account_circle),
              contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            ),
          )
        ],
      ),
    );

    //email field
    final emailField = Container(
      child: Column(
        children: [
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
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              fillColor: Colors.grey[100],
              filled: true,
              prefixIcon: Icon(Icons.email),
              contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            ),
          )
        ],
      ),
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
              RegExp regex = new RegExp(r'^.{6,}$');
              if (value!.isEmpty) {
                return ("Veuillez saisir votre mot de passe");
              }
              if (!regex.hasMatch(value)) {
                return ("Veillez saisir un mot de passe valide (min 6)");
              }
            },
            onSaved: (value) {
              passwordController.text = value!;
            },
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              fillColor: Colors.grey[100],
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

    //confirm password field
    final confirmPasswordField = Container(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Confirmez votre mot de passe',
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
            controller: ConfirmPasswordController,
            validator: (value) {
              if (ConfirmPasswordController.text != passwordController.text) {
                return "le mot de passe n'est pas correct";
              }
              return null;
            },
            onSaved: (value) {
              ConfirmPasswordController.text = value!;
            },
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              fillColor: Colors.grey[100],
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

    //Phone number field
    final phoneNumberField = Container(
      child: Column(children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Numero de telephone',
            style: TextStyle(
                color: Color(0xffFF5931), fontFamily: 'lexend', fontSize: 16),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
            autocorrect: false,
            controller: phoneNumberController,
            validator: (value) {
              RegExp regex = new RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
              if (value!.isEmpty) {
                return ("Veuillez saisir votre numero de telephone");
              }
              if (!regex.hasMatch(value)) {
                return ("Veillez saisir un numero de telephone valide");
              }
              return null;
            },
            keyboardType: TextInputType.name,
            onSaved: (value) {
              phoneNumberController.text = value!;
            },
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              fillColor: Colors.grey[100],
              filled: true,
              prefixIcon: Icon(Icons.phone),
              iconColor: Colors.orange[900],
              contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(width: 0)),
            ))
      ]),
    );

    //signup button
    final loginButton = Material(
      borderRadius: BorderRadius.circular(10),
      color: Color(0xff40D86B),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 2, 20, 2),
        //minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          signUp(emailController.text, passwordController.text);
        },
        child: Text(
          "S'inscrire",
          style: TextStyle(
              fontSize: 16, color: Colors.white, fontFamily: 'lexend'),
        ),
      ),
    );

// SignUp slide
    final signupslide = SingleChildScrollView(
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
                firstNameField,
                SizedBox(height: 15),
                secondNameField,
                SizedBox(height: 15),
                emailField,
                SizedBox(height: 15),
                passwordField,
                SizedBox(height: 15),
                confirmPasswordField,
                SizedBox(height: 15),
                phoneNumberField,
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: loginButton,
                ),
              ],
            ),
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Color(0xff2A0082),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 60),
                child: Column(children: [
                  Image.asset(
                    'assets/logo2.png',
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    ' E-SIYAHA',
                    style: TextStyle(
                        fontFamily: 'lexend',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFEBDAF8)),
                  )
                ]),
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: signupslide),
          ),
        ],
      ),
    );
  }

  //signUp function
  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsToFirestore() async {
//calling our firestore
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

//calling user model
    UserModel userModel = UserModel();
//writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstname = firstNameController.text;
    userModel.secondname = secondNameController.text;
    userModel.tel = phoneNumberController.text;

//sending these values
    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Votre compte a été crée correctement");
    Navigator.pushAndRemoveUntil((context),
        MaterialPageRoute(builder: (context) => MapPage()), (route) => false);
  }
}