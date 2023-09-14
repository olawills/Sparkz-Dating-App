part of '../../verification_barrels.dart';

class _CompleteOTPVerificationView extends StatelessView<
    CompleteVerificationOTPScreen, CompleteVerificationOTPController> {
  const _CompleteOTPVerificationView(CompleteVerificationOTPController state,
      {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ReusableText(
            text: 'Verifcation successful',
            style: appMStyle(26, Color(kDark.value), FontWeight.w600),
          ),
          20.sbH,
          Container(
            alignment: Alignment.center,
            width: width * 0.2,
            height: height * 0.2,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(kDarkRed.value),
            ),
            child: Icon(Icons.done, color: Color(kLight.value), size: 50.w),
          ),
          20.sbH,
          CustomBtn(
            width: width,
            height: height / 15,
            color: Color(kDarkRed.value),
            textColor: Color(kLight.value),
            text: 'Continue',
            onTap: () => controller.infoView(),
          )
        ],
      ).padding(EdgeInsets.symmetric(horizontal: 10, vertical: 24))),
    );
  }
}
