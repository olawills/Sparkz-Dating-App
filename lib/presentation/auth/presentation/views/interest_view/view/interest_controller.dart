part of '../barrels.dart';

class InterestScreen extends StatefulWidget {
  static const String path = '/interest';
  static const String name = 'interest';
  const InterestScreen({super.key});

  @override
  State<InterestScreen> createState() => InterestController();
}

class InterestController extends State<InterestScreen> {
  bool _selectedIcon = false;
  List<String> interest = [];
  backPage() {
    context.pop();
  }

  navigateToNextScreen() {
    context.goNamed(HomeScreen.name);
  }

  bool get selectedIcon => _selectedIcon;

  set selectInterest(bool selectedIcon) {
    setState(() {
      _selectedIcon = selectedIcon;
    });
  }

  selectedInterest() async {
    await LocalDataStorage.instance.setInterest(interest);
    Log.debug(interest);
  }

  @override
  Widget build(BuildContext context) {
    return _InterestView(this);
  }
}
