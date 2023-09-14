part of '../barrels.dart';

class _SignUpView extends StatelessView<SignUpScreen, SignupController> {
  const _SignUpView(SignupController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is SignupError) {
            controller.signupError(state.error);
          }
          if (state is SignupSuccess) {
            controller.signupSuccess(state.data);
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppB(),
                  30.sbH,
                  ReusableText(
                      text: signupText,
                      style:
                          appMStyle(23, Color(kDark.value), FontWeight.w700)),
                  30.sbH,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CustomTxtField(
                          labelText: 'First Name',
                          hintText: 'Enter first name',
                          keyboardType: TextInputType.name,
                          textEditingController: controller.firstNameController,
                          validator: (val) =>
                              ValidationManager.firstNameValidator(value: val),
                        ),
                      ),
                      10.sbW,
                      Expanded(
                        child: CustomTxtField(
                          labelText: 'Last name',
                          hintText: 'Enter last name',
                          keyboardType: TextInputType.text,
                          textEditingController: controller.lastNameController,
                          validator: (val) =>
                              ValidationManager.lastNameValidator(value: val),
                        ),
                      ),
                    ],
                  ),
                  CustomTxtField(
                    labelText: 'Email',
                    hintText: 'Enter email',
                    keyboardType: TextInputType.emailAddress,
                    textEditingController: controller.emailController,
                    validator: (val) =>
                        ValidationManager.emailValidator(value: val),
                  ),
                  10.sbW,
                  CustomTxtField(
                    labelText: 'Password',
                    hintText: 'Enter pasword',
                    keyboardType: TextInputType.text,
                    suffix: true,
                    textEditingController: controller.passwordController,
                    validator: (val) =>
                        ValidationManager.passwordValidator(value: val),
                  ),
                  30.sbH,
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: 'By signing up you agreed to our ',
                            style: appMStyle(
                                15, Color(kDark.value), FontWeight.w400)),
                        TextSpan(
                            text: 'Terms & condition ',
                            style: appMStyle(
                                15, Color(kDarkRed.value), FontWeight.w400),
                            recognizer: TapGestureRecognizer()..onTap = () {}),
                        TextSpan(
                          text: 'and ',
                          style: appMStyle(
                              15, Color(kDark.value), FontWeight.w400),
                        ),
                        TextSpan(
                            text: 'privacy policy',
                            style: appMStyle(
                                15, Color(kDarkRed.value), FontWeight.w400),
                            recognizer: TapGestureRecognizer()..onTap = () {}),
                      ],
                    ),
                  ),
                  50.sbH,
                  BlocBuilder<AuthBloc, AuthenticationState>(
                    builder: (context, state) {
                      return CustomBtn(
                        width: width,
                        height: height / 15,
                        color: Color(kDarkRed.value),
                        textColor: Color(kLight.value),
                        isLoading: state is SignupLoading,
                        loadingColor: Color(kLowRed.value),
                        text: state is SignupLoading
                            ? 'Registering please wait...'
                            : 'Continue',
                        onTap: () => controller.register(),
                      );
                    },
                  ),
                  50.sbH,
                  Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'Already have an account? ',
                              style: appMStyle(
                                  15, Color(kDarkGrey.value), FontWeight.w400)),
                          TextSpan(
                            text: 'Log in',
                            style: appMStyle(
                                15, Color(kDarkRed.value), FontWeight.w400),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => controller.loginPage(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ).padding(EdgeInsets.symmetric(horizontal: 12, vertical: 20)),
            ),
          ),
        ),
      ),
    );
  }
}
