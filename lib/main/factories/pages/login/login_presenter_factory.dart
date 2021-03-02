import 'package:fordev/main/factories/pages/login/login_validation_factory.dart';
import 'package:fordev/main/factories/pages/login/usecases/usecases.dart';
import 'package:fordev/presentation/presenters/presenters.dart';
import 'package:fordev/ui/pages/login/login_presenter.dart';

LoginPresenter makeLoginPresenter() {
  return StreamLoginPresenter(
    validation: makeLoginValidation(),
    authentication: makeRemoteAuthentication(),
  );
}
