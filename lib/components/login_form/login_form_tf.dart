import 'package:flutter/material.dart';

class LoginFormTextField extends StatelessWidget {
  final TextEditingController txtController;
  final String theHint;
  final IconData icon;
  final bool obscure;

  LoginFormTextField({
    super.key,
    required this.txtController,
    required this.theHint,
    required this.icon,
    required this.obscure,
  });

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      borderRadius: BorderRadius.circular(12),
      color: Color.fromARGB(255, 255, 255, 255),
      elevation: 5.0,
      shadowColor: Color.fromARGB(255, 0, 0, 0),
      child: Container(
        height: 50,
        child: TextField(
          obscureText: obscure,
          controller: txtController,
          decoration: InputDecoration(
            prefixIcon: Icon(icon),
            filled: true,
            fillColor: Colors.white,
            hint: Text(theHint),
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
