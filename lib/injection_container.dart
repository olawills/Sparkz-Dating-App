import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dating_app/src/auth/data/datasource/auth_info_remote_datasource.dart';
import 'package:dating_app/src/auth/data/datasource/auth_remote_data_source.dart';
import 'package:dating_app/src/auth/data/repository/auth_info_repository.dart';
import 'package:dating_app/src/auth/data/repository/auth_repository.dart';
import 'package:dating_app/src/startup/presentation/bloc/onboarding_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'app/core/network/dio_client.dart';
import 'src/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'src/auth/presentation/bloc/user_info_bloc/interest_bloc.dart';
import 'src/features/cubit/bottom_navbar/bottom_navigation_cubit.dart';
import 'src/features/cubit/internet_connection/internet_connection_cubit.dart';
import 'src/features/home/data/datasources/user_remote_data_source.dart';
import 'src/features/home/data/repository/user_repository.dart';
import 'src/features/home/presentation/bloc/users_bloc.dart';

GetIt serviceLocator = GetIt.instance;

class ServiceLocator {
  ServiceLocator._();

  static void init() {
    // Blocs
    serviceLocator.registerFactory<AuthBloc>(() => AuthBloc());
    serviceLocator.registerFactory<OnboardingBloc>(() => OnboardingBloc());
    serviceLocator.registerFactory<FetchUserBloc>(() => FetchUserBloc());
    serviceLocator.registerFactory<InterestBloc>(() => InterestBloc());

    // Cubit
    serviceLocator
        .registerFactory<BottomNavigationCubit>(() => BottomNavigationCubit());
    serviceLocator.registerFactory<InternetConnectionCubit>(
        () => InternetConnectionCubit(connectivity: serviceLocator()));

    // Data Source
    serviceLocator.registerFactory<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl());
    serviceLocator.registerFactory<UserRemoteDataSource>(
        () => UserRemoteDataSourceImpl());
    serviceLocator.registerFactory<AuthInfoRemoteDataSource>(
        () => AuthInfoRemoteDataSourceImpl());

    // Repositories
    serviceLocator.registerFactory<AuthRepositories>(() => AuthRepositories());
    serviceLocator
        .registerFactory<AuthInfoRepository>(() => AuthInfoRepository());
    serviceLocator.registerFactory<UserRepository>(() => UserRepository());

    // Dio
    serviceLocator.registerLazySingleton<DioClient>(
        () => DioClient(serviceLocator<Dio>()));
    serviceLocator.registerLazySingleton<Dio>(() => Dio());
    serviceLocator.registerLazySingleton<Connectivity>(() => Connectivity());
  }
}
