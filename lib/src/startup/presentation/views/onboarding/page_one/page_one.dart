import 'package:dating_app/app/common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widget/image_spinner.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const HeightSpacer(size: 20),
              ReusableText(
                text: kAppName,
                style: appBStyle(
                  16,
                  Color(kDark.value),
                  FontWeight.w500,
                ),
              ),
              10.sbh,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ReusableText(
                    text: firstPage,
                    style: appBStyle(
                      27,
                      Color(kDark.value),
                      FontWeight.w600,
                    ),
                  ),
                  10.sbw,
                  ReusableText(
                    text: 'perfect',
                    style: appBStyle(
                      27,
                      Color(kDarkRed.value),
                      FontWeight.w600,
                    ),
                  ),
                ],
              ),
              ReusableText(
                text: 'partner',
                style: appBStyle(
                  27,
                  Color(kDark.value),
                  FontWeight.w600,
                ),
              ),
              30.sbh,
              Image.asset(
                Assets.helper('logo'),
                height: 40.h,
              ),
              10.sbh,
              const ImageSpinner(),
              30.sbh,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: ReusableText(
                  text: pageOne,
                  style: appMStyle(
                    18,
                    Color(kDark.value),
                    FontWeight.w500,
                  ),
                ),
              ),
              50.sbh,
            ],
          ),
        ),
      ),
    );
  }
}
