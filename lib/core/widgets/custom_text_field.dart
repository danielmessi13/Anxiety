
import 'package:flutter/material.dart';
import 'package:flutter_anxiety/core/font_size/font_size.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key key,
    @required this.controller,
    @required this.label,
    @required this.error,
    @required this.focus,
    @required this.nextFocus,
    @required this.type,
    this.last = false,
    this.obscure = false,
    this.camelCase = false,
  }) : super(key: key);

  final TextEditingController controller;
  final String label;
  final String error;
  final bool camelCase;
  final bool obscure;
  final FocusNode focus;
  final FocusNode nextFocus;
  final TextInputType type;
  final bool last;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        obscureText: obscure,
        keyboardType: type,
        focusNode: focus,
        textCapitalization:
            camelCase ? TextCapitalization.words : TextCapitalization.none,
        textInputAction: last ? TextInputAction.done : TextInputAction.next,
        onFieldSubmitted: (value) {
          FocusScope.of(context).requestFocus(nextFocus);
        },
        controller: controller,
        decoration: InputDecoration(
          errorText: error,
          errorStyle: TextStyle(
            color: Colors.red[800],
            fontSize: fontSize(context) * 0.8,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red[800],
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          labelText: label,
          labelStyle: TextStyle(
            color: Colors.black,
            fontSize: fontSize(context),
          ),
        ),
      ),
    );
  }
}
