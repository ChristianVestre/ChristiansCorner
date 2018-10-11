import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../queries/graphql_query.dart' as queries;
import '../widgets/imageListPartContainer.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  
  final String title;
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 // final listBloc = 
  final graphqlQuery =  queries.fetchList('si81z2ojmrqcooo');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.white,
          elevation: 2.0,
        ),
        body: Query(graphqlQuery, pollInterval: 1, builder: ({
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
        //        print(lists[index]['part_name']);
                return ImageListPartContainer(data:lists[index]);
                /* GestureDetector(
                  onTap: () {

                  },
                  child:Container(
                          child: Column(children: [
                        Container(
                          child: Text(lists[index]['part_name'],textScaleFactor: 1.6,),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(lists[index]['content_url'])),
                          ),
                          width: double.infinity,
                          height: 360.0,
                          margin: EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
                        ),
                        Container(
                          child: Text(lists[index]['content_text']),
                          width: double.infinity,
                          height: 80.0,
                          margin: EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
                        )
                      ]),
                      margin: EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 20.0),
                      decoration:ShapeDecoration(
                            color: Colors.white,
                            shadows: [
                              BoxShadow(color: Colors.purple, spreadRadius:0.2, blurRadius: 0.5 )
                            ],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.0),
                              side: BorderSide.none,
                            ),
                ))); */
              });
        }));
  }
}
