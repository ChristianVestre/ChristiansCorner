import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../queries/graphql_query.dart' as queries;
import '../widgets/imagePartContainer.dart';
import '../blocs/listProvider.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final listBloc = ListProvider.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('whatever'),
          backgroundColor: Colors.white,
          elevation: 2.0,
        ),
        body: StreamBuilder<String>(
            stream: listBloc.listId,
            builder: (context, snapshot) {
              final graphqlQuery = queries.fetchList(snapshot.data);
              print(graphqlQuery);
              if(snapshot.data == null){
                return Text('Loading');
              } 
              return Query(graphqlQuery, pollInterval: 1, builder: ({
                bool loading,
                Map data,
                Exception error,
              }) {
                if (error != null) {
                  return Text(error.toString());
                }
                if (loading) {
                  return Text('Loading');
                }
                List lists = data['getList'][0]['getListParts'];
                return ListView.builder(
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 8.0),
                    itemCount: lists.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ImagedPartContainer(data: lists[index]);
                    });
              });
            }));
  }
}
