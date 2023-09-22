import 'package:dating_app/app/common/common.dart';
import 'package:dating_app/app/core/core.dart';
import 'package:flutter_svg/svg.dart';

import '../bloc/users_bloc.dart';
import '../cubit/bottom_navbar/bottom_navigation_cubit.dart';

part 'skeleton_view.dart';

class SkeletonScreen extends StatefulWidget {
  static const String route = '/features';
  static const String name = 'features';
  const SkeletonScreen({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  State<SkeletonScreen> createState() => SkeletonController();
}

class SkeletonController extends State<SkeletonScreen> {
  @override
  void initState() {
    super.initState();
    if (mounted) {
      context.read<FetchUserBloc>().add(FetchAllUserEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return _SkeletonView(this);
  }
}