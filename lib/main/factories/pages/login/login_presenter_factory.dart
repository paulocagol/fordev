import 'package:fordev/main/factories/pages/login/login_validation_factory.dart';
import 'package:fordev/main/factories/usecases/authentication_factory.dart';
import 'package:fordev/main/factories/usecases/save_current_account_factory.dart';
import 'package:fordev/presentation/presenters/presenters.dart';
import 'package:fordev/ui/pages/login/login_presenter.dart';

LoginPresenter makeGetxLoginPresenter() {
  return GetxLoginPresenter(
    validation: makeLoginValidation(),
    authentication: makeRemoteAuthentication(),
    saveCurrentAccount: makeLocalSaveCurrentAccount(),
  );
}
