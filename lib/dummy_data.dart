import 'package:flutter/material.dart';

import 'model.dart';

class FavoriteProvider extends ChangeNotifier {
  // list of apps
  List<App> apps = [];

  // constructor
  FavoriteProvider() {
    // generate dummy data

    List<Item> items = [
      Item(
      id: 0, 
      title: '1. US Daily Retail Delivery By Brands', 
      tileItem: [
        TileItem(
            topText: '2 hrs ago',
            middleText: '+/TRACK',
            bottomText: '% to DBJ'),
        TileItem(
            topText: 'CHEVROLET', middleText: '+1200', bottomText: '42.2%'),
        TileItem(
          topText: 'BUICK',
          middleText: '+300',
          bottomText: '50%',
        ),
        TileItem(topText: 'GMC', middleText: '-399', bottomText: '52.17%'),
      ]),
      
      Item(id: 1, title: '2. US Daily Retail Fleet Deliveries', tileItem: [
        TileItem(
            topText: '1 hrs ago',
            middleText: '+/TRACK',
            bottomText: '% to DBJ'),
        TileItem(topText: 'RETAIL', middleText: '-399', bottomText: '65.5%'),
        TileItem(
          topText: 'FLEET',
          middleText: '-140',
          bottomText: '93.3%',
        ),
        TileItem(topText: 'TOTAL', middleText: '-539', bottomText: '71.1%'),
      ]),
    ];

    List<Item> items2 = [
      Item(
        id: 0,
        title: 'I. US Daily Retail Delivery By Brands',
        tileItem: [
          TileItem(
              topText: '1 hrs ago',
              middleText: '+/TRACK',
              bottomText: '% to DBJ'),
          TileItem(topText: 'WI', middleText: '+1200', bottomText: '44.%'),
          TileItem(
            topText: 'SC',
            middleText: '+1200',
            bottomText: '64.4%',
          ),
          TileItem(topText: 'SE', middleText: '+49', bottomText: '57%'),
        ],
      )
    ];

    apps.add(App()
      ..name = "US SALES TRACKER"
      ..id = 1
      ..items = items.sublist(0));

    apps.add(App()
      ..name = "CADILLAC SALES"
      ..id = 2
      ..items = items2.sublist(0));
  }

  void updateList(List<App> apps) {
    this.apps = apps;
    notifyListeners();
  }
}
