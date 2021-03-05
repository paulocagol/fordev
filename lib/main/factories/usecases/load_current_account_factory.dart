import 'package:flutter/material.dart';
import 'package:fordev/data/usecases/load_current_account/load_current_account.dart';
import 'package:fordev/domain/usecases/load_current_account.dart';
import 'package:fordev/main/factories/cache/cache.dart';

LoadCurrentAccount makeLocalLoadCurrentAccount() {
  return LocalLoadCurrentAccount(fetchSecureCacheStorage: makeLocalStorageAdapter());
}
