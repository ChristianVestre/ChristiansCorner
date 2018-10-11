import 'package:flutter/material.dart';
import '../queries/graphql_query.dart' as queries;
import '../widgets/imageListPartContainer.dart';
import '../widgets/nestedListPartContainer.dart';
import '../widgets/loadingScreenWidget.dart';
import '../blocs/listProvider.dart';

class ListPage extends StatelessWidget {
  final graphqlQuery = queries.fetchList('si81z2ojmz7jfy1');
  @override
  Widget build(BuildContext context) {
    final listBloc = ListProvider.of(context);
    return StreamBuilder(
      stream: listBloc.listId,
      builder: (BuildContext context, AsyncSnapshot listIdSnapshot) {
    //    print(listIdSnapshot.data);x
        if (listIdSnapshot.data != null) {
          final listId = listIdSnapshot.data;
          print(listId);
          return FutureBuilder(
              future: listBloc.post(queries.fetchList(listId),
                  variables: <String, dynamic>{'itemId': listId}),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data != null) {
                    dynamic lists = snapshot.data['getList'][0]['getListParts'];
                    return Scaffold(
                        appBar: AppBar(
                          title: Text(snapshot.data['getList'][0]['name']),
                          backgroundColor: Colors.white,
                          elevation: 2.0,
                        ),
                        body: ListView.builder(
                            padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 8.0),
                            itemCount: lists.length,
                            itemBuilder: (BuildContext context, int index) {
                              switch(lists[index]['type']){
                                case ('NESTEDLIST'):
                                  return NestedListPartContainer(data: lists[index]);
                                case ('IMAGE'):
                                  return ImageListPartContainer(data: lists[index]);
                            //  return NestedListPartContainer(data: lists[index]);
                              }
                            }));
                  }
                } else {
                  return LoadingScreenWidget();
                }
              });
        } else {
          return LoadingScreenWidget();
        }
      },
    );
  }
}
