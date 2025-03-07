import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:custom_form_w/custom_form.dart';

void main() {
  test('test custom form widget', () {
    final customForm = CustomForm(
      numberOfFields: 2,
      requiredFieldIndices: [1, 2],
      labelText: ['Name', 'Email'],
    ); 
    expect(customForm.numberOfFields, 2);
    expect(customForm.requiredFieldIndices, [1, 2]);
    expect(customForm.labelText, ['Name', 'Email']);
    expect(customForm.keyboardType, [TextInputType.text, TextInputType.emailAddress]);

  });
}
