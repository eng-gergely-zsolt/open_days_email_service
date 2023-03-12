import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:open_days_email_service/models/base_response.dart';

import './email_verification_controller.dart';

class EmailVerification extends ConsumerWidget {
  final String emailVerificationToken;

  const EmailVerification({super.key, required this.emailVerificationToken});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appWidth = MediaQuery.of(context).size.width;
    final appHeight = MediaQuery.of(context).size.height;

    final controller = ref.read(emailVerificationControllerProvider);

    controller.setEmailVerificationToken(emailVerificationToken);
    controller.verifyEmail();

    final emailVerificationProvider = ref.watch(controller.getEmailVerificationProvider());

    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: Center(
        child: emailVerificationProvider.when(
          error: (error, stackTrace) => Center(
            child: Text(error.toString()),
          ),
          loading: () => LoadingAnimationWidget.halfTriangleDot(
            size: appHeight * 0.1,
            color: const Color.fromRGBO(1, 30, 65, 1),
          ),
          data: (emailVerification) {
            return Center(
              child: SingleChildScrollView(
                child: Container(
                    width: appWidth * 0.3,
                    constraints: const BoxConstraints(minWidth: 450, minHeight: 400),
                    child: getCard(appHeight, emailVerification)),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget getCard(double appHeight, BaseResponse emailVerification) {
    return Card(
      elevation: 5,
      shadowColor: const Color.fromRGBO(1, 30, 65, 1),
      child: Expanded(
        child: emailVerification.isOperationSuccessful
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: appHeight * 0.05),
                  const Icon(
                    Icons.check_circle_outline,
                    size: 150,
                    color: Colors.green,
                  ),
                  SizedBox(height: appHeight * 0.05),
                  const Text(
                    'Your email has been confirmed successfully.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: appHeight * 0.05),
                  const Icon(
                    Icons.cancel_outlined,
                    size: 150,
                    color: Colors.red,
                  ),
                  SizedBox(height: appHeight * 0.05),
                  const Text(
                    'We couldn\'t confirm your email.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
