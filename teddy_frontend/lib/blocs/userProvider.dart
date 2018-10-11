import 'package:flutter/widgets.dart';
import './userBloc.dart';

class UserProvider extends InheritedWidget {
  final UserBloc userBloc;

  UserProvider({
    Key key,
    UserBloc userBloc,
    Widget child,
  })  : userBloc = userBloc ?? UserBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static UserBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(UserProvider) as UserProvider)
          .userBloc;
}