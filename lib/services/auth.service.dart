import 'package:boilerplate/features/auth/enums.dart';
import 'package:boilerplate/features/auth/models/user.model.dart';
import 'package:boilerplate/features/auth/storage/auth.storage.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'auth.service.g.dart';

@LazySingleton()
class AuthService = _AuthServiceBase with _$AuthService;

abstract class _AuthServiceBase with Store {
  _AuthServiceBase(this._authBox);

  final AuthBox _authBox;

  @observable
  User? user;

  @observable
  LoginState loginState = LoginState.none;

  @observable
  bool initialized = false;

  @action
  Future<void> setUser(User newUser) async {
    user = newUser;
  }

  /// > Check if the user is logged in. If they are, set the login state to
  /// logged in
  @action
  Future<void> setLoginState(LoginState state) async {
    loginState = state;
  }

  /// > Check if the user is logged in. If they are, set the login state to
  /// logged in
  @action
  Future<void> checkLoginState() async {
    final user = await _authBox.getAuth();

    if (user != null) {
      loginState = LoginState.loggedIn;
      initialized = true;
      await setUser(user.user);

      return;
    }

    initialized = true;
  }
}
