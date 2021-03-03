import 'package:fordev/data/cache/cache.dart';
import 'package:fordev/domain/entities/entities.dart';
import 'package:fordev/domain/helpers/helpers.dart';
import 'package:fordev/domain/usecases/save_current_account.dart';
import 'package:meta/meta.dart';

class LocalSaveCurrentAccount implements SaveCurrentAccount {
  final SaveSecureCacheStorage saveSecurecacheStorage;

  LocalSaveCurrentAccount({@required this.saveSecurecacheStorage});

  Future<void> save(AccountEntity account) async {
    try {
      await saveSecurecacheStorage.saveSecure(key: 'token', value: account.token);
    } catch (e) {
      throw DomainError.unexpected;
    }
  }
}
