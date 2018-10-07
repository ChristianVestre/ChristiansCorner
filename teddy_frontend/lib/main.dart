import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import './pages/homepage.dart';
import './pages/listpage.dart';
import './blocs/listBloc.dart';
import './blocs/listProvider.dart';

void main() {
  final listBloc = ListBloc();
  listBloc.listIdSink.add('si81z2ojmrqcooo');
  runApp(MyApp(listBloc));
}

class MyApp extends StatelessWidget {
  final ListBloc listBloc;
  @override
  MyApp(this.listBloc);

  Widget build(BuildContext context) {
    ValueNotifier<Client> client = ValueNotifier(
      Client(
        endPoint: 'http://192.168.179.27:4000/',
        cache: InMemoryCache(),
      ),
    );
    return ListProvider(
      listBloc: listBloc,
      child: GraphqlProvider(
        client: client,
        child: CacheProvider(
            child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.grey,
          ),
          home: ListPage(),
   //       home: MyHomePage(title: 'Teddy Frontend',),
   //          home: ListPageFourteen(),
        )),
      ),
    );
  }
}
