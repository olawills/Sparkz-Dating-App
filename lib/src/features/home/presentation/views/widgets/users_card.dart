import 'package:dating_app/app/core/core.dart';
import 'package:dating_app/src/auth/data/models/user.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../app/common/common.dart';

class UsersDisplayCard extends StatelessWidget {
  final User user;
  const UsersDisplayCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: SizeOf.carouselHeight,
          width: SizeOf.carouselWidth,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(8),
                bottomRight: Radius.circular(14)),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(user.profilePicture)),
          ),
        ),
        SizedBox(
          height: SizeOf.carouselBodyHeight,
          width: SizeOf.carouselBodyWidth,
          child: Card(
            color: AppColors.whiteColor,
            elevation: 2,
            margin: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ReusableText(
                      text: "${user.firstName}${user.lastName}",
                      style: context.textTheme.bodyMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    10.sbh,
                    ReusableText(
                      text: '23',
                      style: context.textTheme.bodyMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.location_on),
                    ReusableText(
                      text: 'woji GRA Phase 2 (0.4m)',
                      style:
                          appMStyle(16, AppColors.blackColor, FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class LoadingUserCard extends StatelessWidget {
  const LoadingUserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.red,
      highlightColor: Colors.yellow,
      child: Column(
        children: [
          Container(
            height: SizeOf.carouselBodyHeight,
            width: SizeOf.carouselBodyWidth,
            decoration: const BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(14)),
            ),
          ),
          Card(
            color: AppColors.whiteColor,
            elevation: 4,
            margin: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ReusableText(
                      text: "",
                      // style: appMStyle(18, AppColors.blackColor, FontWeight.w700),
                      style: context.textTheme.bodyLarge!.copyWith(
                          color: AppColors.blackColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700),
                    ),
                    20.sbw,
                    ReusableText(
                      text: '',
                      style: context.textTheme.bodyMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.location_on, color: AppColors.darkRed),
                    ReusableText(
                      text: '',
                      style: context.textTheme.bodyMedium!
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                    10.sbw,
                    ReusableText(
                      text: '',
                      style: context.textTheme.bodyMedium!
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ],
            ),
          ),
        
        ],
      ),
    );
  }
}
