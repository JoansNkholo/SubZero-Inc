import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:swap_shop/models/user_model.dart';
import 'package:swap_shop/screens/create_listing.dart';
import 'package:swap_shop/screens/login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  //form key
  final _formKey = GlobalKey<FormState>();

  //editing controller

  final TextEditingController nameEditingController =
      new TextEditingController();
  final TextEditingController surnameEditingController =
      new TextEditingController();
  final TextEditingController usernameEditingController =
      new TextEditingController();
  final TextEditingController passwordEditingController =
      new TextEditingController();
  final TextEditingController emailEditingController =
      new TextEditingController();
  final TextEditingController confirmPasswordEditingController =
      new TextEditingController();
  final TextEditingController suburbEditingController =
      new TextEditingController();
  final TextEditingController cityEditingController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    //name field
    final nameField = TextFormField(
      autofocus: false,
      controller: nameEditingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("Name Cannot be Empty");
        }

        if (!regex.hasMatch(value)) {
          return ("Please Enter Valid Name (3 Characters Min)");
        }
        return null;
      },
      onSaved: (value) {
        nameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "First Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

//surname field
    final surnameField = TextFormField(
      autofocus: false,
      controller: surnameEditingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Surname Cannot be Empty");
        }
        return null;
      },
      onSaved: (value) {
        surnameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Last Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

//username field
    final usernameField = TextFormField(
      autofocus: false,
      controller: usernameEditingController,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Username Cannot be Empty");
        }
        return null;
      },
      onSaved: (value) {
        usernameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Username",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

//email field
    final emailField = TextFormField(
      autofocus: false,
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }
        //reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please enter a valid email");
        }
        return null;
      },
      onSaved: (value) {
        emailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

//password field
    final passwordField = TextFormField(
      obscureText: true,
      autofocus: false,
      controller: passwordEditingController,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return "Password Required";
        }

        if (!regex.hasMatch(value)) {
          return ("Please Enter Valid Password (6 Characters Min)");
        }
      },
      onSaved: (value) {
        passwordEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

//confirm password field
    final confirmPasswordField = TextFormField(
      obscureText: true,
      autofocus: false,
      controller: confirmPasswordEditingController,
      validator: (value) {
        if (confirmPasswordEditingController.text !=
            passwordEditingController.text) {
          return "Passwords don't match";
        }
        return null;
      },
      onSaved: (value) {
        confirmPasswordEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Confirm Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

//suburb field
    final suburbField = TextFormField(
      autofocus: false,
      controller: suburbEditingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Suburb Cannot be Empty");
        }
        return null;
      },
      onSaved: (value) {
        suburbEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.domain),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Suburb",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

//city field
    final cityField = TextFormField(
      autofocus: false,
      controller: cityEditingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return ("City Cannot be Empty");
        }
        return null;
      },
      onSaved: (value) {
        cityEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.location_city),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "City",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

//sign up button
    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.red,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          signUp(emailEditingController.text, passwordEditingController.text);
        },
        child: Text(
          "Sign Up",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 30,
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.red),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ),
        body: Center(
            child: SingleChildScrollView(
                child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Form(
              key: _formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 100,
                      child: Image.asset(
                        "assets/logo.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    nameField,
                    SizedBox(
                      height: 10,
                    ),
                    surnameField,
                    SizedBox(
                      height: 10,
                    ),
                    usernameField,
                    SizedBox(
                      height: 10,
                    ),
                    emailField,
                    SizedBox(
                      height: 10,
                    ),
                    passwordField,
                    SizedBox(
                      height: 10,
                    ),
                    confirmPasswordField,
                    SizedBox(
                      height: 10,
                    ),
                    suburbField,
                    SizedBox(
                      height: 10,
                    ),
                    cityField,
                    SizedBox(
                      height: 20,
                    ),
                    signUpButton,
                  ]),
            ),
          ),
        ))));
  }

  postDetailsToFirestore() async {
    //calling firestore
    //calling our user model
    //sending values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    //writing values

    userModel.name = nameEditingController.text;
    userModel.surname = surnameEditingController.text;
    userModel.username = usernameEditingController.text;
    userModel.email = user!.email;
    userModel.suburb = suburbEditingController.text;
    userModel.city = cityEditingController.text;
    userModel.uid = user.uid;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());

    Fluttertoast.showToast(
        msg: "Account Created Successfully", gravity: ToastGravity.TOP);
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()});
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginScreen()));
      } on FirebaseAuthException catch (error) {
        Fluttertoast.showToast(
            msg: error.message.toString(), gravity: ToastGravity.TOP);
      }
    }
  }
}
