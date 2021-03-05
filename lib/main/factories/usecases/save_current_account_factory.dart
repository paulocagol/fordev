import 'package:flutter/material.dart';
import 'package:fordev/data/usecases/save_current_account/local_save_current_account.dart';
import 'package:fordev/domain/usecases/save_current_account.dart';
import 'package:fordev/main/factories/cache/cache.dart';

SaveCurrentAccount makeLocalSaveCurrentAccount() {
  return LocalSaveCurrentAccount(saveSecurecacheStorage: makeLocalStorageAdapter());
}
