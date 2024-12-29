import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class CustomFormW extends StatefulWidget {
  const CustomFormW({
    super.key,
    required this.numberOfFields,
    required this.requiredFieldIndices,
    this.withoutBorder = false,
    required this.labelText,
    this.textDirection = TextDirection.ltr,
    this.fillColor = Colors.white,
    this.controllers,
    this.formKey,
    this.buttonText = 'Submit',
    this.buttonColor = Colors.blue,
    this.buttonTextStyle = const TextStyle(color: Colors.white),
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardType,
    this.labelStyle,
    this.requiredColor,
    this.labelColor,
    this.radius,
    this.onSubmit,
    this.showButton = true,
    this.spacing,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.hintStyle,
    this.hintText,
    this.showValidationSnackBar = true,
    this.validationSnackBarText,
    this.phoneRegex = r'^\d{10}$',
    this.phoneRegexError = 'Please enter a valid 10-digit phone number',
    this.passwordLength = 8,
    this.horizontalPadding,
    this.verticalPadding,
  });

  final int numberOfFields;
  final List<int> requiredFieldIndices;
  final bool? withoutBorder;
  final List<String> labelText;
  final TextDirection? textDirection;
  final Color? fillColor;
  final List<TextEditingController>? controllers;
  final GlobalKey<FormState>? formKey;
  final String? buttonText;
  final Color? buttonColor;
  final TextStyle? buttonTextStyle;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final List<TextInputType>? keyboardType;
  final TextStyle? labelStyle;
  final Color? requiredColor;
  final Color? labelColor;
  final double? radius;
  final Function()? onSubmit;
  final bool showButton;
  final double? spacing;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final TextStyle? hintStyle;
  final List<String>? hintText;
  final bool? showValidationSnackBar;
  final String? validationSnackBarText;
  final String? phoneRegex;
  final String? phoneRegexError;
  final int? passwordLength;
  final double? horizontalPadding, verticalPadding;

  @override
  State<CustomFormW> createState() => _CustomFormWState();
}

class _CustomFormWState extends State<CustomFormW> {
  List<bool> _passwordVisible = [];
  String? _password;

