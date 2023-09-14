import 'package:dating_app/app/core/network_handler/failures.dart';
import 'package:equatable/equatable.dart';

import '../../../../app/core/core.dart';
import '../../../auth/data/models/user.dart';
import '../../data/repository/user_repository.dart';

part 'users_event.dart';
part 'users_state.dart';

class FetchUserBloc extends Bloc<FetchUsersEvent, FetchUserState> {
  final UserRepository _userRemoteDataSource = UserRepository();
  FetchUserBloc() : super(UserInitialState()) {
    on<FetchAllUserEvent>((event, emit) => _getAllUsers(emit));
  }

  _getAllUsers(Emitter<FetchUserState> emit) async {
    emit(FetchAllUserLoading());
    final response = await _userRemoteDataSource.getAllUsers();
    response.fold(
      (l) => FetchAllUserError(error: l),
      (r) => FetchAllUserSuccess(user: r),
    );
  }
}
