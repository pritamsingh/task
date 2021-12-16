

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:task/model/task_list.dart';
import 'package:task/widgets/txt.dart';

class ListRow extends StatelessWidget {
  //
  final Rows row;
  ListRow({required this.row});

  @override
  Widget build(BuildContext context) {
    return Container(
     margin: EdgeInsets.only(left: 20, top:10, right: 20, bottom:0),
      // padding: EdgeInsets.all(10.0),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
         children: [
           Center(child:
           SizedBox(
             height: 30,width:30,
             child:  Image.network(
              row.imageHref,
              height: 100,
              width: 150
            )
           )),
           SizedBox(width: 10,),
          Expanded(
            child:
  

Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (row.title.isNotEmpty)
             Txt(text: row.title),
        
          if (row.title.isNotEmpty)
            Description(text: row.description),
          Divider(),
        ],
      ),
          )],
      ) 
    );
  }
}
