import 'package:flutter/services.dart';
import 'package:oauth2/oauth2.dart';
import 'package:reso_coder_app/auth/infrastructure/credentials_storage/credentials_storage.dart';

class GithubAuthenticator {
  final CredentialsStorage _credentialsStorage;

  GithubAuthenticator(this._credentialsStorage);

  Future<Credentials?> getSignedCredentials() async {
    try {
      final storedCredentials = await _credentialsStorage.read();
      if (storedCredentials != null) {
        if (storedCredentials.canRefresh && storedCredentials.isExpired) {}
      }
      return storedCredentials;
    } on PlatformException {
      return null;
    }
  }
}
