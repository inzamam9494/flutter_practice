
import 'package:flutter/material.dart';
import 'package:flutter_practice/services/functions/authentication.dart';

class AuthenticationForm extends StatefulWidget {
  const AuthenticationForm({super.key});

  @override
  State<AuthenticationForm> createState() => _AuthenticationFormState();
}

class _AuthenticationFormState extends State<AuthenticationForm> {
  final _formKey = GlobalKey<FormState>();
  late bool isLogin = true;

  late String fName = '';
  late String lName = '';
  late String email = '';
  late String password = '';

  ChangeIsLoginValue() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isLogin ? const Text("Login") : const Text("SignUp"),
        centerTitle: true,
        shadowColor: Colors.black,
        elevation: 2,
      ),
      body: Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            children: [
              if (!isLogin)
                TextFormField(
                  key: const ValueKey("first name"),
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: "Enter first name"),
                  validator: (val) {
                    if (val.toString().length < 2) {
                      return 'Please Enter a Valid first name';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (val) {
                    setState(() {
                      fName = val.toString();
                    });
                  },
                ),
              if (!isLogin)
                TextFormField(
                  key: const ValueKey("last name"),
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: "Enter last name"),
                  validator: (val) {
                    if (val.toString().length < 2) {
                      return 'Please Enter the valid last name';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (val) {
                    setState(() {
                      lName = val.toString();
                    });
                  },
                ),
              TextFormField(
                key: const ValueKey("email"),
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    hintText: "Enter email"),
                validator: (val) {
                  if (val.toString().isEmpty || !val.toString().contains('@')) {
                    return 'Please enter the valid Email';
                  } else {
                    return null;
                  }
                },
                onSaved: (val) {
                  setState(() {
                    email = val.toString();
                  });
                },
              ),
              TextFormField(
                key: const ValueKey("password"),
                obscureText: true,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.security),
                    hintText: "Enter password"),
                validator: (val) {
                  if (val.toString().length < 6 ||
                      !val.toString().contains('#')) {
                    return "Please Enter the Valid Password";
                  } else {
                    return null;
                  }
                },
                onSaved: (val) {
                  setState(() {
                    password = val.toString();
                  });
                },
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      isLogin
                          ? Authentication.signIn(context, email, password)
                          : Authentication.signUp(context, email, password, fName, lName);
                    }
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.yellow)),
                  child: isLogin ? const Text("Login") : const Text("SignUp"),
                ),
              ),
              TextButton(
                  onPressed: () => ChangeIsLoginValue(),
                  child: isLogin
                      ? const Text("Don't have an account? SignUp ")
                      : const Text("Already have an account? Login"))
            ],
          ),
        ),
      ),
    );
  }
}
