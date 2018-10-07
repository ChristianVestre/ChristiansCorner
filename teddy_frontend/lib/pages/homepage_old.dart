import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../queries/graphql_query.dart' as queries;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.white,
        ),
        body: Query(queries.fetchList('si81z2ojmrqcooo'), pollInterval: 5, builder: ({
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
              padding: new EdgeInsets.all(8.0),
              itemCount: lists.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    child: ListTile(
                      title: Center(child: Text(lists[index]['part_name'])),
                      subtitle: Center(
                          child: Image.network(lists[index]['content_url'],
                              fit: BoxFit.cover, width: 600.0, height: 240.0)),
                    ),
                    alignment: Alignment(0.0, 0.0),
                    padding: EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
                    margin: EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
                    decoration: ShapeDecoration(
                      color: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: BorderSide.none,
                      ),
                    ));
              });
        }));
  }
}
