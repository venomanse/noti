import 'package:async_redux/async_redux.dart';

import '../../app_state.dart';
import '../models/registration_state.dart';
import '../registration_selectors.dart';

class RegistrationAction extends ReduxAction<AppState> {
  @override
  void before() => dispatchSync(WaitAction.add(RegistrationWaiting.wait));

  @override
  void after() => dispatchSync(WaitAction.remove(RegistrationWaiting.wait));

  @override
  Future<AppState?> reduce() async {
    final email = selectRegistrationEmail(state)!;
    final password = selectRegistrationPassword(state)!;

    await _signUpRequest(email: email, password: password);

    return state.copyWith(registration: const RegistrationState());
  }
}

Future<void> _signUpRequest({
  required String email,
  required String password,
}) async {
  await Future<dynamic>.delayed(const Duration(seconds: 2));

  throw const UserException('Not implemented yet.');
}
