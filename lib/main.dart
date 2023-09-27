import 'package:dating_app/app/core/core.dart';
import 'package:dating_app/bloc_observers.dart';
import 'package:dating_app/firebase_options.dart';
import 'package:dating_app/injection_container.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'app/core/domain/all_blocs.dart';
import 'app/core/domain/dating_app.dart';

Future<void> _fiebaseMessagingBackgroundHandler(RemoteMessage message) async {
  debugPrint("Handling background message:${message.messageId}");
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseMessaging.instance.getInitialMessage();
  FirebaseMessaging.onBackgroundMessage(_fiebaseMessagingBackgroundHandler);

  Bloc.observer = AppBlocObserver();
  ServiceLocator.init();
  runApp(
    MultiBlocProvider(
      providers: AppBlocProviders.allBlocProviders,
      child: const SparkzConfig(),
    ),
  );
}
