
import 'package:taskm/phone_auth.dart';
import 'package:taskm/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:taskm/ui.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(title: 'Flutter Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
String _email ;

class _MyHomePageState extends State<MyHomePage> {
  FirebaseMessaging _message = FirebaseMessaging();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController controllerEmail, controllerPass;
  @override
  void initState() {
    super.initState();
    controllerEmail = TextEditingController();
    controllerPass = TextEditingController();
    _message.getToken().then((token){
      print('token is');
      print(token);
    });
  }
  

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      style: style,
      
      validator: (email)=>EmailValidator.validate(email)? null:"Invalid ",
      onSaved: (email)=> _email = email,
      controller: controllerEmail,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final passwordField = TextFormField(
      maxLength: 12,
      obscureText: true,
      style: style,
      validator: (val) => val.length < 5 ? 'Password too short.' : null,
      controller: controllerPass,
      
      decoration: InputDecoration(
        
         
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
          
          
    );

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.deepPurple,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: loginWithEmailPass,
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 200.0,
                      child: Image.asset(
                        "assets/taskm.jpg",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 45.0),
                    
                    emailField,

                    SizedBox(height: 25.0),
                    passwordField,
                   
                    SizedBox(
                      height: 35.0,
                    ),
                    loginButon,
                    SizedBox(
                      height: 50.0,
                    ),
                    new Center(
                        child: new Row(children: [
                     
                      Padding(padding: EdgeInsets.all(10)),
                      new IconButton(
                        padding: new EdgeInsets.all(0.0),
                        icon: new Image.asset('assets/otp.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PhoneAuth()));
                        },
                      ),
                      SizedBox(width: 50,),
                      Padding(padding: EdgeInsets.all(10)),
                      new IconButton(
                        padding: new EdgeInsets.all(0.0),
                        icon: new Image.asset('assets/logo.png'),
                        onPressed: null,
                      ),
                      SizedBox(width: 50,),
                      Padding(padding: EdgeInsets.all(10)),
                      new IconButton(
                        padding: new EdgeInsets.all(0.0),
                        icon: new Image.asset('assets/add.jpg'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Register()));
                        },
                      )

                    ]))
                  ],
                ),
                
              ),
            ),
          ),
        ));
  }

  void loginWithEmailPass() async {
    FirebaseUser user;
    try {
      var user = (await auth.signInWithEmailAndPassword(
              email: controllerEmail.text, password: controllerPass.text))
          .user;
      if (user.uid != null) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ui()));
      }
     
    } catch (e) {
      if (e.code == "ERROR_USER_NOT_FOUND") {
        Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Show Snackbar'),
        duration: Duration(seconds: 10)));
        
      }
     
       
    } finally {}
  }

  _signOut() async {
    await _firebaseAuth.signOut();
  }
}
