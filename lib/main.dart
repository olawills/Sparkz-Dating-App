import 'package:dating_app/app/core/config/injection_container.dart';
import 'package:dating_app/app/core/core.dart';
import 'package:dating_app/bloc_observers.dart';
import 'package:dating_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:logger/logger.dart';

import 'app/core/domain/all_blocs.dart';
import 'app/core/domain/dating_app.dart';
import 'localization/localization.dart';

// Future<void> _fiebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   debugPrint("Handling background message:${message.messageId}");
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await FirebaseMessaging.instance.getInitialMessage();
  // FirebaseMessaging.onBackgroundMessage(_fiebaseMessagingBackgroundHandler);
  await EasyLocalization.ensureInitialized();

  Logger.level = Level.error;
  Bloc.observer = AppBlocObserver();
  ServiceLocator.init();
  runApp(
    initializeLocation(
      child: MultiBlocProvider(
        providers: AppBlocProviders.allBlocProviders,
        child: const SparkzConfig(),
      ),
    ),
  );
}
