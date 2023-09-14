import 'package:dating_app/app/core/core.dart';
import 'package:dating_app/bloc_observers.dart';
import 'package:dating_app/injection_container.dart';

import 'app/core/domain/all_blocs.dart';
import 'app/core/domain/dating_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();

  ServiceLocator.init();
  runApp(
    MultiBlocProvider(
      providers: AppBlocProviders.allBlocProviders,
      child: SparkzConfig(),
    ),
  );
}
