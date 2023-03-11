import 'package:fluro/fluro.dart';

import '../screens/home.dart';
import '../screens/password_reset.dart';
import '../screens/email_verification.dart';

class MyFluroRouter {
  static final FluroRouter fluroRouter = FluroRouter();

  static final Handler _homeHandler = Handler(
    handlerFunc: ((context, parameters) => const Home()),
  );

  static final Handler _passwordResetHandler = Handler(
      handlerFunc: ((context, parameters) => PasswordReset(
            passwordResetToken: parameters['token']![0],
          )));

  static final Handler _emailVerificationHandler = Handler(
      handlerFunc: ((context, parameters) => EmailVerification(
            emailVerificationToken: parameters['token']![0],
          )));

  static void setupRouter() {
    fluroRouter.define(
      '/',
      handler: _homeHandler,
    );

    fluroRouter.define(
      '/password-reset/:token',
      handler: _passwordResetHandler,
      transitionType: TransitionType.fadeIn,
    );

    fluroRouter.define(
      '/email-verification/:token',
      handler: _emailVerificationHandler,
      transitionType: TransitionType.fadeIn,
    );
  }
}
