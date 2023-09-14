part of 'internet_connection_cubit.dart';

abstract class InternetConnectionState {}

class CheckConnectionLoading extends InternetConnectionState {}

class InternetConnected extends InternetConnectionState {}

class InternetDisconnected extends InternetConnectionState {}

class UnknownInternetError extends InternetConnectionState {}
