import 'package:flutter/material.dart';
import '../blocs/listProvider.dart';


class UserListViewContainer extends StatelessWidget {
  UserListViewContainer({Key key, this.data}) : super(key: key);
  

  final Map data;
  Widget build(BuildContext context) {
    final listBloc = ListProvider.of(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/listpage');
        listBloc.listIdSink.add(data['id']);
      },
      child:ListTile(
      leading: Icon(Icons.list),
      title: Text(data['name']),
     ));

    
  }
}
