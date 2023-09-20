import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'internet_connection_state.dart';

class InternetConnectionCubit extends Cubit<InternetConnectionState> {
  InternetConnectionCubit() : super(CheckConnectionLoading());

  static InternetConnectionCubit get(context) => BlocProvider.of(context);

  final _connectivity = Connectivity();
  bool? hasConnection;

  Future<void> init() async {
    _connectivity.onConnectivityChanged.listen(_connectionChange);
    _checkConnection(await _connectivity.checkConnectivity());
  }

  void _connectionChange(ConnectivityResult result) {
    _checkConnection(result);
  }

  Future<bool?> _checkConnection(ConnectivityResult result) async {
    bool? previousConnection;

    if (hasConnection != null) previousConnection = hasConnection;

    if (result == ConnectivityResult.none) {
      hasConnection = false;
      if (previousConnection != hasConnection) {
        _connectionChangeController(hasConnection!);
      }
      return hasConnection;
    }
    return hasConnection;
  }

  bool showDialog = false;

  void _connectionChangeController(bool hasConnection) {
    if (hasConnection) {
      emit(InternetConnected());
    } else {
      emit(InternetDisconnected());
    }
  }
}
