import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:task/model/task_list.dart';

abstract class TasksRepo {
  Future<List<Rows>> getTaskList();
}

class TaskServices implements TasksRepo {
  //
  static const _url = 'https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json';

  @override
  Future<List<Rows>> getTaskList() async {
    var uri = Uri.parse(_url);

    Response response = await http.get(uri);
      var data = json.decode(response.body);

    List<Rows> rows = RowsFromJson(data["rows"]);
    return rows;
  }
}
