import 'package:dating_app/app/core/core.dart';
import 'package:dating_app/src/auth/data/models/user.dart';
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
          height: height * 0.08,
          width: double.maxFinite,
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
        Card(
          color: kLight,
          elevation: 2,
          margin: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ReusableText(
                    text: "${user.firstName}${user.lastName}",
                    style: appMStyle(16, kDark, FontWeight.bold),
                  ),
                  10.sbh,
                  ReusableText(
                    text: '23',
                    style: appMStyle(16, kDark, FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.location_on),
                  ReusableText(
                    text: 'woji GRA Phase 2 (0.4m)',
                    style: appMStyle(16, kDark, FontWeight.bold),
                  ),
                ],
              ),
            ],
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
            height: height * 1.2,
            width: double.maxFinite,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(14)),
            ),
          ),
          Card(
            color: kLight,
            elevation: 4,
            margin: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ReusableText(
                      text: "",
                      style: appMStyle(18, kDark, FontWeight.w700),
                    ),
                    20.sbw,
                    ReusableText(
                      text: '',
                      style: appMStyle(16, kDark, FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.location_on, color: kDarkRed),
                    ReusableText(
                      text: '',
                      style: appMStyle(16, kDark, FontWeight.w400),
                    ),
                    10.sbw,
                    ReusableText(
                      text: '',
                      style: appMStyle(16, kDark, FontWeight.w400),
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
