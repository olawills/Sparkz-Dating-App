part of 'users_bloc.dart';

abstract class FetchUsersEvent extends Equatable {
  const FetchUsersEvent();

  @override
  List<Object> get props => [];
}

class FetchAllUserEvent extends FetchUsersEvent {}
