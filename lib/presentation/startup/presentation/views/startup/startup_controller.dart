import 'package:dating_app/app/common/common.dart';
import 'package:dating_app/app/core/core.dart';


part 'startup_screen.dart';

class StartupScreen extends StatefulWidget {
  static const String path = '/';
  static const String name = 'startup';
  const StartupScreen({super.key});

  @override
  State<StartupScreen> createState() => StartupController();
}

class StartupController extends State<StartupScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController =
      AnimationController(vsync: this, duration: Duration(seconds: 3));

  _startDelay() {
    _animationController
        .forward()
        .whenComplete(() => context.goNamed(LoginScreen.name));
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _StartupScreen(this);
  }
}
