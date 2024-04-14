
import 'package:flutter/material.dart';

class AuthenticationForm extends StatefulWidget {
  const AuthenticationForm({super.key});

  @override
  State<AuthenticationForm> createState() => _AuthenticationFormState();
}

class _AuthenticationFormState extends State<AuthenticationForm> {

  final _formKey = GlobalKey<FormState>();
  late bool isLogin = true;

  ChangeIsLoginValue(){
    setState(() {
      isLogin = !isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isLogin? Text("Login") : Text("SignUp"),
        centerTitle: true,
        shadowColor: Colors.black,
        elevation: 2,
      ),
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            children: [
             if(!isLogin) TextFormField(
               key: ValueKey("first name"),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: "Enter first name"
                ),
              ),
              if(!isLogin) TextFormField(
                key: ValueKey("last name"),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                  hintText: "Enter last name"
                ),
              ),
              TextFormField(
                key: ValueKey("email"),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                  hintText: "Enter email"
                ),
              ),
              TextFormField(
                key: ValueKey("password"),
                obscureText: isLogin,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.security),
                  hintText: "Enter password"
                ),
              ),
              const SizedBox(height: 40,),
              SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: (){},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.yellow)
                  ),
                  child: isLogin? Text("Login"): Text("SignUp"),
                ),
              ),
              TextButton(onPressed: () => ChangeIsLoginValue(),
                  child: isLogin? Text("Don't have an account? SignUp ") : Text("Already have an account? Login"))
            ],
          ),
        ),
      ),
    );
  }
}
