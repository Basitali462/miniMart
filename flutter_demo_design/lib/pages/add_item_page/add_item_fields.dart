import 'package:flutter/material.dart';

class AddItemField extends StatelessWidget {
  final TextEditingController textController;
  final String placeHolder;
  final TextInputType inputType;
  final Function validation;

  AddItemField({this.textController, this.placeHolder, this.inputType, this.validation});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: textController,
        keyboardType: inputType,
        decoration: InputDecoration(
          labelText: placeHolder,
        ),
        validator: validation,
      ),
    );
  }
}
