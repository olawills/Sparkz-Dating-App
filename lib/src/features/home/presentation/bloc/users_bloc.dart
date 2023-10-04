import 'package:dating_app/app/core/network/failures.dart';
import 'package:equatable/equatable.dart';

import '../../../../../app/core/core.dart';
import '../../../../../app/core/logger/app_logger.dart';
import '../../../../auth/data/models/user.dart';
import '../../data/repository/user_repository.dart';

part 'users_event.dart';
part 'users_state.dart';

class FetchUserBloc extends Bloc<FetchUsersEvent, FetchUserState> {
  final UserRepository _userRemoteDataSource = UserRepository();
  FetchUserBloc() : super(UserInitialState()) {
    on<FetchAllUserEvent>((event, emit) => _getAllUsers(event, emit));
  }

  _getAllUsers(FetchAllUserEvent event, emit) async {
    emit(FetchAllUserLoading());
    Log.debug("Loading");
    final response = await _userRemoteDataSource.getAllUsers();
    response.fold(
      (l) {
        FetchAllUserError(error: l);
        emit(FetchAllUserError(error: l));
      },
      (r) {
        FetchAllUserSuccess(users: r);
        emit(FetchAllUserSuccess(users: r));
      },
    );
  }
}
