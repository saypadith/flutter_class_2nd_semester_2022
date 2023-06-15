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
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  bool _ageHasError = false;
  bool _genderHasError = false;

  var genderOptions = ['Male', 'Female', 'Other'];

  void _onChanged(dynamic val) => debugPrint(val.toString());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Third Screen")),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: FormBuilder(
              key: _formKey,
              child: Column(
                children: [
                  // create form of username and password
                  // TextFormField(
                  //   controller: _usernameController,
                  //   decoration: const InputDecoration(
                  //     hintText: "Please enter your Username",
                  //     labelText: "Username",
                  //     icon: Icon(Icons.person),
                  //   ),
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return "Please enter username";
                  //     } else if (value.length < 6) {
                  //       return "Username must be at least 6 characters";
                  //     }
                  //     return null;
                  //   },
                  // ),
                  // TextFormField(
                  //   obscureText: true,
                  //   obscuringCharacter: '*',
                  //   controller: _passwordController,
                  //   decoration: const InputDecoration(
                  //     hintText: "Please enter your Password",
                  //     labelText: "Password",
                  //     icon: Icon(Icons.lock),
                  //   ),
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return "Please enter password";
                  //     } else if (value.length < 8) {
                  //       return "Password must be at least 8 characters";
                  //     }
                  //     return null;
                  //   },
                  // ),
                  // // phone number
                  // TextFormField(
                  //   controller: _phoneController,
                  //   decoration: const InputDecoration(
                  //     hintText: "Please enter your Phone Number",
                  //     labelText: "Phone Number",
                  //     icon: Icon(Icons.phone),
                  //   ),
                  //   keyboardType: TextInputType.phone,
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return "Please enter phone number";
                  //     } else if (value.length < 8) {
                  //       return "Phone number must be at least 8 characters";
                  //     } else if (!value.contains('+856')) {
                  //       return "Phone number must contain a country code";
                  //     }
                  //     return null;
                  //   },
                  // ),
                  // // email
                  // TextFormField(
                  //   controller: _emailController,
                  //   decoration: const InputDecoration(
                  //     hintText: "Please enter your Email",
                  //     labelText: "Email",
                  //     icon: Icon(Icons.email),
                  //   ),
                  //   keyboardType: TextInputType.emailAddress,
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return "Please enter email";
                  //     } else if (!value.contains('@')) {
                  //       return "Email must contain @";
                  //     } else if (!value.contains('.')) {
                  //       return "Email must contain .";
                  //     }

                  //     return null;
                  //   },
                  // ),
                  // // submit button
                  // ElevatedButton(
                  //   onPressed: () {
                  //     if (_formKey.currentState!.validate()) {
                  //       print("Username: ${_usernameController.text}");
                  //       print("Password: ${_passwordController.text}");
                  //       print("Phone: ${_phoneController.text}");
                  //       print("Email: ${_emailController.text}");

                  //       ScaffoldMessenger.of(context).showSnackBar(
                  //         const SnackBar(content: Text("Processing Data")),
                  //       );
                  //     }
                  //   },
                  //   child: const Text("Submit"),
                  // ),

                  FormBuilderDateTimePicker(
                    name: 'date',
                    initialEntryMode: DatePickerEntryMode.calendar,
                    initialValue: DateTime.now(),
                    inputType: InputType.both,
                    decoration: InputDecoration(
                      labelText: 'Appointment Time',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          _formKey.currentState!.fields['date']
                              ?.didChange(null);
                        },
                      ),
                    ),
                    initialTime: const TimeOfDay(hour: 8, minute: 0),
                    // locale: const Locale.fromSubtags(languageCode: 'fr'),
                  ),
                  FormBuilderDateRangePicker(
                    name: 'date_range',
                    locale: Locale('lo'),
                    firstDate: DateTime(1970),
                    lastDate: DateTime(2030),
                    // format: DateFormat('yyyy-MM-dd'),
                    onChanged: _onChanged,
                    decoration: InputDecoration(
                      labelText: 'Date Range',
                      helperText: 'Helper text',
                      hintText: 'Hint text',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          _formKey.currentState!.fields['date_range']
                              ?.didChange(null);
                        },
                      ),
                    ),
                  ),
                  FormBuilderSlider(
                    name: 'slider',
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.min(6),
                    ]),
                    onChanged: _onChanged,
                    min: 0.0,
                    max: 10.0,
                    initialValue: 7.0,
                    divisions: 20,
                    activeColor: Colors.red,
                    inactiveColor: Colors.pink[100],
                    decoration: const InputDecoration(
                      labelText: 'Number of things',
                    ),
                  ),
                  FormBuilderRangeSlider(
                    name: 'range_slider',
                    onChanged: _onChanged,
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
                    onChanged: _onChanged,
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
                      suffixIcon: _ageHasError
                          ? const Icon(Icons.error, color: Colors.red)
                          : const Icon(Icons.check, color: Colors.green),
                    ),
                    onChanged: (val) {
                      setState(() {
                        _ageHasError = !(_formKey.currentState?.fields['age']
                                ?.validate() ??
                            false);
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
                      suffix: _genderHasError
                          ? const Icon(Icons.error)
                          : const Icon(Icons.check),
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
                      setState(() {
                        _genderHasError = !(_formKey
                                .currentState?.fields['gender']
                                ?.validate() ??
                            false);
                      });
                    },
                    valueTransformer: (val) => val?.toString(),
                  ),
                  FormBuilderRadioGroup<String>(
                    decoration: const InputDecoration(
                      labelText: 'My chosen language',
                    ),
                    initialValue: null,
                    name: 'best_language',
                    onChanged: _onChanged,
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
                    onChanged: _onChanged,
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
                    onChanged: _onChanged,
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
                  FormBuilderFilterChip<String>(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                        labelText: 'The language of my people'),
                    name: 'languages_filter',
                    selectedColor: Colors.red,
                    options: const [
                      FormBuilderChipOption(
                        value: 'Dart',
                        avatar: CircleAvatar(child: Text('D')),
                      ),
                      FormBuilderChipOption(
                        value: 'Kotlin',
                        avatar: CircleAvatar(child: Text('K')),
                      ),
                      FormBuilderChipOption(
                        value: 'Java',
                        avatar: CircleAvatar(child: Text('J')),
                      ),
                      FormBuilderChipOption(
                        value: 'Swift',
                        avatar: CircleAvatar(child: Text('S')),
                      ),
                      FormBuilderChipOption(
                        value: 'Objective-C',
                        avatar: CircleAvatar(child: Text('O')),
                      ),
                    ],
                    onChanged: _onChanged,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.minLength(1),
                      FormBuilderValidators.maxLength(3),
                    ]),
                  ),
                  FormBuilderChoiceChip<String>(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                        labelText:
                            'Ok, if I had to choose one language, it would be:'),
                    name: 'languages_choice',
                    initialValue: 'Dart',
                    options: const [
                      FormBuilderChipOption(
                        value: 'Dart',
                        avatar: CircleAvatar(child: Text('D')),
                      ),
                      FormBuilderChipOption(
                        value: 'Kotlin',
                        avatar: CircleAvatar(child: Text('K')),
                      ),
                      FormBuilderChipOption(
                        value: 'Java',
                        avatar: CircleAvatar(child: Text('J')),
                      ),
                      FormBuilderChipOption(
                        value: 'Swift',
                        avatar: CircleAvatar(child: Text('S')),
                      ),
                      FormBuilderChipOption(
                        value: 'Objective-C',
                        avatar: CircleAvatar(child: Text('O')),
                      ),
                    ],
                    onChanged: _onChanged,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
