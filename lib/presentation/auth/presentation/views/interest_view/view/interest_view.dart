part of '../barrels.dart';

class _InterestView extends StatelessView<InterestScreen, InterestController> {
  const _InterestView(InterestController state, {Key? key})
      : super(state, key: key);
/*
 if (state is CreateUserProfileSuccess) {
            controller.saveInfoSuccess();
          }
          if (state is CreateUserProfileError) {
            controller.saveInfoError(state.error);
          }
*/
  @override
  Widget build(BuildContext context) {
    Log.debug('Hello');
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppB(),
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
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildInterestCard(
                        isSelected: controller.selectTedList.contains('Game'),
                        icon: Icons.check,
                        text: 'Game',
                        color: Color(kLowRed.value).withOpacity(0.2),
                        onTap: () {
                          controller.selectedItems('Game');
                          Log.debug(controller.selectTedList);
                          controller.selectedInterest();
                        },
                      ),
                      buildInterestCard(
                        isSelected: controller.selectTedList.contains('Anime'),
                        icon: Icons.check,
                        text: 'Anime',
                        color: Color(kDarkGrey.value).withOpacity(0.2),
                        onTap: () {
                          controller.selectedItems('Anime');
                          Log.debug(controller.selectTedList);
                          controller.selectedInterest();
                        },
                      ),
                    ]),
                Align(
                  alignment: Alignment.topCenter,
                  child: buildInterestCard(
                    isSelected: controller.selectTedList.contains('Music'),
                    icon: Icons.check,
                    text: 'Music',
                    color: Color(kLowRed.value).withOpacity(0.2),
                    onTap: () {
                      controller.selectedItems('Music');
                      controller.selectedInterest();
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildInterestCard(
                      isSelected: controller.selectTedList.contains('Tech'),
                      icon: Icons.check,
                      text: 'Tech',
                      color: Color(kLowRed.value).withOpacity(0.2),
                      onTap: () {
                        controller.selectedItems('Tech');
                        controller.selectedInterest();
                      },
                    ),
                    buildInterestCard(
                      isSelected: controller.selectTedList.contains('DC Comic'),
                      icon: Icons.check,
                      text: 'Dc Comic',
                      color: Color(kDarkGrey.value).withOpacity(0.2),
                      onTap: () {
                        controller.selectedItems('DC Comic');
                        controller.selectedInterest();
                      },
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: buildInterestCard(
                    isSelected: controller.selectTedList.contains('Fashion'),
                    icon: Icons.check,
                    text: 'Fashion',
                    color: Color(kLowRed.value).withOpacity(0.2),
                    onTap: () {
                      controller.selectedItems('Fashion');
                      controller.selectedInterest();
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildInterestCard(
                      isSelected: controller.selectTedList.contains('Football'),
                      icon: Icons.check,
                      text: 'Football',
                      color: Color(kDarkGrey.value).withOpacity(0.2),
                      onTap: () {
                        controller.selectedItems('Football');
                        controller.selectedInterest();
                      },
                    ),
                    buildInterestCard(
                      isSelected: controller.selectTedList.contains('Movies'),
                      icon: Icons.check,
                      text: 'Movies',
                      color: Color(kDarkGrey.value).withOpacity(0.2),
                      onTap: () {
                        controller.selectedItems('Movies');
                        controller.selectedInterest();
                      },
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: buildInterestCard(
                    isSelected: controller.selectTedList.contains('Travel'),
                    icon: Icons.check,
                    text: 'Travel',
                    color: Color(kDarkGrey.value).withOpacity(0.2),
                    onTap: () {
                      controller.selectedItems('Travel');
                      controller.selectedInterest();
                    },
                  ),
                ),
              ],
            ),
            70.sbH,
            BlocConsumer<InterestBloc, UserProfileState>(
              listener: (context, state) {
                if (state is CreateUserProfileSuccess) {
                  controller.saveInfoSuccess();
                }
                if (state is CreateUserProfileError) {
                  controller.saveInfoError(state.error);
                }
              },
              builder: (context, state) {
                return CustomButton(
                  width: width,
                  height: height / 15,
                  color: Color(kDarkRed.value),
                  textColor: Color(kLight.value),
                  text: 'Continue',
                  onTap: () => controller.saveInfo(),
                );
              },
            ),
          ],
        ).padding(
          const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
        ),
      ),
    );
  }

  buildInterestCard({
    required IconData icon,
    required String text,
    required Color color,
    required VoidCallback onTap,
    required bool isSelected,
  }) =>
      InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(8),
          width: width * 0.28,
          decoration: BoxDecoration(
            color: color,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isSelected
                  ? Icon(icon, color: Color(kDark.value))
                  : const SizedBox.shrink(),
              10.sbH,
              ReusableText(
                text: text,
                style: appMStyle(16, Color(kDarkWithOp.value), FontWeight.w500),
              ),
            ],
          ),
        ),
      );
}
