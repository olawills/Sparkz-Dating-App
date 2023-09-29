part of 'barrels.dart';

class OnBoarding extends StatelessView<OnBoardingScreen, OnBoardingController> {
  const OnBoarding(OnBoardingController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OnboardingBloc, OnBoardingState>(
        builder: (context, state) {
          return Stack(
            children: [
              PageView(
                physics: const AlwaysScrollableScrollPhysics(),
                controller: controller.pageController,
                onPageChanged: (index) {
                  state.page = index;
                  BlocProvider.of<OnboardingBloc>(context)
                      .add(OnBoardingEvent());
                },
                children: const [
                  PageOne(),
                  PageTwo(),
                  PageThree(),
                ],
              ),
              state.page > 0
                  ? Positioned(
                      left: 20.w,
                      right: 20.w,
                      bottom: height * 0.06,
                      child: state.page == 1
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SmoothPageIndicator(
                                  controller: controller.pageController,
                                  count: 2,
                                  effect: WormEffect(
                                      radius: 8,
                                      dotHeight: 8.h,
                                      dotWidth: 40.w,
                                      spacing: 10,
                                      dotColor: Color(kDarkRed.value),
                                      activeDotColor: Color(kDarkGrey.value)),
                                ),
                                CustomButton(
                                  width: width * 0.14,
                                  height: height * 0.06,
                                  color: Color(kDarkRed.value),
                                  resize: true,
                                  icon: Icons.arrow_forward,
                                  onTap: () => controller.pageController
                                      .animateToPage(2,
                                          duration: const Duration(
                                              milliseconds: 1000),
                                          curve: Curves.fastLinearToSlowEaseIn),
                                ),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomButton(
                                  width: width * 0.14,
                                  height: height * 0.06,
                                  color: Color(kDarkRed.value),
                                  resize: true,
                                  icon: Icons.arrow_back,
                                  onTap: () => controller.pageController
                                      .animateToPage(1,
                                          duration:
                                              const Duration(milliseconds: 500),
                                          curve: Curves.easeInBack),
                                ),
                                SmoothPageIndicator(
                                  controller: controller.pageController,
                                  count: 2,
                                  effect: WormEffect(
                                      radius: 8,
                                      dotHeight: 8.h,
                                      dotWidth: 40.w,
                                      spacing: 8,
                                      dotColor: Color(kDarkRed.value),
                                      activeDotColor: Color(kDarkGrey.value)),
                                ),
                              ],
                            ))
                  : Positioned(
                      left: 20.w,
                      right: 20.w,
                      bottom: height * 0.06,
                      child: CustomButton(
                        width: width,
                        height: height * 0.07,
                        color: Color(kDarkRed.value),
                        text: 'Continue',
                        textColor: Color(kLight.value),
                        onTap: () => controller.loginPage(),
                      ),
                    )
            ],
          );
        },
      ),
    );
  }
}
