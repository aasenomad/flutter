import 'package:flutter/material.dart';
import 'package:maxis1/app_bar_title.dart';
import 'package:maxis1/expansion_widget.dart';
import 'package:maxis1/model.dart';
import 'package:maxis1/dummy_data.dart';
import 'package:provider/provider.dart';
import 'package:reorderables/reorderables.dart';

class ReorderPage extends StatefulWidget {
  @override
  _ReorderPageState createState() => _ReorderPageState();
}

class _ReorderPageState extends State<ReorderPage> {
  FavoriteProvider _provider;
  List<App> apps;

  @override
  void initState() {
    _provider = Provider.of<FavoriteProvider>(context, listen: false);
    apps = _provider.apps;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AppBarTitle(),
      ),
      body: Column(children: <Widget>[
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "My Favorites",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Image(
                        image:
                            ExactAssetImage('assets/icons/more-icons/edit.png'),
                        height: 24,
                        width: 24,
                      ),
                      Text(
                        " Reorder",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )),
          ],
        ),
        Expanded(child: reorderWidget())
      ]),
    );
  }

  Widget reorderWidget() {
    return ReorderableListView(
      onReorder: _onParentReorder,
      scrollDirection: Axis.vertical,
      children: List.generate(
        apps.length,
        (index) {
          App app = apps[index];

          return ExpansionWidget(
            key: ValueKey(app),
            headerBuilder: (BuildContext context, bool isExpanded) {
              return reorderChild(
                title: app.name,
                margin: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                leading: Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: Colors.white,
                  size: 40,
                ),
              );
            },
            body: ReorderableColumn(
              onReorder: (oldIndex, newIndex) {
                onReorderChild(app, oldIndex, newIndex);
              },
              scrollController: ScrollController(),
              children: List.generate(app.items.length, (childIndex) {
                Item item = app.items[childIndex];
                return reorderChild(
                    title: item.title,
                    margin: EdgeInsets.only(
                        left: 80, right: 20, top: 5, bottom: 5));
              }),
            ),
            initialExpanded: app.showCards,
          );
        },
      ),
    );
  }

  /// callback when the list of apps is reordered
  /// this is managed by the inbuilt [ReorderableListView]
  void _onParentReorder(int oldIndex, int newIndex) {
    setState(
      () {
        // update the position of item
        if (newIndex > oldIndex) {
          newIndex -= 1;
        }
        final App item = apps.removeAt(oldIndex);
        apps.insert(newIndex, item);

        // update data in provider
        _provider.updateList(apps);
      },
    );
  }

  /// callback when the items inside the app are reordered
  /// this is managed by the library [reorderables]
  void onReorderChild(App app, int oldIndex, int newIndex) {
    setState(
      () {
        final Item item = app.items.removeAt(oldIndex);
        app.items.insert(newIndex, item);

        // update data in provider
        _provider.updateList(apps);
      },
    );
  }

  Widget reorderChild({String title, EdgeInsets margin, Widget leading}) {
    return Container(
      key: ObjectKey(title),
      margin: margin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
          Expanded(
            child: Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
          ),
          if (leading != null) ...[
            SizedBox(width: 5),
            leading,
          ],
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFF132435),
      ),
      height: 50,
    );
  }
}
