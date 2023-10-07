part of 'users_bloc.dart';

@freezed
class FetchUserState with _$FetchUserState {
  const factory FetchUserState.initial() = UserInitialState;
  const factory FetchUserState.loading() = FetchAllUserLoading;
  const factory FetchUserState.success({required List<User> users}) =
      FetchAllUserSuccess;
  const factory FetchUserState.error({required NetworkExceptions error}) =
      FetchAllUserError;
}
