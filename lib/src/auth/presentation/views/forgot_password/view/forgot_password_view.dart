part of '../forgot_password_barrels.dart';

class _ForgotPasswordView
    extends StatelessView<ForgotPasswordScreen, ForgotPasswordController> {
  const _ForgotPasswordView(ForgotPasswordController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is ForgotPasswordError) {
            controller.resetError(state.error);
          }
          if (state is ForgotPasswordSuccess) {
            controller.forgotPasswordSuccess();
          }
        },
        child: SafeArea(
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppB(),
                30.sbH,
                Center(
                  child: ReusableText(
                      text: 'Forgot Password',
                      style:
                          appMStyle(23, Color(kDark.value), FontWeight.w700)),
                ),
                30.sbH,
                ReusableText(
                    text: forgotPasswordText,
                    style: appMStyle(16, Color(kDark.value), FontWeight.w500)),
                30.sbH,
                CustomTxtField(
                  labelText: 'Email',
                  hintText: 'kelvinhart@gmail.com',
                  prefix: const Icon(Icons.person),
                  keyboardType: TextInputType.emailAddress,
                  textEditingController: controller.emailController,
                  validator: (val) => Validators.emailValidator(value: val),
                ),
                20.sbH,
                BlocBuilder<AuthBloc, AuthenticationState>(
                    builder: (context, state) {
                  return CustomButton(
                    width: width,
                    height: height / 15,
                    color: Color(kDarkRed.value),
                    textColor: Color(kLight.value),
                    isLoading: state is ForgotPasswordLoading,
                    text: 'Reset Password',
                    onTap: () => controller.resetPassword(),
                  );
                }),
              ],
            ).padding(const EdgeInsets.symmetric(horizontal: 12, vertical: 24)),
          ),
        ),
      ),
    );
  }
}
