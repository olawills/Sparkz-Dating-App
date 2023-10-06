// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FetchUserEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAllUsers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchAllUsers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAllUsers,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchAllUsersEvent value) fetchAllUsers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchAllUsersEvent value)? fetchAllUsers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchAllUsersEvent value)? fetchAllUsers,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchUserEventCopyWith<$Res> {
  factory $FetchUserEventCopyWith(
          FetchUserEvent value, $Res Function(FetchUserEvent) then) =
      _$FetchUserEventCopyWithImpl<$Res, FetchUserEvent>;
}

/// @nodoc
class _$FetchUserEventCopyWithImpl<$Res, $Val extends FetchUserEvent>
    implements $FetchUserEventCopyWith<$Res> {
  _$FetchUserEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchAllUsersEventImplCopyWith<$Res> {
  factory _$$FetchAllUsersEventImplCopyWith(_$FetchAllUsersEventImpl value,
          $Res Function(_$FetchAllUsersEventImpl) then) =
      __$$FetchAllUsersEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchAllUsersEventImplCopyWithImpl<$Res>
    extends _$FetchUserEventCopyWithImpl<$Res, _$FetchAllUsersEventImpl>
    implements _$$FetchAllUsersEventImplCopyWith<$Res> {
  __$$FetchAllUsersEventImplCopyWithImpl(_$FetchAllUsersEventImpl _value,
      $Res Function(_$FetchAllUsersEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchAllUsersEventImpl
    with DiagnosticableTreeMixin
    implements _FetchAllUsersEvent {
  const _$FetchAllUsersEventImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FetchUserEvent.fetchAllUsers()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'FetchUserEvent.fetchAllUsers'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchAllUsersEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAllUsers,
  }) {
    return fetchAllUsers();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchAllUsers,
  }) {
    return fetchAllUsers?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAllUsers,
    required TResult orElse(),
  }) {
    if (fetchAllUsers != null) {
      return fetchAllUsers();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchAllUsersEvent value) fetchAllUsers,
  }) {
    return fetchAllUsers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchAllUsersEvent value)? fetchAllUsers,
  }) {
    return fetchAllUsers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchAllUsersEvent value)? fetchAllUsers,
    required TResult orElse(),
  }) {
    if (fetchAllUsers != null) {
      return fetchAllUsers(this);
    }
    return orElse();
  }
}

abstract class _FetchAllUsersEvent implements FetchUserEvent {
  const factory _FetchAllUsersEvent() = _$FetchAllUsersEventImpl;
}

