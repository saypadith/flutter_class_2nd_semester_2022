import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  var genderOptions = ['Male', 'Female', 'Other'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Third Screen"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                FormBuilderRangeSlider(
                  name: 'range_slider',
                  // onChanged: _onChanged,
                  min: 0.0,
                  max: 100.0,
                  initialValue: const RangeValues(4, 7),
                  divisions: 20,
                  maxValueWidget: (max) => TextButton(
                    onPressed: () {
                      _formKey.currentState?.patchValue(
                        {'range_slider': const RangeValues(4, 100)},
                      );
                    },
                    child: Text(max),
                  ),
                  activeColor: Colors.red,
                  inactiveColor: Colors.pink[100],
                  decoration: const InputDecoration(labelText: 'Price Range'),
                ),
                FormBuilderCheckbox(
                  name: 'accept_terms',
                  initialValue: false,
                  // onChanged: _onChanged,
                  title: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'I have read and agree to the ',
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: 'Terms and Conditions',
                          style: TextStyle(color: Colors.blue),
                          // Flutter doesn't allow a button inside a button
                          // https://github.com/flutter/flutter/issues/31437#issuecomment-492411086
                          /*
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print('launch url');
                              },
                            */
                        ),
                      ],
                    ),
                  ),
                  validator: FormBuilderValidators.equal(
                    true,
                    errorText:
                        'You must accept terms and conditions to continue',
                  ),
                ),
                FormBuilderTextField(
                  autovalidateMode: AutovalidateMode.always,
                  name: 'age',
                  decoration: InputDecoration(
                    labelText: 'Age',
                    // suffixIcon: _ageHasError
                    // ? const Icon(Icons.error, color: Colors.red)
                    // : const Icon(Icons.check, color: Colors.green),
                  ),
                  onChanged: (val) {
                    setState(() {
                      // _ageHasError =
                      //     !(_formKey.currentState?.fields['age']?.validate() ??
                      //         false);
                    });
                  },
                  // valueTransformer: (text) => num.tryParse(text),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.numeric(),
                    FormBuilderValidators.max(70),
                  ]),
                  // initialValue: '12',
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                ),
                FormBuilderDropdown<String>(
                  name: 'gender',
                  decoration: InputDecoration(
                    labelText: 'Gender',
                    // suffix: _genderHasError
                    //     ? const Icon(Icons.error)
                    //     : const Icon(Icons.check),
                    hintText: 'Select Gender',
                  ),
                  validator: FormBuilderValidators.compose(
                      [FormBuilderValidators.required()]),
                  items: genderOptions
                      .map((gender) => DropdownMenuItem(
                            alignment: AlignmentDirectional.center,
                            value: gender,
                            child: Text(gender),
                          ))
                      .toList(),
                  onChanged: (val) {
                    // setState(() {
                    //   _genderHasError = !(_formKey
                    //           .currentState?.fields['gender']
                    //           ?.validate() ??
                    //       false);
                    // });
                  },
                  valueTransformer: (val) => val?.toString(),
                ),
                FormBuilderRadioGroup<String>(
                  decoration: const InputDecoration(
                    labelText: 'My chosen language',
                  ),
                  initialValue: null,
                  name: 'best_language',
                  // onChanged: _onChanged,
                  validator: FormBuilderValidators.compose(
                      [FormBuilderValidators.required()]),
                  options: ['Dart', 'Kotlin', 'Java', 'Swift', 'Objective-C']
                      .map((lang) => FormBuilderFieldOption(
                            value: lang,
                            child: Text(lang),
                          ))
                      .toList(growable: false),
                  controlAffinity: ControlAffinity.trailing,
                ),
                FormBuilderSwitch(
                  title: const Text('I Accept the terms and conditions'),
                  name: 'accept_terms_switch',
                  initialValue: true,
                  // onChanged: _onChanged,
                ),
                FormBuilderCheckboxGroup<String>(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                      labelText: 'The language of my people'),
                  name: 'languages',
                  // initialValue: const ['Dart'],
                  options: const [
                    FormBuilderFieldOption(value: 'Dart'),
                    FormBuilderFieldOption(value: 'Kotlin'),
                    FormBuilderFieldOption(value: 'Java'),
                    FormBuilderFieldOption(value: 'Swift'),
                    FormBuilderFieldOption(value: 'Objective-C'),
                  ],
                  // onChanged: _onChanged,
                  separator: const VerticalDivider(
                    width: 10,
                    thickness: 5,
                    color: Colors.red,
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.minLength(1),
                    FormBuilderValidators.maxLength(3),
                  ]),
                ),
                // create form for username and password
                // TextFormField(
                //   decoration: const InputDecoration(
                //     labelText: "ຊື່ຜູ້ໃຊ້ງານ",
                //     hintText: "Please input username",
                //     icon: Icon(Icons.person),
                //   ),
                //   controller: usernameController,
                //   validator: (value) {
                //     if (value!.isEmpty) {
                //       return "ກະລຸນາປ້ອນຊື່ຜູ້ໃຊ້ງານ";
                //     } else if (value.length < 6) {
                //       return "Username must be more than 6 characters";
                //     }
                //   },
                // ),
                // TextFormField(
                //   decoration: const InputDecoration(
                //     labelText: "ລະຫັດຜ່ານ",
                //     hintText: "Please input password",
                //     icon: Icon(Icons.lock),
                //   ),
                //   controller: passwordController,
                //   obscureText: true,
                //   obscuringCharacter: '*',
                //   validator: (value) {
                //     if (value!.isEmpty) {
                //       return "Please fill the password";
                //     } else if (value.length < 8) {
                //       return "Password must be more than 8 characters";
                //     }
                //   },
                // ),
                // TextFormField(
                //   decoration: const InputDecoration(
                //     labelText: "ເບີໂທລະສັບ",
                //     hintText: "Please input phone number",
                //     icon: Icon(Icons.phone_rounded),
                //   ),
                //   controller: phoneController,
                //   keyboardType: TextInputType.phone,
                //   validator: (value) {
                //     if (value!.isEmpty) {
                //       return "Please fill the phone number";
                //     } else if (value.length < 10) {
                //       return "Phone number must be more than 10 characters";
                //     } else if (value.contains('+')) {
                //       return "Do not use any special character";
                //     }
                //   },
                // ),
                // // email address
                // TextFormField(
                //   decoration: const InputDecoration(
                //     labelText: "ອີເມວ",
                //     hintText: "Please input email address",
                //     icon: Icon(Icons.email),
                //   ),
                //   controller: emailController,
                //   keyboardType: TextInputType.emailAddress,
                //   validator: (value) {
                //     if (value!.isEmpty) {
                //       return "Please fill the email address";
                //     } else if (!value.contains("@")) {
                //       return "Please input correct email address";
                //     }
                //   },
                // ),
                // SizedBox(
                //   height: 20,
                // ),
                // // submit button
                // ElevatedButton(
                //   onPressed: () {
                //     if (formKey.currentState!.validate()) {
                //       print("username: " + usernameController.text);
                //       print("password: " + passwordController.text);
                //       print("phone: " + phoneController.text);
                //       print("email: " + emailController.text);

                //       ScaffoldMessenger.of(context).showSnackBar(
                //         const SnackBar(
                //           content: Text("Your form is valid!"),
                //         ),
                //       );
                //     }
                //   },
                //   child: const Text("ລົງທະບຽນ"),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
