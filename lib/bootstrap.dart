import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:notimee_flutter_todos/app/app.dart';
import 'package:todos_repository/todos_repository.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

void bootstrap({required TodosApi todosApi}) {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  final todosRepository = TodosRepository(todosApi: todosApi);

  runZonedGuarded(
    () => runApp(App(todosRepository: todosRepository)),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
