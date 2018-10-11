import 'package:flutter/material.dart';
import '../blocs/listProvider.dart';


class NestedListPartContainer extends StatelessWidget {
  NestedListPartContainer({Key key, this.data}) : super(key: key);
  final Map data;
  Widget build(BuildContext context) {
    final listBloc = ListProvider.of(context);
    return Container(
        child: Column(children: [
          InkWell(
            onTap:((){
      //        listBloc.listIdSink.add(data['listParentId']);
     //        Navigator.of(context).pushNamed("/pageList");
             listBloc.listIdSink.add(data['listid']);
            }),
            child:Container(
            child: Text(
              data['part_name'],
              textScaleFactor: 1.6,
            ),
          ),),
          Stack(
            children: [
          Container(child:Center(child: CircularProgressIndicator(backgroundColor: Colors.purple,valueColor:AlwaysStoppedAnimation<Color>(Colors.purple),)
          ),
            width: double.infinity,
            height: 360.0,
            margin: EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
          ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill, image: NetworkImage(data['content_url']),
            )),
            width: double.infinity,
            height: 360.0,
            margin: EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
          )
          ]),
          Container(
            child: Text(data['content_text']),
            width: double.infinity,
            height: 80.0,
            margin: EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
          )
        ]),
        margin: EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 20.0),
        decoration: ShapeDecoration(
          color: Colors.white,
          shadows: [
            BoxShadow(color: Colors.purple, spreadRadius: 0.2, blurRadius: 0.5)
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2.0),
            side: BorderSide.none,
          ),
        ));
  }
}
