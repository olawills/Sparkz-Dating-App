import 'package:dating_app/app/core/config/injection_container.dart';
import 'package:dating_app/app/core/core.dart';
import 'package:dating_app/bloc_observers.dart';
import 'package:dating_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:logging/logging.dart';

import 'app/core/domain/all_blocs.dart';
import 'app/core/domain/sparkz_config.dart';
import 'app/core/network/dio_helper.dart';
import 'localization/localization.dart';

// Future<void> _fiebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   debugPrint("Handling background message:${message.messageId}");
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await FirebaseMessaging.instance.getInitialMessage();
  // FirebaseMessaging.onBackgroundMessage(_fiebaseMessagingBackgroundHandler);
  _setupLogging();
  await EasyLocalization.ensureInitialized();

  // Logger.level = Level.error;
  Bloc.observer = AppBlocObserver();
  DioHelper.init();
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

_setupLogging() {
  Logger.root.level = Level.WARNING;
  Logger.root.onRecord.listen((record) {
    debugPrint('${record.level.name}: ${record.time}: ${record.message}');
  });
}
