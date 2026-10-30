import 'package:flutter/material.dart';

class LoginFormBtn extends StatelessWidget {
  final VoidCallback action;

  const LoginFormBtn({super.key, required this.action});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 35, right: 35),
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 61, 74, 66),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
            side: BorderSide.none,
          ),
        ),
        onPressed: action,
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Masuk Sekarang ',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontFamily: "Jakarta",
                  fontWeight: FontWeight(500),
                ),
              ),
              WidgetSpan(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: Icon(
                    Icons.subdirectory_arrow_right_outlined,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
