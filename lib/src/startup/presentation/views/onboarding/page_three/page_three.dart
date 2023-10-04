import 'package:dating_app/app/core/core.dart';

import '../../../../../../app/common/common.dart';

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/people-with-smartphone.png',
            height: height * 0.4,
            width: width,
          ),
          30.sbh,
          ReusableText(
            text: pageThreeSubText,
            style: appMStyle(
              19,
              Color(kDark.value),
              FontWeight.w600,
            ),
          ),
          10.sbh,
          ReusableText(
            text: pageThree,
            style: appMStyle(
              19,
              Color(kDark.value),
              FontWeight.w500,
            ),
          ).padding(const EdgeInsets.symmetric(horizontal: 20)),
        ],
      ),
    );
  }
}
