

import 'package:custom_form_w/custom_form.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Custom Form Widget',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomForm(
                showValidationSnackBar: false,
                formKey: _formKey,
                onSubmit: () {
                  print('Submitted');
                },
                numberOfFields: 7,
                requiredFieldIndices: [2, 3, 4, 5],
                labelText: [
                  'Name',
                  'Email',
                  'Phone',
                  'Password',
                  'Confirm Password',
                  'Address',
                  'City',
                ],
                keyboardType: [
                  TextInputType.text,
                  TextInputType.emailAddress,
                  TextInputType.phone,
                  TextInputType.visiblePassword,
                  TextInputType.visiblePassword,
                  TextInputType.text,
                  TextInputType.text,
                ],
              ),
            ],
          ),
        ),
      ),
    );
   }
}