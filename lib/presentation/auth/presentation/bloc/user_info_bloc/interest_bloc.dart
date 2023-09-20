import 'package:bloc/bloc.dart';
import 'package:dating_app/app/core/network_handler/failures.dart';
import 'package:dating_app/presentation/auth/data/repository/auth_info_repository.dart';
import 'package:equatable/equatable.dart';

part 'interest_event.dart';
part 'interest_state.dart';

class InterestBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final AuthInfoRepository _authInfoRepository = AuthInfoRepository();
  InterestBloc() : super(GetUserInfoInitial()) {
    on<CreateUserProfile>((event, emit) => _createUserProfile(event, emit));
  }

  _createUserProfile(CreateUserProfile event, emit) async {
    emit(CreateUserProfileLoading());
    final response = await _authInfoRepository.userProfile(event);
    response.fold(
      (l) => emit(CreateUserProfileError(error: l)),
      (r) => emit(CreateUserProfileSuccess(message: r)),
    );
  }
}
