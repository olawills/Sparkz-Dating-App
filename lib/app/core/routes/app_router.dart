import 'package:dating_app/app/core/core.dart';

class AppRouter {
  static final RouterConfig<Object> routerConfig = RouterConfig(
    routerDelegate: router.routerDelegate,
    backButtonDispatcher: router.backButtonDispatcher,
    routeInformationParser: router.routeInformationParser,
    routeInformationProvider: router.routeInformationProvider,
  );

  static GoRouter get router => _router;

  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;
}

GlobalKey<NavigatorState> get _navigatorKey => GlobalKey<NavigatorState>();
GlobalKey<NavigatorState> get _shellNavigatorKey => GlobalKey<NavigatorState>();

final GoRouter _router = GoRouter(
    navigatorKey: _navigatorKey,
    initialLocation: StartupScreen.path,
    debugLogDiagnostics: true,
    errorBuilder: (context, state) => const NotFoundScreen(),
    routes: [
      GoRoute(
        path: StartupScreen.path,
        name: StartupScreen.name,
        builder: (context, state) => StartupScreen(),
      ),
      GoRoute(
        path: OnBoardingScreen.path,
        name: OnBoardingScreen.name,
        builder: (context, state) => const OnBoardingScreen(),
      ),
      GoRoute(
        path: LoginScreen.path,
        name: LoginScreen.name,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const LoginScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: SignUpScreen.path,
        name: SignUpScreen.name,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: OtpScreen.path,
        name: OtpScreen.name,
        builder: (context, state) {
          // final String email = state.extra as String;
          return OtpScreen();
        },
      ),
      GoRoute(
        path: CompleteVerificationOTPScreen.path,
        name: CompleteVerificationOTPScreen.name,
        pageBuilder: (context, state) =>
            NoTransitionPage(child: CompleteVerificationOTPScreen()),
      ),
      GoRoute(
        path: ForgotPasswordScreen.path,
        name: ForgotPasswordScreen.name,
        builder: (context, state) => ForgotPasswordScreen(),
      ),
      GoRoute(
          path: ResetPasswordScreen.path,
          name: ResetPasswordScreen.name,
          builder: (context, state) {
            final String email = state.extra as String;
            return ResetPasswordScreen(email: email);
          }),
      GoRoute(
        path: InfoScreen.path,
        name: InfoScreen.name,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const InfoScreen(),
            transitionDuration: Duration(milliseconds: 500),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              var begin = Offset(1.0, 0.0);
              var end = Offset.zero;
              var tween = Tween(begin: begin, end: end)
                  .chain(CurveTween(curve: Curves.easeInOut));
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: InterestScreen.path,
        name: InterestScreen.name,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const InterestScreen(),
            transitionDuration: Duration(milliseconds: 500),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              var begin = Offset(1.0, 0.0);
              var end = Offset.zero;
              var tween = Tween(begin: begin, end: end)
                  .chain(CurveTween(curve: Curves.easeInOut));
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
          );
        },
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          // return BlocListener<InternetConnectionCubit, InternetConnectionState>(
          //   listener: (context, state) {
          //     if (state is InternetDisconnected) {
          //       InternetConnectionCubit.get(context).showDialog = true;
          //       Log.debug('No Internet');
          //       Future.delayed(const Duration(milliseconds: 500), () {
          //         Fluttertoast.showToast(
          //             msg: 'No Internet Connection',
          //             fontSize: 16,
          //             backgroundColor: Color(kDarkRed.value),
          //             gravity: ToastGravity.TOP);
          //       });
          //     }
          //     if (state is InternetConnected) {
          //       if (InternetConnectionCubit.get(context).showDialog) {
          //         Log.debug(' Internet');
          //         InternetConnectionCubit.get(context).showDialog = false;
          //       }
          //     }
          //   },
          return FeaturesScreen(child: child);
          // );
        },
        routes: [
          GoRoute(
              path: HomeScreen.path,
              name: HomeScreen.name,
              pageBuilder: (context, state) {
                return NoTransitionPage(child: HomeScreen());
              }),
          GoRoute(
            path: ChatsScreen.route,
            name: ChatsScreen.name,
            pageBuilder: (context, state) =>
                NoTransitionPage(child: ChatsScreen()),
          ),
          GoRoute(
            path: NotificationScreen.route,
            name: NotificationScreen.name,
            pageBuilder: (context, state) =>
                NoTransitionPage(child: NotificationScreen()),
          ),
          GoRoute(
            path: ProfileScreen.route,
            name: ProfileScreen.name,
            pageBuilder: (context, state) =>
                NoTransitionPage(child: ProfileScreen()),
          ),
        ],
      ),
    ],
    redirect: (BuildContext context, GoRouterState state) async {
      print(state.matchedLocation);
      print(await LocalDataStorage.instance.getFirstTime());
      if (state.matchedLocation == LoginScreen.path) {
        if (await LocalDataStorage.instance.getFirstTime()) {
          return '${OnBoardingScreen.path}';
        } else {
          // if (await LocalDataStorage.instance.getLoggedIn()) {
          //   if (await LocalDataStorage.instance.getUserDetails()) {
          //     return '${HomeScreen.path}';
          // } else {
          return '${InfoScreen.path}';
          // }
          // return '${HomeScreen.path}';
          // } else {
          //   return '${LoginScreen.path}';
          // }
        }
      }
      return null;
    });