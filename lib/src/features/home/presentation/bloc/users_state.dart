part of 'users_bloc.dart';

abstract class FetchUserState extends Equatable {
  const FetchUserState();

  @override
  List<Object> get props => [];
}

class UserInitialState extends FetchUserState {}

class FetchAllUserLoading extends FetchUserState {}

class FetchAllUserSuccess extends FetchUserState {
  final List<User> user;

  const FetchAllUserSuccess({required this.user});
}

class FetchAllUserError extends FetchUserState {
  final Failure error;
  const FetchAllUserError({required this.error});
}
