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
      appBar: AppBar(title: Text("Third Screen")),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // create form of username and password
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    hintText: "Please enter your Username",
                    labelText: "Username",
                    icon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter username";
                    } else if (value.length < 6) {
                      return "Username must be at least 6 characters";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  obscureText: true,
                  obscuringCharacter: '*',
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    hintText: "Please enter your Password",
                    labelText: "Password",
                    icon: Icon(Icons.lock),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter password";
                    } else if (value.length < 8) {
                      return "Password must be at least 8 characters";
                    }
                    return null;
                  },
                ),
                // phone number
                TextFormField(
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    hintText: "Please enter your Phone Number",
                    labelText: "Phone Number",
                    icon: Icon(Icons.phone),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter phone number";
                    } else if (value.length < 8) {
                      return "Phone number must be at least 8 characters";
                    } else if (!value.contains('+856')) {
                      return "Phone number must contain a country code";
                    }
                    return null;
                  },
                ),
                // email
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    hintText: "Please enter your Email",
                    labelText: "Email",
                    icon: Icon(Icons.email),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter email";
                    } else if (!value.contains('@')) {
                      return "Email must contain @";
                    } else if (!value.contains('.')) {
                      return "Email must contain .";
                    }

                    return null;
                  },
                ),
                // submit button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print("Username: ${_usernameController.text}");
                      print("Password: ${_passwordController.text}");
                      print("Phone: ${_phoneController.text}");
                      print("Email: ${_emailController.text}");

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Processing Data")),
                      );
                    }
                  },
                  child: const Text("Submit"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
