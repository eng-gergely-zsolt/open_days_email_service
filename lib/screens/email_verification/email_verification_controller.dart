import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/base_response.dart';
import '../../repositories/email_verification_repository.dart';

class EmailVerificationController {
  String _emailVerificationToken = '';

  final ProviderRef _ref;
  final EmailVerificationRepository _emailVerificationRepository;

  FutureProvider<BaseResponse>? _emailVerificationProvider;

  EmailVerificationController(this._ref, this._emailVerificationRepository);

  FutureProvider<BaseResponse> getEmailVerificationProvider() {
    return _emailVerificationProvider!;
  }

  void setEmailVerificationToken(String emailVerificationToken) {
    _emailVerificationToken = emailVerificationToken;
  }

  void verifyEmail() {
    _emailVerificationProvider ??= FutureProvider((ref) async {
      return await _emailVerificationRepository.verifyEmailRepo(_emailVerificationToken);
    });
  }
}

final emailVerificationControllerProvider = Provider((ref) {
  final emailVerificationRepository = ref.watch(emailVerificationRepositoryProvider);
  return EmailVerificationController(ref, emailVerificationRepository);
});
