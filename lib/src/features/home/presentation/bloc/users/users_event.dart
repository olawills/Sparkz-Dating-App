part of 'users_bloc.dart';

@freezed
class FetchUserEvent with _$FetchUserEvent {
  const factory FetchUserEvent.fetchAllUsers() = _FetchAllUsersEvent;
}
