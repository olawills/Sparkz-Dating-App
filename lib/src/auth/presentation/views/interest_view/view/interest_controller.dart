part of '../barrels.dart';

class InterestScreen extends StatefulWidget {
  static const String path = '/interest';
  static const String name = 'interest';
  const InterestScreen({super.key});

  @override
  State<InterestScreen> createState() => InterestController();
}

class InterestController extends State<InterestScreen> {
  String gender = '';
  String about = '';
  String email = '';

  bool clickedMulti = false;
  List<String> selectTedList = [];

  selectedItems(String selecteditem) {
    if (selectTedList.contains(selecteditem)) {
      selectTedList.remove(selecteditem);
    } else {
      selectTedList.add(selecteditem);
    }
    if (selectTedList.isEmpty) {
      clickedMulti = false;
    }
    setState(() {});
  }

  selectedInterest() async {
    await LocalDataStorage.instance.setListInterest(selectTedList);
    Log.debug(selectTedList);
  }

  saveInfo() {
    if (selectTedList != []) {
      context.read<InterestBloc>().add(CreateUserProfile(
            email: email,
            gender: gender,
            about: about,
            interests: selectTedList,
          ));
      Log.debug(selectTedList);
    }
    Log.debug(selectTedList);
  }

  saveInfoSuccess() async {
    context.goNamed(HomeScreen.name);
  }

  saveInfoError(String error) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Container(
        height: 60.h,
        width: double.maxFinite,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: kLight,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ReusableText(
          text: error,
          style: appMStyle(16, kDark, FontWeight.w400),
        ),
      ),
    ));
  }

  backPage() {
    context.pop();
  }

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((pref) {
      setState(() {
        gender = pref.getString('gender') ?? '';
        about = pref.getString('about') ?? '';
        email = pref.getString('email') ?? '';
      });
      Log.debug(email);
      Log.debug(gender);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _InterestView(this);
  }
}
