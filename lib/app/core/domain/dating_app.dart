import 'package:dating_app/app/common/common.dart';
import 'package:dating_app/app/core/core.dart';
import 'package:dating_app/app/core/routes/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SparkzConfig extends StatefulWidget {
  const SparkzConfig({super.key});

  @override
  State<SparkzConfig> createState() => _SparkzConfigState();
}

class _SparkzConfigState extends State<SparkzConfig> {
  @override
  void initState() {
    super.initState();

    // ** Initialize Push Notifications
    // FirebasePushNotificationServce.getDeviceToken();
    // FirebasePushNotificationServce.requestPermission();
    // FirebasePushNotificationServce.initializeNotification();
    // AwesomeNotifications().requestPermissionToSendNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //remove keyboard on touching anywhere on the screen.
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: kAppName,
            routerConfig: AppRouter.routerConfig,
            // home: const OnboardingScreen(),
          );
        },
      ),
    );
  }
}
