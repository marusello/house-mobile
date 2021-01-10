import 'package:flutter/material.dart';
import 'package:house_mobile/components/text_field_container.dart';

class RoudedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoudedPasswordField({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
      obscureText: true,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: "senha",
        icon: Icon(
          Icons.lock,
        ),
        suffixIcon: Icon(Icons.visibility),
        border: InputBorder.none,
      ),
    ));
  }
}
