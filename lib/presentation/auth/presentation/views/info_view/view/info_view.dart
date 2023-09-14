part of '../barrels.dart';

class _InforView extends StatelessView<InfoScreen, InfoController> {
  const _InforView(InfoController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            if (controller.isLoading)
              LinearProgressIndicator(
                valueColor:
                    AlwaysStoppedAnimation<Color>(Color(kDarkRed.value)),
                backgroundColor: Colors.grey[200],
              ),
            controller.isLoading
                ? LoadingPage()
                : Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      30.sbH,
                      ReusableText(
                        text: 'What is your Gender',
                        style:
                            appMStyle(24, Color(kDark.value), FontWeight.w500),
                      ),
                      50.sbH,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GenderCard(
                            icon: Icons.male_rounded,
                            gender: 'Male',
                            initialColor: Color(kDarkRed.value),
                            controller: controller,
                            selectedGender: controller.selectedGender,
                            onGenderSelected: (selectedGender) {
                              controller.selectedGender = selectedGender;
                            },
                          ),
                          GenderCard(
                            icon: Icons.female_rounded,
                            gender: 'Female',
                            initialColor: Color(kDarkRed.value),
                            controller: controller,
                            selectedGender: controller.selectedGender,
                            onGenderSelected: (selectedGender) {
                              controller.selectedGender = selectedGender;
                            },
                          ),
                        ],
                      ),
                      50.sbH,
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: GenderCard(
                          icon: Icons.transgender_sharp,
                          gender: 'Transgender',
                          initialColor: Color(kDarkRed.value),
                          controller: controller,
                          selectedGender: controller.selectedGender,
                          onGenderSelected: (selectedGender) {
                            controller.selectedGender = selectedGender;
                          },
                        ),
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
                    EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                  ),
          ],
        ),
      ),
    );
  }
}

class GenderCard extends StatefulWidget {
  final IconData icon;
  final String gender;
  Color initialColor;
  final InfoController controller;
  final String selectedGender;

  final Function(String) onGenderSelected;

  GenderCard({
    super.key,
    required this.initialColor,
    required this.gender,
    required this.icon,
    required this.controller,
    required this.selectedGender,
    required this.onGenderSelected,
  });

  @override
  State<GenderCard> createState() => _GenderCardState();
}

class _GenderCardState extends State<GenderCard> {
  late Color cardColor;
  late bool isSelected;

  @override
  void initState() {
    super.initState();
    cardColor = widget.initialColor;
    // isSelected = widget.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    bool isSelected = widget.gender == widget.selectedGender;
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
          cardColor = isSelected ? widget.initialColor : Color(kDarkRed.value);
        });
        widget.onGenderSelected(isSelected ? widget.gender : '');
        if (isSelected) {
          widget.controller.saveGenderInfo(widget.gender);
        }
      },
      child: Column(
        children: [
          Icon(widget.icon, color: cardColor, size: 100),
          10.sbH,
          ReusableText(
              text: widget.gender,
              style: appMStyle(20, cardColor, FontWeight.w700))
        ],
      ),
    );
  }
}
