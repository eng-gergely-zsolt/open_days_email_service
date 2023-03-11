import 'package:flutter/material.dart';

class PasswordReset extends StatelessWidget {
  final String passwordResetToken;

  const PasswordReset({super.key, required this.passwordResetToken});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Email verification: $passwordResetToken'),
    );
  }
}
