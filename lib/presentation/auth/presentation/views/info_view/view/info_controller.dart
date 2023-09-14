part of '../barrels.dart';

class InfoScreen extends StatefulWidget {
  static const String path = '/info';
  static const String name = 'info';
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => InfoController();
}

class InfoController extends State<InfoScreen> {
  bool isLoading = true;
  bool _initialColor = false;
  String selectedGender = '';

  backPage() {
    context.pop();
  }

  navigateToNextScreen() {
    context.pushNamed(InterestScreen.name);
  }

  bool get initialColor => _initialColor;

  set setGender(bool initialColor) {
    _initialColor = initialColor;
    setState(() {});
  }

  saveGenderInfo(String selectedGender) async {
    setState(() {
      selectedGender = selectedGender; // Update the selected gender
    });

    await LocalDataStorage.instance.setGender(selectedGender);
    Log.debug(selectedGender);
    print('1');
  }

  // setGender() async {

  //     setState(() {
  //       initialColor = true;
  //       Log.debug('True');

  //       // selectedGender = selectedGender;
  //     });

  //   await LocalDataStorage.instance.setGender(selectedGender);
  //   Log.debug(selectedGender);
  // }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _InforView(this);
  }
}
