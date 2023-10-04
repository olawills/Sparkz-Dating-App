part of '../barrels.dart';

class _LoginView extends StatelessView<LoginScreen, LoginController> {
  const _LoginView(LoginController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is LoginError) {
            controller.loginError(state.error.message);
          }
          if (state is LoginSuccess) {
            controller.loginSuccess(state.response);
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: AutofillGroup(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.sbh,
                    ReusableText(
                        text: loginText,
                        style:
                            appMStyle(23, Color(kDark.value), FontWeight.w700)),
                    20.sbh,
                    CustomTxtField(
                      labelText: 'Email',
                      hintText: 'Email',
                      autofillHints: const [AutofillHints.email],
                      keyboardType: TextInputType.emailAddress,
                      textEditingController: controller.emailController,
                      isValidationMessage: true,
                      validator: (val) => Validators.emailValidator(value: val),
                    ),
                    CustomTxtField(
                      labelText: 'Password',
                      hintText: 'Enter pasword',
                      autofillHints: const [AutofillHints.password],
                      keyboardType: TextInputType.text,
                      suffix: true,
                      textEditingController: controller.passwordController,
                      isValidationMessage: true,
                      validator: (val) =>
                          Validators.passwordValidator(value: val),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              fillColor: MaterialStatePropertyAll(
                                  Color(kDarkGrey.value)),
                              value: controller.isCheck,
                              onChanged: (value) => controller.toggleCheck(),
                            ),
                            ReusableText(
                                text: 'Remember me',
                                style: appMStyle(
                                    15, Color(kDark.value), FontWeight.w400)),
                          ],
                        ),
                        // 30.sbH,
                        RichText(
                          textAlign: TextAlign.right,
                          text: TextSpan(
                              text: 'Forgot Password',
                              style: appMStyle(
                                  13, Color(kDark.value), FontWeight.w500),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => controller.forgotPassword()),
                        ),
                      ],
                    ),
                    30.sbh,
                    BlocBuilder<AuthBloc, AuthenticationState>(
                      builder: (context, state) {
                        return CustomButton(
                          width: width,
                          height: height / 15,
                          color: Color(kDarkRed.value),
                          textColor: Color(kLight.value),
                          isLoading: state is LoginLoading,
                          text: state is LoginLoading
                              ? 'Logging in please wait...'
                              : 'Login',
                          onTap: () => controller.login(),
                        );
                      },
                    ),
                    30.sbh,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          color: Color(kDarkGrey.value),
                          width: width * 0.28,
                          height: 2.h,
                        ),
                        ReusableText(
                            text: ' or continue with ',
                            style: appMStyle(
                                13, Color(kDarkGrey.value), FontWeight.w400)),
                        Container(
                          color: Color(kDarkGrey.value),
                          width: width * 0.28,
                          height: 2.h,
                        ),
                      ],
                    ),
                    30.sbh,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildLoginOptions(
                            onTap: () {}, imagePath: Assets.helper('fb')),
                        20.sbw,
                        buildLoginOptions(
                            onTap: () {}, imagePath: Assets.helper('gb')),
                        20.sbw,
                        buildLoginOptions(
                            onTap: () {}, imagePath: Assets.helper('in')),
                      ],
                    ),
                    50.sbh,
                    Center(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: 'Don\'t have an account? ',
                                style: appMStyle(15, Color(kDarkGrey.value),
                                    FontWeight.w400)),
                            TextSpan(
                                text: 'Sign up',
                                style: appMStyle(
                                    15, Color(kDarkRed.value), FontWeight.w400),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => controller.register()),
                          ],
                        ),
                      ),
                    ),
                  ],
                ).padding(
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 10)),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLoginOptions(
      {required VoidCallback onTap,
      required String imagePath,
      double? height}) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(imagePath),
    );
  }
}
