import 'package:dating_app/app/core/core.dart';
import 'package:dating_app/injection_container.dart';
import 'package:dating_app/presentation/auth/presentation/bloc/auth_bloc.dart';

import '../../../presentation/features/presentation/bloc/users_bloc.dart';
import '../../../presentation/features/presentation/cubit/bottom_navbar/bottom_navigation_cubit.dart';
import '../../../presentation/startup/presentation/bloc/onboarding_bloc.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        // Onboarding bloc
        BlocProvider<OnboardingBloc>(create: (context) => di<OnboardingBloc>()),

        // Authenticaton Bloc
        BlocProvider<AuthBloc>(create: (context) => di<AuthBloc>()),

        // User Bloc
        BlocProvider<FetchUserBloc>(
            create: (context) => di<FetchUserBloc>()..add(FetchAllUserEvent())),

        // RepositoryProvider(create: (context) => UserRepositories()),

        // BottomNavBar Cubit
        BlocProvider<BottomNavigationCubit>(
            create: (context) => di<BottomNavigationCubit>()),

        // Internet Connection Cubit
        BlocProvider<InternetConnectionCubit>(
            create: (context) => di<InternetConnectionCubit>()..init())
      ];
}
