import 'package:mudeo/redux/auth/auth_actions.dart';
import 'package:mudeo/redux/auth/auth_state.dart';
import 'package:redux/redux.dart';

Reducer<AuthState> authReducer = combineReducers([
  TypedReducer<AuthState, UserLoginLoaded>(userLoginLoadedReducer),
  TypedReducer<AuthState, UserLoginRequest>(userLoginRequestReducer),
  TypedReducer<AuthState, OAuthLoginRequest>(oauthLoginRequestReducer),
  TypedReducer<AuthState, UserLoginSuccess>(userLoginSuccessReducer),
  TypedReducer<AuthState, UserLoginFailure>(userLoginFailureReducer),
  TypedReducer<AuthState, ClearAuthError>(clearAuthErrorReducer),
]);

AuthState clearAuthErrorReducer(AuthState authState, ClearAuthError action) {
  return authState.rebuild((b) => b..error = null);
}

AuthState userLoginLoadedReducer(AuthState authState, UserLoginLoaded action) {
  return authState.rebuild((b) => b..isInitialized = true);
}

AuthState userLoginRequestReducer(
    AuthState authState, UserLoginRequest action) {
  return authState.rebuild((b) => b..error = null);
}

AuthState oauthLoginRequestReducer(
    AuthState authState, OAuthLoginRequest action) {
  return authState.rebuild((b) => b..error = null);
}

AuthState userLoginSuccessReducer(
    AuthState authState, UserLoginSuccess action) {
  return authState.rebuild((b) => b
    ..artist.replace(action.artist)
    ..error = null
    ..isAuthenticated = true
    ..wasAuthenticated = true);
}

AuthState userLoginFailureReducer(
    AuthState authState, UserLoginFailure action) {
  return authState.rebuild((b) => b..error = action.error);
}
