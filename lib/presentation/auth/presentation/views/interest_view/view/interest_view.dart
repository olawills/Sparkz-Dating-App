part of '../barrels.dart';

class _InterestView extends StatelessView<InterestScreen, InterestController> {
  const _InterestView(InterestController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppB(),
          20.sbH,
          Align(
            alignment: Alignment.center,
            child: ReusableText(
              text: 'What are your interests?',
              style: appMStyle(20, Color(kDark.value), FontWeight.w700),
            ),
          ),
          10.sbH,
          ReusableText(
            text: interestText,
            style: appMStyle(19, Color(kDarkWithOp.value), FontWeight.w500),
          ),
          70.sbH,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                buildInterestCard(
                    onTap: () => controller.selectedInterest(),
                    isSelected: controller.selectedIcon,
                    icon: Icons.check,
                    text: controller.interest[0] = 'Game',
                    color: Color(kLowRed.value).withOpacity(0.2)),
                buildInterestCard(
                    onTap: () => controller.selectedInterest(),
                    isSelected: controller.selectedIcon,
                    icon: Icons.check,
                    text: controller.interest[1] = 'Anime',
                    color: Color(kDarkGrey.value).withOpacity(0.2)),
              ]),
              Align(
                alignment: Alignment.topCenter,
                child: buildInterestCard(
                    onTap: () => controller.selectedInterest(),
                    isSelected: controller.selectedIcon,
                    icon: Icons.check,
                    text: controller.interest[2] = 'Music',
                    color: Color(kLowRed.value).withOpacity(0.2)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildInterestCard(
                      onTap: () => controller.selectedInterest(),
                      isSelected: controller.selectedIcon,
                      icon: Icons.check,
                      text: controller.interest[4] = 'Tech',
                      color: Color(kLowRed.value).withOpacity(0.2)),
                  buildInterestCard(
                      onTap: () {},
                      icon: Icons.check,
                      text: controller.interest[5] = 'DC Comic',
                      color: Color(kDarkGrey.value).withOpacity(0.2)),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: buildInterestCard(
                    onTap: () => controller.selectedInterest(),
                    isSelected: controller.selectedIcon,
                    icon: Icons.check,
                    text: 'Fashion',
                    color: Color(kLowRed.value).withOpacity(0.2)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildInterestCard(
                      onTap: () => controller.selectedInterest(),
                      isSelected: controller.selectedIcon,
                      icon: Icons.check,
                      text: controller.interest[6] = 'Football',
                      color: Color(kDarkGrey.value).withOpacity(0.2)),
                  buildInterestCard(
                      onTap: () => controller.selectedInterest(),
                      isSelected: controller.selectedIcon,
                      icon: Icons.check,
                      text: controller.interest[7] = 'Movies',
                      color: Color(kDarkGrey.value).withOpacity(0.2)),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: buildInterestCard(
                    onTap: () => controller.selectedInterest(),
                    isSelected: controller.selectedIcon,
                    icon: Icons.check,
                    text: controller.interest[8] = 'Travel',
                    color: Color(kDarkGrey.value).withOpacity(0.2)),
              ),
            ],
          ),
          70.sbH,
          CustomBtn(
            width: width,
            height: height / 15,
            color: Color(kDarkRed.value),
            textColor: Color(kLight.value),
            text: 'Continue',
            onTap: () => controller.navigateToNextScreen(),
          )
        ],
      ).padding(
        EdgeInsets.symmetric(horizontal: 12, vertical: 24),
      ),
    ));
  }

  buildInterestCard({
    required IconData icon,
    required String text,
    required Color color,
    required VoidCallback onTap,
    bool? isSelected,
  }) =>
      InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(8),
          width: width * 0.25,
          decoration: BoxDecoration(
            color: color,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isSelected == true
                  ? Icon(icon, color: Color(kDark.value))
                  : SizedBox.shrink(),
              ReusableText(
                text: text,
                style: appMStyle(16, Color(kDarkWithOp.value), FontWeight.w500),
              ),
            ],
          ),
        ),
      );
}
