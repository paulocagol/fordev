import 'package:fordev/data/http/http.dart';
import 'package:fordev/domain/entities/account_entity.dart';

class RemoteAccountModel {
  final String acessToken;

  RemoteAccountModel(this.acessToken);

  factory RemoteAccountModel.fromJson(Map json) {
    if (!json.containsKey('accessToken')) throw HttpError.invalidData;

    return RemoteAccountModel(json['accessToken']);
  }

  AccountEntity toEntity() => AccountEntity(acessToken);
}
