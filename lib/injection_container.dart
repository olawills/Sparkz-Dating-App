import 'package:dating_app/presentation/auth/data/datasource/auth_remote_data_source.dart';
import 'package:dating_app/presentation/features/data/datasources/user_remote_data_source.dart';
import 'package:dating_app/presentation/features/presentation/bloc/users_bloc.dart';
import 'package:dating_app/presentation/features/presentation/cubit/bottom_navbar/bottom_navigation_cubit.dart';
import 'package:dating_app/presentation/features/presentation/cubit/internet_connection/internet_connection_cubit.dart';
import 'package:dating_app/presentation/startup/presentation/bloc/onboarding_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'app/core/network_handler/dio_client.dart';
import 'presentation/auth/presentation/bloc/auth_bloc.dart';

GetIt di = GetIt.instance;

class ServiceLocator {
  ServiceLocator._();

  static void init() {
    // Blocs
    di.registerFactory<AuthBloc>(() => AuthBloc());
    di.registerFactory<OnboardingBloc>(() => OnboardingBloc());
    di.registerFactory<FetchUserBloc>(() => FetchUserBloc());

    // Cubit
    di.registerFactory<BottomNavigationCubit>(() => BottomNavigationCubit());
    di.registerFactory<InternetConnectionCubit>(
        () => InternetConnectionCubit());

    // Data Source
    di.registerLazySingleton<AuthRemoteDataSourceImpl>(
        () => AuthRemoteDataSourceImpl());
    di.registerLazySingleton<UserRemoteDataSource>(
        () => UserRemoteDataSourceImpl());

    // Dio
    di.registerLazySingleton<DioClient>(() => DioClient(di<Dio>()));
    di.registerLazySingleton<Dio>(() => Dio());
  }
}
