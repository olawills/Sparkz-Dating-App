part of '../barrels.dart';

class SignUpScreen extends StatefulWidget {
  static const String path = '/auth/register';
  static const String name = 'signup';
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => SignupController();
}

class SignupController extends State<SignUpScreen> {
  late TextEditingController emailController,
      passwordController,
      firstNameController,
      lastNameController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  register() {
    if (formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      context.read<AuthBloc>().add(
            SignupEvent(
              firstName: firstNameController.text,
              lastName: lastNameController.text,
              email: emailController.text,
              password: passwordController.text,
            ),
          );
    }
  }

  loginPage() {
    context.goNamed(LoginScreen.name);
  }

  signupSuccess(User data) async {
    await LocalDataStorage.instance.setuserInfo(data);
    // ignore: use_build_context_synchronously
    context.goNamed(OtpScreen.name);
  }

  signupError(Failure error) {
    Fluttertoast.showToast(
      msg: error.message,
      backgroundColor: Color(kDarkRed.value),
    );
  }

  backPage() {}

  @override
  Widget build(BuildContext context) {
    return _SignUpView(this);
  }
}
