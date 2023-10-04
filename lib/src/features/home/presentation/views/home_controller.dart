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

  Future<void> onRefresh() async {
    return Future.delayed(const Duration(seconds: 2), () {
      context.read<FetchUserBloc>().add(FetchAllUserEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return _HomeView(this);
  }
}
