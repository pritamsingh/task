// @dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/api/services.dart';
import 'package:task/bloc/theme/theme_bloc.dart';
import 'package:task/bloc/theme/theme_state.dart';
import 'package:task/screens/task_screen.dart';
import 'package:task/settings/preferences.dart';

import 'bloc/task/bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (BuildContext context, ThemeState themeState) {
          return MaterialApp(
            title: '',
            debugShowCheckedModeBanner: false,
            theme: themeState.themeData,
            home: BlocProvider(
              create: (context) => TasksBloc(tasksRepo: TaskServices()),
              child: TasksScreen(),
            ),
          );
        },
      ),
    );
  }
}
