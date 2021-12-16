import 'package:equatable/equatable.dart';
import 'package:task/model/task_list.dart';

abstract class TasksState extends Equatable {
  @override
  List<Object> get props => [];
}

class TasksInitState extends TasksState {}

class TasksLoading extends TasksState {}

class TasksLoaded extends TasksState {
  final List<Rows> rows;
  TasksLoaded({required this.rows});
}

class TasksListError extends TasksState {
  final error;
  TasksListError({this.error});
}
