import 'package:flutter/material.dart';

import 'package:task/view/login_screen/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _emailkey = GlobalKey<FormState>();
    GlobalKey<FormState> _passkey1 = GlobalKey<FormState>();
    GlobalKey<FormState> _passkey2 = GlobalKey<FormState>();
    TextEditingController regemailcontroller = TextEditingController();
    TextEditingController regpasscontroller1 = TextEditingController();
    TextEditingController passcontroller2 = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
            ),
            Center(
              child: Text(
                'Sign Up for Free',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Form(
              key: _emailkey,
              child: TextFormField(
                controller: regemailcontroller,
                decoration: InputDecoration(
                  labelText: "Email",
                  prefixIcon: const Icon(Icons.person),
                  contentPadding: const EdgeInsets.all(8),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
              key: _passkey1,
              child: TextFormField(
                controller: regpasscontroller1,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.remove_red_eye_rounded),
                    labelText: " Your Password",
                    contentPadding: const EdgeInsets.all(10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40))),
              ),
            ),
            Form(
              key: _passkey2,
              child: TextFormField(
                controller: passcontroller2,
                validator: (value) {
                  if (regpasscontroller1.text == passcontroller2.text) {
                    return null;
                  } else {
                    return 'Password does not Match';
                  }
                },
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                ),
                obscureText: true,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                        borderSide: BorderSide(
                          color: Colors.grey.withOpacity(.8),
                          width: 2,
                        )),
                    suffixIcon: Icon(
                      Icons.visibility_off,
                      size: 20,
                      color: Colors.grey.withOpacity(.8),
                    ),
                    hintText: 'Your Confirm Password',
                    hintStyle: TextStyle(
                      color: Colors.grey.withOpacity(.8),
                      fontSize: 20,
                    ),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 2,
                        ))),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {
                if (_emailkey.currentState!.validate() &&
                    _passkey1.currentState!.validate() &&
                    _passkey2.currentState!.validate()) {
                  storedEmail = regemailcontroller.text;
                  storedPassword = regpasscontroller1.text;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ));
                }
              },
              child: Container(
                height: 60,
                width: 400,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 19, 124, 209),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Center(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 250,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ));
                  },
                  child: Text(
                    'Sign In',
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class reg {
  static String? EmailController;
  static String? Pass1Controller;
}