/// @nodoc
mixin _$FetchUserState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<User> users) success,
    required TResult Function(NetworkExceptions error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<User> users)? success,
    TResult? Function(NetworkExceptions error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<User> users)? success,
    TResult Function(NetworkExceptions error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserInitialState value) initial,
    required TResult Function(FetchAllUserLoading value) loading,
    required TResult Function(FetchAllUserSuccess value) success,
    required TResult Function(FetchAllUserError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserInitialState value)? initial,
    TResult? Function(FetchAllUserLoading value)? loading,
    TResult? Function(FetchAllUserSuccess value)? success,
    TResult? Function(FetchAllUserError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserInitialState value)? initial,
    TResult Function(FetchAllUserLoading value)? loading,
    TResult Function(FetchAllUserSuccess value)? success,
    TResult Function(FetchAllUserError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchUserStateCopyWith<$Res> {
  factory $FetchUserStateCopyWith(
          FetchUserState value, $Res Function(FetchUserState) then) =
      _$FetchUserStateCopyWithImpl<$Res, FetchUserState>;
}

/// @nodoc
class _$FetchUserStateCopyWithImpl<$Res, $Val extends FetchUserState>
    implements $FetchUserStateCopyWith<$Res> {
  _$FetchUserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UserInitialStateImplCopyWith<$Res> {
  factory _$$UserInitialStateImplCopyWith(_$UserInitialStateImpl value,
          $Res Function(_$UserInitialStateImpl) then) =
      __$$UserInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserInitialStateImplCopyWithImpl<$Res>
    extends _$FetchUserStateCopyWithImpl<$Res, _$UserInitialStateImpl>
    implements _$$UserInitialStateImplCopyWith<$Res> {
  __$$UserInitialStateImplCopyWithImpl(_$UserInitialStateImpl _value,
      $Res Function(_$UserInitialStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UserInitialStateImpl
    with DiagnosticableTreeMixin
    implements UserInitialState {
  const _$UserInitialStateImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FetchUserState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'FetchUserState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserInitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<User> users) success,
    required TResult Function(NetworkExceptions error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<User> users)? success,
    TResult? Function(NetworkExceptions error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<User> users)? success,
    TResult Function(NetworkExceptions error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserInitialState value) initial,
    required TResult Function(FetchAllUserLoading value) loading,
    required TResult Function(FetchAllUserSuccess value) success,
    required TResult Function(FetchAllUserError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserInitialState value)? initial,
    TResult? Function(FetchAllUserLoading value)? loading,
    TResult? Function(FetchAllUserSuccess value)? success,
    TResult? Function(FetchAllUserError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserInitialState value)? initial,
    TResult Function(FetchAllUserLoading value)? loading,
    TResult Function(FetchAllUserSuccess value)? success,
    TResult Function(FetchAllUserError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class UserInitialState implements FetchUserState {
  const factory UserInitialState() = _$UserInitialStateImpl;
}

/// @nodoc
abstract class _$$FetchAllUserLoadingImplCopyWith<$Res> {
  factory _$$FetchAllUserLoadingImplCopyWith(_$FetchAllUserLoadingImpl value,
          $Res Function(_$FetchAllUserLoadingImpl) then) =
      __$$FetchAllUserLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchAllUserLoadingImplCopyWithImpl<$Res>
    extends _$FetchUserStateCopyWithImpl<$Res, _$FetchAllUserLoadingImpl>
    implements _$$FetchAllUserLoadingImplCopyWith<$Res> {
  __$$FetchAllUserLoadingImplCopyWithImpl(_$FetchAllUserLoadingImpl _value,
      $Res Function(_$FetchAllUserLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchAllUserLoadingImpl
    with DiagnosticableTreeMixin
    implements FetchAllUserLoading {
  const _$FetchAllUserLoadingImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FetchUserState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'FetchUserState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchAllUserLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<User> users) success,
    required TResult Function(NetworkExceptions error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<User> users)? success,
    TResult? Function(NetworkExceptions error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<User> users)? success,
    TResult Function(NetworkExceptions error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserInitialState value) initial,
    required TResult Function(FetchAllUserLoading value) loading,
    required TResult Function(FetchAllUserSuccess value) success,
    required TResult Function(FetchAllUserError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserInitialState value)? initial,
    TResult? Function(FetchAllUserLoading value)? loading,
    TResult? Function(FetchAllUserSuccess value)? success,
    TResult? Function(FetchAllUserError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserInitialState value)? initial,
    TResult Function(FetchAllUserLoading value)? loading,
    TResult Function(FetchAllUserSuccess value)? success,
    TResult Function(FetchAllUserError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class FetchAllUserLoading implements FetchUserState {
  const factory FetchAllUserLoading() = _$FetchAllUserLoadingImpl;
}

/// @nodoc
abstract class _$$FetchAllUserSuccessImplCopyWith<$Res> {
  factory _$$FetchAllUserSuccessImplCopyWith(_$FetchAllUserSuccessImpl value,
          $Res Function(_$FetchAllUserSuccessImpl) then) =
      __$$FetchAllUserSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<User> users});
}

/// @nodoc
class __$$FetchAllUserSuccessImplCopyWithImpl<$Res>
    extends _$FetchUserStateCopyWithImpl<$Res, _$FetchAllUserSuccessImpl>
    implements _$$FetchAllUserSuccessImplCopyWith<$Res> {
  __$$FetchAllUserSuccessImplCopyWithImpl(_$FetchAllUserSuccessImpl _value,
      $Res Function(_$FetchAllUserSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = null,
  }) {
    return _then(_$FetchAllUserSuccessImpl(
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>,
    ));
  }
}

/// @nodoc

class _$FetchAllUserSuccessImpl
    with DiagnosticableTreeMixin
    implements FetchAllUserSuccess {
  const _$FetchAllUserSuccessImpl({required final List<User> users})
      : _users = users;

  final List<User> _users;
  @override
  List<User> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FetchUserState.success(users: $users)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FetchUserState.success'))
      ..add(DiagnosticsProperty('users', users));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchAllUserSuccessImpl &&
            const DeepCollectionEquality().equals(other._users, _users));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_users));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchAllUserSuccessImplCopyWith<_$FetchAllUserSuccessImpl> get copyWith =>
      __$$FetchAllUserSuccessImplCopyWithImpl<_$FetchAllUserSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<User> users) success,
    required TResult Function(NetworkExceptions error) error,
  }) {
    return success(users);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<User> users)? success,
    TResult? Function(NetworkExceptions error)? error,
  }) {
    return success?.call(users);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<User> users)? success,
    TResult Function(NetworkExceptions error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(users);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserInitialState value) initial,
    required TResult Function(FetchAllUserLoading value) loading,
    required TResult Function(FetchAllUserSuccess value) success,
    required TResult Function(FetchAllUserError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserInitialState value)? initial,
    TResult? Function(FetchAllUserLoading value)? loading,
    TResult? Function(FetchAllUserSuccess value)? success,
    TResult? Function(FetchAllUserError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserInitialState value)? initial,
    TResult Function(FetchAllUserLoading value)? loading,
    TResult Function(FetchAllUserSuccess value)? success,
    TResult Function(FetchAllUserError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class FetchAllUserSuccess implements FetchUserState {
  const factory FetchAllUserSuccess({required final List<User> users}) =
      _$FetchAllUserSuccessImpl;

  List<User> get users;
  @JsonKey(ignore: true)
  _$$FetchAllUserSuccessImplCopyWith<_$FetchAllUserSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchAllUserErrorImplCopyWith<$Res> {
  factory _$$FetchAllUserErrorImplCopyWith(_$FetchAllUserErrorImpl value,
          $Res Function(_$FetchAllUserErrorImpl) then) =
      __$$FetchAllUserErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({NetworkExceptions error});

  $NetworkExceptionsCopyWith<$Res> get error;
}

/// @nodoc
class __$$FetchAllUserErrorImplCopyWithImpl<$Res>
    extends _$FetchUserStateCopyWithImpl<$Res, _$FetchAllUserErrorImpl>
    implements _$$FetchAllUserErrorImplCopyWith<$Res> {
  __$$FetchAllUserErrorImplCopyWithImpl(_$FetchAllUserErrorImpl _value,
      $Res Function(_$FetchAllUserErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$FetchAllUserErrorImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as NetworkExceptions,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $NetworkExceptionsCopyWith<$Res> get error {
    return $NetworkExceptionsCopyWith<$Res>(_value.error, (value) {
      return _then(_value.copyWith(error: value));
    });
  }
}

/// @nodoc

class _$FetchAllUserErrorImpl
    with DiagnosticableTreeMixin
    implements FetchAllUserError {
  const _$FetchAllUserErrorImpl({required this.error});

  @override
  final NetworkExceptions error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FetchUserState.error(error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FetchUserState.error'))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchAllUserErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchAllUserErrorImplCopyWith<_$FetchAllUserErrorImpl> get copyWith =>
      __$$FetchAllUserErrorImplCopyWithImpl<_$FetchAllUserErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<User> users) success,
    required TResult Function(NetworkExceptions error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<User> users)? success,
    TResult? Function(NetworkExceptions error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<User> users)? success,
    TResult Function(NetworkExceptions error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserInitialState value) initial,
    required TResult Function(FetchAllUserLoading value) loading,
    required TResult Function(FetchAllUserSuccess value) success,
    required TResult Function(FetchAllUserError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserInitialState value)? initial,
    TResult? Function(FetchAllUserLoading value)? loading,
    TResult? Function(FetchAllUserSuccess value)? success,
    TResult? Function(FetchAllUserError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserInitialState value)? initial,
    TResult Function(FetchAllUserLoading value)? loading,
    TResult Function(FetchAllUserSuccess value)? success,
    TResult Function(FetchAllUserError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class FetchAllUserError implements FetchUserState {
  const factory FetchAllUserError({required final NetworkExceptions error}) =
      _$FetchAllUserErrorImpl;

  NetworkExceptions get error;
  @JsonKey(ignore: true)
  _$$FetchAllUserErrorImplCopyWith<_$FetchAllUserErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
