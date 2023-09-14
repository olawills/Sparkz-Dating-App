import 'dart:io';

import 'package:dating_app/app/common/constants/color_style.dart';

import '../../core/core.dart';

class UserDisplayPicture extends StatelessWidget {
  final Function()? onTap;
  final String imageUrl;
  const UserDisplayPicture({super.key, this.onTap, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 20,
        backgroundColor: Color(kDarkRed.value),
        child: CircleAvatar(
          radius: 18,
          backgroundImage: FileImage(File(imageUrl)),
        ),
      ),
    );
  }
}
