import 'package:rxdart/rxdart.dart';
import 'dart:async';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../queries/graphql_query.dart' as queries;


class UserBloc {
  UserBloc ();

 //var _result = {}

  Future<dynamic> post(
    String body, {
    Map<String, dynamic> variables,
  }) async {
    final Client client = Client(
      endPoint: 'http://192.168.179.27:4000/',
      cache: new InMemoryCache(),
    );

    final Future<Map<String, dynamic>> result =
        client.query(query: body, variables: variables);
    return result;
  }

  Stream<String> get userId => _userId.stream;
  Sink<String> get userIdSink => _userId.sink;
//  Stream<Map<String,dynamic>> get listData => _listData.stream;


 // final _listData = BehaviorSubject<Map<String,dynamic>>();
  final _userId = BehaviorSubject<String>();

//  var listIdCache = [];

}