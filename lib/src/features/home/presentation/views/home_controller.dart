part of '../home_barrel.dart';

class HomeScreen extends StatefulWidget {
  static const String path = '/home_view';
  static const String name = 'home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenController();
}

class HomeScreenController extends State<HomeScreen> {
  late TextEditingController searchController;

  String firstName = '';
  String lastName = '';
  String email = '';
  String profilePic = '';

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((pref) {
      setState(() {
        firstName = pref.getString('firstName') ?? '';
        lastName = pref.getString('lastName') ?? '';
        email = pref.getString('email') ?? '';
        profilePic = pref.getString('ProfilePicture') ?? '';
      });
    });
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void connectionSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
            height: 60.h,
            width: double.maxFinite,
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ReusableText(
                  text: 'Sorry, something went wrong',
                  style: appMStyle(16, kDark, FontWeight.w400),
                ),
                20.sbH,
                const Align(
                  alignment: Alignment.bottomRight,
                  child: Text('Dismiss'),
                )
              ],
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _HomeView(this);
  }
}
