part of '../otp_barrels.dart';

class OtpScreen extends StatefulWidget {
  static const String path = '/otp';
  static const String name = 'otp';
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => OtpController();
}

class OtpController extends State<OtpScreen> {
  TextEditingController otpController = TextEditingController();
  final FocusNode pinputFocusNode = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String email = '';

  @override
  void initState() {
    super.initState();

    SharedPreferences.getInstance().then((pref) => {
          setState(() {
            email = pref.getString('email')!;
          })
        });
  }

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  verify() {
    context
        .read<AuthBloc>()
        .add(VerifyOtpEvent(otp: otpController.text, email: email));
  }

  resendOtp() {
    context.read<AuthBloc>().add(ResendOtpEvent(email: email));
  }

  verifySuccess() {
    context.goNamed(CompleteVerificationOTPScreen.name);
  }

  verifyOtpError(NetworkExceptions error) {
    Fluttertoast.showToast(
      msg: NetworkExceptions.getErrorMessage(error),
      backgroundColor: Color(kDarkRed.value),
    );
  }

  backPage() {
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return _OtpView(this);
  }
}
