import 'package:flutter/material.dart';

class EmptyInput extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditingController;
  final EdgeInsetsGeometry padding;
  final TextStyle? hintTextStyle;
  final bool obscureText;
  final void Function(String)? onChanged;
  final TextStyle? textStyle;

  const EmptyInput({
    required this.hintText,
    required this.textEditingController,
    this.padding = EdgeInsets.zero,
    this.hintTextStyle,
    this.obscureText = false,
    this.onChanged,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (e) => {
        onChanged?.call(e),
      },
      style: textStyle,
      controller: textEditingController,
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: padding,
        hintText: hintText,
        hintStyle: hintTextStyle,
        enabledBorder: _emptyBorder(),
        border: _emptyBorder(),
        errorBorder: _emptyBorder(),
        focusedBorder: _emptyBorder(),
      ),
    );
  }

  UnderlineInputBorder _emptyBorder() {
    return const UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    );
  }
}
