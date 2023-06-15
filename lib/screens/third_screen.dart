import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Third Screen"),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.all(16),
            child: Column(
              children: [
                //  textfield of username and password
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter your username',
                    label: Text("Username"),
                    icon: Icon(Icons.person),
                  ),
                  controller: _usernameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    } else if (value.length < 6) {
                      return 'Username must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter your password',
                    label: Text("Password"),
                    icon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                  obscuringCharacter: '*',
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    } else if (value.length < 8) {
                      return 'Password must be at least 8 characters';
                    }
                    return null;
                  },
                ),
                // phone
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter your phone number',
                    label: Text("Phone"),
                    icon: Icon(Icons.phone),
                  ),
                  keyboardType: TextInputType.phone,
                  controller: _phoneController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    } else if (value.length < 8) {
                      return 'Phone number must be at least 8 characters';
                    } else if (value.length > 10) {
                      return 'Phone number must be at most 10 characters';
                    } else if (!value.startsWith("20")) {
                      return 'Phone number must start with 20';
                    }
                    return null;
                  },
                ),
                // email
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter your email',
                    label: Text("Email"),
                    icon: Icon(Icons.email),
                  ),
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!value.contains('@')) {
                      return 'email must contain @ symbol';
                    } else if (!value.contains('.')) {
                      return 'email must contain . symbol';
                    }
                    return null;
                  },
                ),
                // submit button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print("Username: " + _usernameController.text);
                      print("Password: " + _passwordController.text);
                      print("Phone: " + _phoneController.text);
                      print("Email: " + _emailController.text);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
