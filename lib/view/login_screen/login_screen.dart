import 'package:flutter/material.dart';

import 'package:task/view/home_screen/home_screen.dart';
import 'package:task/view/register_screen/register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _emailkey = GlobalKey<FormState>();
    GlobalKey<FormState> _passkey1 = GlobalKey<FormState>();

    TextEditingController emailController = TextEditingController();
    TextEditingController passcontroller1 = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            const Center(
              child: Text(
                'Sign  in to Your Account',
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              ),
            ),
            Form(
              key: _emailkey,
              child: TextFormField(
                controller: emailController,
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
                controller: passcontroller1,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.remove_red_eye_rounded),
                    labelText: "Password",
                    contentPadding: const EdgeInsets.all(10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40))),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              children: [
                Icon(
                  Icons.check_box_outline_blank_outlined,
                  color: Colors.black,
                  size: 30,
                ),
                Text(
                  'Remember Me',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {
                if (_emailkey.currentState!.validate() &&
                    _passkey1.currentState!.validate()) {
                  if (emailController.text == storedEmail &&
                      passcontroller1.text == storedPassword) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      backgroundColor: Colors.red,
                      content: const Text(
                        'Invalid Credentials',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ));
                  }
                }
              },
              child: Container(
                height: 60,
                width: 400,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 19, 124, 209),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: const Center(
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
            const SizedBox(
              height: 300,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ),
                      (route) => false,
                    );
                  },
                  child: const Text(
                    'Sign Up',
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
