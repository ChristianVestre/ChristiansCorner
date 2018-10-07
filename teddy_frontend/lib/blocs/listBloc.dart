import 'package:rxdart/rxdart.dart';
import 'dart:async';
import 'package:graphql_flutter/graphql_flutter.dart';

class ListBloc {
  Stream<String> get listId => _listId.stream;
  Sink<String> get listIdSink => _listId.sink;
  final _listId = BehaviorSubject<String>();
//  var listIdCache = [];

}