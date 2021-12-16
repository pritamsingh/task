

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/api/services.dart';
import 'package:task/bloc/task/bloc.dart';
import 'package:task/bloc/task/events.dart';
import 'package:task/bloc/task/states.dart';
import 'package:task/bloc/theme/theme_bloc.dart';
import 'package:task/model/task_list.dart';
import 'package:task/settings/app_themes.dart';
import 'package:task/settings/preferences.dart';
import 'package:task/widgets/error.dart';
import 'package:task/widgets/list_row.dart';
import 'package:task/widgets/loading.dart';
import 'package:task/widgets/txt.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  //
  late TasksBloc bloc;
  String titleTxt = "";
  @override
  void initState() {
    super.initState();
    _loadTasks();
  }


  _loadTasks() async {
        bloc = BlocProvider.of<TasksBloc>(context);

    bloc.add(TaskEvents.fetchTasks);
  }

  // _setTheme(bool darkTheme) async {
  //   AppTheme selectedTheme =
  //       darkTheme ? AppTheme.lightTheme : AppTheme.darkTheme;
  //   Preferences.saveTheme(selectedTheme);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: Txt(text: titleTxt),
       
      ),
      body: Container(
        child: _body(),
      ),
    );
  }

  _body() {
    return Column(
      children: [
        BlocBuilder<TasksBloc, TasksState>(
            builder: (BuildContext context, TasksState state) {
          if (state is TasksListError) {
            final error = state.error;
            String message = '${error.message}\nTap to Retry.';
            return ErrorTxt(
              message: message,
              onTap: _loadTasks,
            );
          }
          if (state is TasksLoaded) {
            List<Rows> rows = state.rows;
            return _list(rows);
          }
          return Loading();
        }),
      ],
    );
  }

  Widget _list(List<Rows> Tasks) {
    return Expanded(
      child: ListView.builder(
        itemCount: Tasks.length,
        itemBuilder: (_, index) {
          Rows row = Tasks[index];
          return ListRow(row: row);
        },
      ),
    );
  }
}
