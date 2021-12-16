// @dart=2.9

import 'package:equatable/equatable.dart';

enum TaskEvents {
  fetchTasks,
}



abstract class ArticleEvent extends Equatable{}

class FetchArticlesEvent extends ArticleEvent {
  @override
  // TODO: implement props
  List<Object> get props => null;
}