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
    final gpsBloc = serviceLocator<GpsBloc>();
    if (gpsBloc.state.isGpsEnabled) {
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
    } else {
      gpsBloc.askLocationPermission();
    }
  }

  loginPage() {
    context.goNamed(LoginScreen.name);
  }

  signupSuccess(User data) async {
    await LocalDataStorage.instance.setuserInfo(data);

    Future.delayed(const Duration(milliseconds: 1500),
        () => ToastMessages().showToastSuccessMessage(data.email)).whenComplete(
      () => context.goNamed(OtpScreen.name),
    );
  }

  signupError(NetworkExceptions error) {
    ToastMessages().showToastServerError(error);
  }

  backPage() {}

  @override
  Widget build(BuildContext context) {
    return _SignUpView(this);
  }
}
