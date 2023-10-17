part of 'users_bloc.dart';

@freezed
class FetchUserState with _$FetchUserState {
  const factory FetchUserState.fetchUsersloading() = _FetchAllUserLoading;
  const factory FetchUserState.fetchUsers({required List<User> users}) =
      _FetchAllUserSuccess;
  const factory FetchUserState.fetchUsersError(
      {required NetworkExceptions error}) = _FetchAllUserError;
  const factory FetchUserState.sendLocation() = _SendUserLocationSuccess;
  const factory FetchUserState.sendLocationError() = _SendUserLocationError;
}
