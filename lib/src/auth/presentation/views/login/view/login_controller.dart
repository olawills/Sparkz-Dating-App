part of '../barrels.dart';

class LoginScreen extends StatefulWidget {
  static const String path = '/auth/login';
  static const String name = 'login';
  const LoginScreen({super.key});

  // final bool canPop;
  @override
  State<LoginScreen> createState() => LoginController();
}

class LoginController extends State<LoginScreen> {
  late TextEditingController emailController, passwordController;

  late FocusNode passwordFocusNode;
  bool isCheck = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  toggleCheck() {
    setState(() {
      isCheck = !isCheck;
    });
  }

  login() {
    if (isCheck) {
      TextInput.finishAutofillContext();
    }
    final gpsBloc = serviceLocator<GpsBloc>();
    if (gpsBloc.state.isGpsEnabled) {
      if (formKey.currentState!.validate()) {
        context.read<AuthBloc>().add(LoginEvent(
            email: emailController.text, password: passwordController.text));
      } else {
        gpsBloc.askLocationPermission();
      }
    }
  }

  loginSuccess(LoginResponse data) async {
    await LocalDataStorage.instance.setLoginResponse(data);
    Future.delayed(const Duration(milliseconds: 1500),
            () => ToastMessages().showToastSuccessMessage(data.message))
        .whenComplete(
      () => context.goNamed(HomeScreen.name),
    );
  }

  loginError(NetworkExceptions error) {
    ToastMessages().showToastServerError(error);
  }

  forgotPassword() {
    context.pushNamed(ForgotPasswordScreen.name);
  }

  register() {
    context.pushNamed(SignUpScreen.name);
  }

  @override
  Widget build(BuildContext context) {
    return _LoginView(this);
  }
}
