import 'package:dating_app/app/core/core.dart';
import 'package:dating_app/injection_container.dart';
import 'package:dating_app/presentation/auth/presentation/bloc/auth_bloc/auth_bloc.dart';

import '../../../presentation/auth/presentation/bloc/user_info_bloc/interest_bloc.dart';
import '../../../presentation/features/presentation/bloc/users_bloc.dart';
import '../../../presentation/features/presentation/cubit/bottom_navbar/bottom_navigation_cubit.dart';
import '../../../presentation/startup/presentation/bloc/onboarding_bloc.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        // Onboarding bloc
        BlocProvider<OnboardingBloc>(
            create: (context) => serviceLocator<OnboardingBloc>()),

        // Authenticaton Bloc
        BlocProvider<AuthBloc>(create: (context) => serviceLocator<AuthBloc>()),

        // User Bloc
        BlocProvider<FetchUserBloc>(
            create: (context) =>
                serviceLocator<FetchUserBloc>()..add(FetchAllUserEvent())),

        BlocProvider<InterestBloc>(
            create: (context) => serviceLocator<InterestBloc>()),

        // RepositoryProvider(create: (context) => UserRepositories()),

        // BottomNavBar Cubit
        BlocProvider<BottomNavigationCubit>(
            create: (context) => serviceLocator<BottomNavigationCubit>()),

        // Internet Connection Cubit
        BlocProvider<InternetConnectionCubit>(
            create: (context) =>
                serviceLocator<InternetConnectionCubit>())
      ];
}
