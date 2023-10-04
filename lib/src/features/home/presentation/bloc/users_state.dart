part of 'users_bloc.dart';

abstract class FetchUserState extends Equatable {
  const FetchUserState();

  @override
  List<Object> get props => [];
}

class UserInitialState extends FetchUserState {}

class FetchAllUserLoading extends FetchUserState {}

class FetchAllUserSuccess extends FetchUserState {
  final List<User> users;

  @override
  List<Object> get props => [users];
  const FetchAllUserSuccess({required this.users});
}

class FetchAllUserError extends FetchUserState {
  final Failure error;
  @override
  List<Object> get props => [error];
  const FetchAllUserError({required this.error});
}
