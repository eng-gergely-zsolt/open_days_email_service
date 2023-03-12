import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/base_response.dart';
import '../services/get_email_verification.dart';

final emailVerificationRepositoryProvider = Provider((_) => EmailVerificationRepository());

class EmailVerificationRepository {
  // Calls the email verification service.
  Future<BaseResponse> verifyEmailRepo(String emailVerificationToken) async {
    await Future.delayed(const Duration(seconds: 3));
    return await verifyEmailSvc(emailVerificationToken);
  }
}
