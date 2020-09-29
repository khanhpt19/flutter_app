import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/simple_bloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dependency_injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.configure(di.Env.prod);
  Bloc.observer = SimpleBlocObserver();
  runApp(AppBootStart());
}
