import 'package:flutter/material.dart';
import '../queries/graphql_query.dart' as queries;
import '../widgets/loadingScreenWidget.dart';
import '../blocs/listProvider.dart';
import '../widgets/userListViewContainer.dart';
class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userBloc = ListProvider.of(context);
   /*  return StreamBuilder(
      stream: userBloc.listId,
      builder: (BuildContext context, AsyncSnapshot listIdSnapshot) {
          print(listIdSnapshot.data);x
          if (listIdSnapshot.data != null) {
          final listId = listIdSnapshot.data.toString();
          print(query); */
          return FutureBuilder(
              future: userBloc.post(queries.fetchUser('e9m17rkjn0w0dkq'),
                  variables: <String, dynamic>{'itemId': 'e9m17rkjn0w0dkq'}),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data != null) {
                    dynamic lists = snapshot.data['getUser'][0]['getLists'];
                    return Scaffold(
                        appBar: AppBar(
                          title: Text('List Overview'),
                          backgroundColor: Colors.white,
                          elevation: 2.0,
                        ),
                        body: ListView.builder(
                            padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 8.0),
                            itemCount: lists.length,
                            itemBuilder: (BuildContext context, int index) {
                                return UserListViewContainer(data: lists[index]);
                              }
                        ));}
                } else {
                  return LoadingScreenWidget();
                }
              });
/*         } else {
          return LoadingScreenWidget();
        } */
   //   },
//    );
  }
}
