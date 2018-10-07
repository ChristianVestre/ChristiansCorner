import 'package:flutter/widgets.dart';
import './listBloc.dart';

class ListProvider extends InheritedWidget {
  final ListBloc listBloc;

  ListProvider({
    Key key,
    ListBloc listBloc,
    Widget child,
  })  : listBloc = listBloc ?? ListBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static ListBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(ListProvider) as ListProvider)
          .listBloc;
}