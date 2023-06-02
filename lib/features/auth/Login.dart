import 'package:demo/features/auth/RegisterPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:demo/features/auth/login.style.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: const TextSpan(
                    // Note: Styles for TextSpans must be explicitly defined.
                    // Child text spans will inherit styles from parent
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(text: 'HELLO!', style: TextStyle()),
                      TextSpan(
                          text: ' \nWelcome ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                    ]),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Container(
                  decoration: kBoxDecorationStyle,
                  height: 65.0,
                  child: TextField(
                    onChanged: (val) {},
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      label: Text(
                        "Username",
                        style: TextStyle(color: Colors.deepPurpleAccent),
                      ),
                      hintStyle: kHintTextStyle,
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Container(
                  decoration: kBoxDecorationStyle,
                  height: 65.0,
                  child: TextField(
                    onChanged: (val) {},
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      label: Text(
                        "Password",
                        style: TextStyle(color: Colors.deepPurpleAccent),
                      ),
                      hintStyle: kHintTextStyle,
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Container(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forgot Password?',
                      style: kLabelStyle,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Dont't have an account? ",
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => RegisterPage()),
                      );
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))
                          .copyWith(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple, elevation: 5),
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  icon: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                  label: const Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