  @override
  void initState() {
    super.initState();
    _passwordVisible = List.generate(widget.numberOfFields, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: widget.horizontalPadding ?? 16,
            vertical: widget.verticalPadding ?? 0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            spacing: widget.spacing ?? 10,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Column(
                    spacing: widget.spacing ?? 10,
                    children: List.generate(
                      widget.numberOfFields,
                      (index) => Directionality(
                        textDirection:
                            widget.textDirection ?? TextDirection.ltr,
                        child: widget.keyboardType?[index] ==
                                TextInputType.phone
                            ? IntlPhoneField(
                                controller: widget.controllers?[index],
                                decoration: InputDecoration(
                                  labelText: widget.withoutBorder == true
                                      ? null
                                      : '${widget.labelText[index]}${widget.requiredFieldIndices.contains(index + 1) ? ' *' : ''}',
                                  labelStyle: widget.labelStyle ??
                                      TextStyle(
                                          color: widget.requiredFieldIndices
                                                  .contains(index + 1)
                                              ? widget.requiredColor ??
                                                  Colors.red
                                              : widget.labelColor ??
                                                  Colors.black),
                                  border: widget.withoutBorder == true
                                      ? InputBorder.none
                                      : OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              widget.radius ?? 10),
                                        ),
                                  enabledBorder: widget.withoutBorder == true
                                      ? InputBorder.none
                                      : OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              widget.radius ?? 10),
                                          borderSide: BorderSide(
                                              color: widget
                                                      .enabledBorderColor ??
                                                  Colors.grey
                                                      .withValues(alpha: .5)),
                                        ),
                                  focusedBorder: widget.withoutBorder == true
                                      ? InputBorder.none
                                      : OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              widget.radius ?? 10),
                                          borderSide: BorderSide(
                                              color: widget
                                                      .focusedBorderColor ??
                                                  Colors.grey
                                                      .withValues(alpha: .5)),
                                        ),
                                ),
                                initialCountryCode: 'EG',
                                onChanged: (phone) {
                                  if (widget.controllers != null) {
                                    widget.controllers![index].text =
                                        phone.completeNumber;
                                  }
                                },
                              )
                            : TextFormField(
                                keyboardType: widget.keyboardType?[index],
                                controller: widget.controllers?[index],
                                textDirection: widget.textDirection,
                                obscureText: _passwordVisible[index],
                                decoration: InputDecoration(
                                  labelText: widget.withoutBorder == true
                                      ? null
                                      : '${widget.labelText[index]}${widget.requiredFieldIndices.contains(index + 1) ? ' *' : ''}',
                                  labelStyle: widget.labelStyle ??
                                      TextStyle(
                                          color: widget.requiredFieldIndices
                                                  .contains(index + 1)
                                              ? widget.requiredColor ??
                                                  Colors.red
                                              : widget.labelColor ??
                                                  Colors.black),
                                  hintText: widget.hintText?[index] ??
                                      'Enter ${widget.labelText[index]}',
                                  hintStyle: widget.hintStyle ??
                                      TextStyle(
                                          color: Colors.grey
                                              .withValues(alpha: .5)),
                                  hintTextDirection: widget.textDirection,
                                  filled: true,
                                  fillColor: widget.fillColor,
                                  suffixIcon: widget.keyboardType?[index] ==
                                          TextInputType.visiblePassword
                                      ? IconButton(
                                          icon: Icon(_passwordVisible[index]
                                              ? Icons.visibility_off
                                              : Icons.visibility),
                                          onPressed: () {
                                            setState(() {
                                              _passwordVisible[index] =
                                                  !_passwordVisible[index];
                                            });
                                          },
                                        )
                                      : widget.suffixIcon,
                                  prefixIcon: widget.prefixIcon,
                                  border: widget.withoutBorder == true
                                      ? InputBorder.none
                                      : OutlineInputBorder(),
                                  enabledBorder: widget.withoutBorder == true
                                      ? InputBorder.none
                                      : OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              widget.radius ?? 10),
                                          borderSide: BorderSide(
                                              color: widget
                                                      .enabledBorderColor ??
                                                  Colors.grey
                                                      .withValues(alpha: .5)),
                                        ),
                                  focusedBorder: widget.withoutBorder == true
                                      ? InputBorder.none
                                      : OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              widget.radius ?? 10),
                                          borderSide: BorderSide(
                                              color: widget
                                                      .focusedBorderColor ??
                                                  Colors.grey
                                                      .withValues(alpha: .5)),
                                        ),
                                ),
                                validator: (value) {
                                  if (widget.requiredFieldIndices
                                          .contains(index + 1) &&
                                      (value == null || value.isEmpty)) {
                                    return 'Please enter ${widget.labelText[index]}';
                                  }
                                  if (widget.numberOfFields <= 0) {
                                    return 'Number of Fields must be Greater than 0';
                                  }

                                  // Email validation
                                  if (widget.keyboardType?[index] ==
                                      TextInputType.emailAddress) {
                                    if (!RegExp(
                                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                        .hasMatch(value ?? '')) {
                                      return 'Please Enter a valid Email Address';
                                    }
                                  }

                                  // Password validation
                                  if (widget.keyboardType?[index] ==
                                      TextInputType.visiblePassword) {
                                    if ((value?.length ?? 0) <
                                        (widget.passwordLength ?? 8)) {
                                      return 'Password must be at least ${widget.passwordLength ?? 8} Characters';
                                    }
                                    if (!RegExp(r'(?=.*?[A-Z])')
                                        .hasMatch(value ?? '')) {
                                      return 'Password must Contain at least one Uppercase Letter';
                                    }
                                    if (!RegExp(r'(?=.*?[a-z])')
                                        .hasMatch(value ?? '')) {
                                      return 'Password must Contain at least one Lowercase Letter';
                                    }
                                    if (!RegExp(r'(?=.*?[0-9])')
                                        .hasMatch(value ?? '')) {
                                      return 'Password must Contain at Least one Number';
                                    }
                                    if (!RegExp(r'(?=.*?[!@#\$&*~])')
                                        .hasMatch(value ?? '')) {
                                      return 'Password must Contain at least one Special Character';
                                    }

                                    // Store password for confirmation matching
                                    if (widget.labelText[index]
                                            .toLowerCase()
                                            .contains('password') &&
                                        !widget.labelText[index]
                                            .toLowerCase()
                                            .contains('confirm')) {
                                      _password = value;
                                    }

                                    // Confirm password validation
                                    if (widget.labelText[index]
                                        .toLowerCase()
                                        .contains('confirm')) {
                                      if (value != _password) {
                                        return 'Passwords do not match';
                                      }
                                    }
                                  }

                                  return null;
                                },
                              ),
                      ),
                    ),
                  ),
                ),
              ),
              widget.showButton == true
                  ? MaterialButton(
                      minWidth: .9 * MediaQuery.sizeOf(context).width,
                      height: 45,
                      color: widget.buttonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      onPressed: () {
                        if (widget.formKey != null &&
                            widget.formKey!.currentState!.validate()) {
                          widget.showValidationSnackBar == true
                              ? ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: Colors.green,
                                      margin:
                                          EdgeInsets.only(
                                              bottom:
                                                  MediaQuery.of(context)
                                                          .size
                                                          .height -
                                                      90),
                                      content: Text(
                                          widget.validationSnackBarText ??
                                              'Form is valid')))
                              : SizedBox();

                          if (widget.onSubmit != null) {
                            widget.onSubmit!();
                          }
                        } else {
                          widget.showValidationSnackBar == true
                              ? ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: Colors.red,
                                      margin:
                                          EdgeInsets.only(
                                              bottom:
                                                  MediaQuery.of(context)
                                                          .size
                                                          .height -
                                                      90),
                                      content: Text(
                                          'Please fill in all required fields')))
                              : SizedBox();
                        }
                      },
                      child: Text(widget.buttonText ?? 'Submit',
                          style: widget.buttonTextStyle),
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
