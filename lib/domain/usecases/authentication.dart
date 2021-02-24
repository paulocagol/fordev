import 'package:meta/meta.dart';

import '../entities/entities.dart';

abstract class Authetication {
  Future<AccountEntity> auth(AuthenticationParams params);
}

class AuthenticationParams {
  final String email;
  final String secret;

  AuthenticationParams({
    @required this.email,
    @required this.secret,
  });

  Map toJson() => {'email': this.email, 'password': this.secret};
}
