part of '../forgot_password_barrels.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const String path = '/auth/forgotPassword';
  static const String name = 'forgotPassword';
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => ForgotPasswordController();
}

class ForgotPasswordController extends State<ForgotPasswordScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  backPage() {
    context.pop();
  }

  resetPassword() {
    if (formKey.currentState!.validate()) {
      context
          .read<AuthBloc>()
          .add(ForgotPasswordEvent(email: emailController.text));
    }
  }

  forgotPasswordSuccess() {
    context.pushNamed(ResetPasswordScreen.name, extra: emailController.text);
  }

  resetError(NetworkExceptions error) {
    Fluttertoast.showToast(
      msg: NetworkExceptions.getErrorMessage(error),
      backgroundColor: Color(kDarkRed.value),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _ForgotPasswordView(this);
  }
}
