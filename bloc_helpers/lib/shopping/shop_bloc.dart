import 'dart:math';
import 'dart:ui';

import 'package:bloc_helpers/bloc_helpers/bloc_base.dart';
import 'package:bloc_helpers/shopping/shop_item.dart';
import 'package:rxdart/rxdart.dart';

class ShopBloc implements BlocBase {
  Set<ShopItem> _basket = Set<ShopItem>();

  BehaviorSubject<List<ShopItem>> _itemController =
      BehaviorSubject<List<ShopItem>>();
  Stream<List<ShopItem>> get items => _itemController;

  BehaviorSubject<List<ShopItem>> _basketController =
      BehaviorSubject<List<ShopItem>>();
  Stream<List<ShopItem>> get basketItems => _basketController;


  @override
  void dispose() {
    // TODO: implement dispose
    _itemController?.close();
    _basketController?.close();
  }

  ShopBloc() {
    _loadShopItems();
  }

  void _loadShopItems() {
    
  }

  void addToBasket(ShopItem item) {
    _basket.add(item);
    _postActionOnBasket();
  }

  void _postActionOnBasket() {
    _basketController.sink.add(_basket.toList());
  }

  void removeFromBasket(ShopItem item) {
    _basket.remove(item);
    _postActionOnBasket();
  }

  void loadShopItems() {
    _itemController.sink.add(List<ShopItem>.generate(50, (int index) {
      return ShopItem(
        id: index,
        title: "Item $index",
        price: ((Random().nextDouble() * 40.0 + 10.0) * 100.0).roundToDouble() /
            100.0,
        color: Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0)
            .withOpacity(1.0),
      );
    }));
  }
  }
}
