import 'package:fordev/domain/usecases/usecases.dart';
import 'package:fordev/ui/pages/splash/splash_presenter.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class GetxSplashPresenter implements SplashPresenter {
  final LoadCurrentAccount loadCurrentAccount;

  var _navigateTo = RxString();

  GetxSplashPresenter({@required this.loadCurrentAccount});

  Stream<String> get navigateToStream => _navigateTo.stream;

  Future<void> checkAccount({int durationInSeconds = 2}) async {
    await Future.delayed(Duration(seconds: durationInSeconds));
    try {
      final account = await loadCurrentAccount.load();
      _navigateTo.value = !account.isNull ? '/login' : '/surveys';
    } catch (e) {
      _navigateTo.value = '/login';
    }
  }
}
