

import 'package:dating_app/app/common/common.dart';
import 'package:dating_app/app/core/core.dart';
import 'package:flutter_svg/svg.dart';

import '../cubit/bottom_navbar/bottom_navigation_cubit.dart';

part 'features_view.dart';

class FeaturesScreen extends StatefulWidget {
  static const String route = '/features';
  static const String name = 'features';
  const FeaturesScreen({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  State<FeaturesScreen> createState() => FeaturesController();
}

class FeaturesController extends State<FeaturesScreen> {
  @override
  Widget build(BuildContext context) {
    return _FeaturesView(this);
  }
}
