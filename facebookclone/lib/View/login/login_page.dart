// ignore_for_file: valid_regexps

import 'dart:developer';

import 'package:facebookclone/View/home/home_page.dart';
import 'package:flutter/material.dart';

import '../../core/utlis/push_notification.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  String? validateEmail(String? email) {
    RegExp emailRegex = RegExp(r'^[\w\.-]+@[\w-]+\.\w{2,3}9\.\w{2,3})?$');
    final isEmailValid = emailRegex.hasMatch(email ?? '');
    if (!isEmailValid) {
      return 'Please enter a valid email';
    }
    return null;
  }

  final PushNotificationService _notification = PushNotificationService();

  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            'facebook',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              NewWidget(usernameController: _usernameController),
              const SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                  validator: (password) =>
                      password!.length < 6 ? "password is too short" : null,
                ),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Confirm Password',
                  ),
                  //   validator: (password) =>
                  //       password!.length < 6 ? "password " : null,
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      setState(() {
                        isloading = true;
                      });
                      final token = await _notification.getToken();
                      log("----- TOKEN ------ $token");

                      await Future.delayed(const Duration(seconds: 2));
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    }
                  },
                  child: isloading
                      ? const CircularProgressIndicator()
                      : const Text(
                          "LOGIN",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                ),
              ),
              const Column(
                children: [
                  Text(
                    'Forgotten password?',
                    style: TextStyle(fontSize: 20, color: Colors.blue),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.all(6.0),
                child: Row(
                  children: [
                    Expanded(
                        child: Divider(
                      thickness: 1,
                      color: Colors.black,
                    )),
                    Text(
                      'or',
                      style: TextStyle(fontSize: 24),
                    ),
                    Expanded(
                        child: Divider(
                      thickness: 1,
                      color: Colors.black,
                    ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(70),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.green[400]),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Create New Account',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('About'),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Help'),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('More'),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Column(
                children: [
                  Text(
                    'Meta 2024',
                    style: TextStyle(fontSize: 15),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
    required TextEditingController usernameController,
  }) : _usernameController = usernameController;

  final TextEditingController _usernameController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: _usernameController,
        decoration: const InputDecoration(
          labelText: 'Mobile number or email address',
        ),
        validator: (name) => name!.length < 8 ? "name is too short" : null,
      ),
    );
  }
}
