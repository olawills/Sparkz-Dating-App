part of 'gps_bloc.dart';

@freezed
class GpsState with _$GpsState {
  const factory GpsState({
    required bool isGpsEnabled,
    required bool isGpsPermissionGranted,
  }) = GpsInitialState;
}
