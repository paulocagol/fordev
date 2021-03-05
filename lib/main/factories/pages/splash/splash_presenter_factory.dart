import 'package:fordev/main/factories/usecases/load_current_account_factory.dart';
import 'package:fordev/presentation/presenters/getx_splash_presenter.dart';
import 'package:fordev/ui/pages/splash/splash_presenter.dart';

SplashPresenter makeGetxSplashPresenter() {
  return GetxSplashPresenter(loadCurrentAccount: makeLocalLoadCurrentAccount());
}
