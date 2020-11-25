import 'package:flutter/material.dart';
import 'package:maxis1/app_bar_title.dart';
import 'package:maxis1/dummy_data.dart';
import 'package:provider/provider.dart';

import './cardWidget.dart';
import './reorder.dart';
import 'model.dart';

class Favorite extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  var selectedValue = 0;
  var isLargeScreen = false;

  FavoriteProvider _provider;

  @override
  void didChangeDependencies() {
    _provider = Provider.of<FavoriteProvider>(context);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x000C17),
      appBar: AppBar(
        centerTitle: true,
        title: AppBarTitle(),
        actions: <Widget>[
          IconButton(
            icon: new Image.asset(
              'assets/icons/more-icons/edit.png',
              height: 24.0,
              width: 24,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ChangeNotifierProvider<FavoriteProvider>.value(
                    value: Provider.of<FavoriteProvider>(this.context,
                        listen: false),
                    child: ReorderPage(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        if (MediaQuery.of(context).size.width > 600) {
          isLargeScreen = true;
        } else {
          isLargeScreen = false;
        }
        return Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "My Favorites",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _provider.apps.length,
              padding: const EdgeInsets.all(16.0),
              itemBuilder: (context, i) {
                return _buildRow(_provider.apps[i]);
              },
            ),
          ),
          isLargeScreen
              ? Expanded(child: DetailWidget(selectedValue))
              : Container(),
        ]);
      }),
    );
  }

  Widget _buildRow(App app) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                app.name,
                style: TextStyle(color: Colors.white),
              ),
              if (app.items.length > 1)
                FlatButton(
                    child: Text(
                      app.showCards ? "Show Less" : "Show More",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      setState(() {
                        app.showCards = !app.showCards;
                      });
                    })
            ],
          ),
          AnimatedSwitcher(
            key: Key(app.name + "AnimatedSwitcher"),
            duration: const Duration(milliseconds: 200),
            child: app.showCards
                ? _buildExpandedCards(app)
                : _buildStackedCards(app),
          )
        ],
      ),
    );
  }

  Widget cascadeItems({int itemCount, List<Item> list}) {
    return Container(
      height: 200,
      child: Stack(
          children: list
              .sublist(0, list.length > 4 ? 4 : list.length)
              .reversed
              .map((e) {
        int index = list.indexOf(e);
        print(index * 5.0);
        print(e.title);
        return Positioned(
          left: (index * 5.0),
          right: (index * 5.0),
          top: (index * 5.0),
          child: Container(
            height: 153,
            child: SingleChildScrollView(
              child: CardWidget(
                title: e.title,
                tileItems: e.tileItem,
              ),
            ),
          ),
        );
      }).toList()),
    );
  }

  Widget _buildStackedCards(App app) {
    return cascadeItems(list: app.items);
  }

  _buildExpandedCards(App app) {
    return Column(
      key: Key(app.name + "Column"),
      children: app.items
          .map(
            (e) => GestureDetector(
              onTap: () {
                print(e.title);
              },
              child: Container(
                height: 180,
                child: SingleChildScrollView(
                  child: CardWidget(
                    title: e.title,
                    tileItems: e.tileItem,
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

class DetailWidget extends StatefulWidget {
  final int data;

  DetailWidget(this.data);

  @override
  _DetailWidgetState createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.data.toString(),
              style: TextStyle(fontSize: 36.0, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
