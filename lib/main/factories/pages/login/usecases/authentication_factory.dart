import 'package:flutter/material.dart';
import 'package:fordev/data/usecases/authentication/remote_authentication.dart';
import 'package:fordev/domain/usecases/authentication.dart';
import 'package:fordev/main/factories/pages/login/http/http.dart';

Authentication makeRemoteAuthentication() {
  return RemoteAuthentication(
    httpClient: makeHttpAdapter(),
    url: makeApiUrl('login'),
  );
}
