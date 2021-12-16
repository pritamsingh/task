// event, state => new state => update UI.
// @dart=2.9

import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/api/exceptions.dart';
import 'package:task/api/services.dart';
import 'package:task/api/services.dart';
import 'package:task/bloc/task/events.dart';
import 'package:task/bloc/task/states.dart';
import 'package:task/model/task_list.dart';


class TasksBloc extends Bloc<TaskEvents, TasksState> {
  //
  final TasksRepo tasksRepo;
  List<Rows> rows;

  TasksBloc({this.tasksRepo}) : super(TasksInitState());

  @override
  Stream<TasksState> mapEventToState(TaskEvents event) async* {
    switch (event) {
      case TaskEvents.fetchTasks:
        yield TasksLoading();
        try {
          rows = await tasksRepo.getTaskList();
          yield TasksLoaded(rows: rows);
        } on SocketException {
          yield TasksListError(
            error: NoInternetException('No Internet'),
          );
        } on HttpException {
          yield TasksListError(
            error: NoServiceFoundException('No Service Found'),
          );
        } on FormatException {
          yield TasksListError(
            error: InvalidFormatException('Invalid Response format'),
          );
        } catch (e) {
          yield TasksListError(
            error: UnknownException('Unknown Error'),
          );
        }

        break;
    }
  }
}
