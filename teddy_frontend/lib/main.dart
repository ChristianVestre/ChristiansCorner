import 'package:flutter/material.dart';
import './pages/listpage.dart';
import './blocs/listBloc.dart';
import './blocs/listProvider.dart';
import './blocs/userBloc.dart';
import './blocs/userProvider.dart';
import './pages/userpage.dart';


void main() {
  final listBloc = ListBloc();
  final userBloc = UserBloc();
//  listBloc.listIdSink.add('si81z2ojmrqcooo');
  listBloc.listIdSink.add('si81z2ojmz7jfy1');
  userBloc.userIdSink.add('e9m17rkjn0w0dkq');
  runApp(MyApp(listBloc,userBloc));
}

class MyApp extends StatelessWidget {
  final ListBloc listBloc;
  final UserBloc userBloc;
  @override
  MyApp(this.listBloc,this.userBloc);

  Widget build(BuildContext context) {
    return UserProvider(
      userBloc: userBloc,
      child: ListProvider(
      listBloc: listBloc,
            child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.grey,
          ),
          home: UserPage(),
          routes: {
            "/listpage":(context) => ListPage()
            }
        ),
      ),
    );
  }
}
