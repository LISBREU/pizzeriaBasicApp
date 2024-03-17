import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _favorites = prefs
              .getStringList('ff_favorites')
              ?.map((path) => path.ref)
              .toList() ??
          _favorites;
    });
    _safeInit(() {
      _cart = prefs
              .getStringList('ff_cart')
              ?.map((x) {
                try {
                  return CartStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _cart;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<DocumentReference> _favorites = [];
  List<DocumentReference> get favorites => _favorites;
  set favorites(List<DocumentReference> value) {
    _favorites = value;
    prefs.setStringList('ff_favorites', value.map((x) => x.path).toList());
  }

  void addToFavorites(DocumentReference value) {
    _favorites.add(value);
    prefs.setStringList('ff_favorites', _favorites.map((x) => x.path).toList());
  }

  void removeFromFavorites(DocumentReference value) {
    _favorites.remove(value);
    prefs.setStringList('ff_favorites', _favorites.map((x) => x.path).toList());
  }

  void removeAtIndexFromFavorites(int index) {
    _favorites.removeAt(index);
    prefs.setStringList('ff_favorites', _favorites.map((x) => x.path).toList());
  }

  void updateFavoritesAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _favorites[index] = updateFn(_favorites[index]);
    prefs.setStringList('ff_favorites', _favorites.map((x) => x.path).toList());
  }

  void insertAtIndexInFavorites(int index, DocumentReference value) {
    _favorites.insert(index, value);
    prefs.setStringList('ff_favorites', _favorites.map((x) => x.path).toList());
  }

  List<CartStruct> _cart = [];
  List<CartStruct> get cart => _cart;
  set cart(List<CartStruct> value) {
    _cart = value;
    prefs.setStringList('ff_cart', value.map((x) => x.serialize()).toList());
  }

  void addToCart(CartStruct value) {
    _cart.add(value);
    prefs.setStringList('ff_cart', _cart.map((x) => x.serialize()).toList());
  }

  void removeFromCart(CartStruct value) {
    _cart.remove(value);
    prefs.setStringList('ff_cart', _cart.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCart(int index) {
    _cart.removeAt(index);
    prefs.setStringList('ff_cart', _cart.map((x) => x.serialize()).toList());
  }

  void updateCartAtIndex(
    int index,
    CartStruct Function(CartStruct) updateFn,
  ) {
    _cart[index] = updateFn(_cart[index]);
    prefs.setStringList('ff_cart', _cart.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInCart(int index, CartStruct value) {
    _cart.insert(index, value);
    prefs.setStringList('ff_cart', _cart.map((x) => x.serialize()).toList());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
