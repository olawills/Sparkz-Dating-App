import 'package:dating_app/app/core/core.dart';
import 'package:dating_app/bloc_observers.dart';
import 'package:dating_app/injection_container.dart';
import 'package:firebase_core/firebase_core.dart';

import 'app/core/domain/all_blocs.dart';
import 'app/core/domain/dating_app.dart';
import 'app/core/services/push_notification.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // ** Initialize Push Notifications
  FirebasePushNotificationServce.init();

  Bloc.observer = AppBlocObserver();

  ServiceLocator.init();
  runApp(
    MultiBlocProvider(
      providers: AppBlocProviders.allBlocProviders,
      child: const SparkzConfig(),
    ),
  );
}
