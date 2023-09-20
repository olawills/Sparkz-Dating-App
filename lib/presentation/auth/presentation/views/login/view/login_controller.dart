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
    if (formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(LoginEvent(
          email: emailController.text, password: passwordController.text));
    }
  }

  loginSuccess(String token) async {
    await LocalDataStorage.instance.setToken(token);
    // ignore: use_build_context_synchronously
    context.goNamed(HomeScreen.name);
  }

  loginError(Failure error) {
    Fluttertoast.showToast(
        msg: error.toString(),
        fontSize: 16,
        backgroundColor: Color(kDarkRed.value),
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM);
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
