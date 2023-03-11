import 'package:flutter/material.dart';

class EmailVerification extends StatelessWidget {
  final String emailVerificationToken;

  const EmailVerification({super.key, required this.emailVerificationToken});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Email verification: $emailVerificationToken'),
    );
  }
}
