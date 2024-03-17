// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CartStruct extends FFFirebaseStruct {
  CartStruct({
    DocumentReference? pizza,
    int? price,
    int? quantity,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _pizza = pizza,
        _price = price,
        _quantity = quantity,
        super(firestoreUtilData);

  // "pizza" field.
  DocumentReference? _pizza;
  DocumentReference? get pizza => _pizza;
  set pizza(DocumentReference? val) => _pizza = val;
  bool hasPizza() => _pizza != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  set price(int? val) => _price = val;
  void incrementPrice(int amount) => _price = price + amount;
  bool hasPrice() => _price != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  set quantity(int? val) => _quantity = val;
  void incrementQuantity(int amount) => _quantity = quantity + amount;
  bool hasQuantity() => _quantity != null;

  static CartStruct fromMap(Map<String, dynamic> data) => CartStruct(
        pizza: data['pizza'] as DocumentReference?,
        price: castToType<int>(data['price']),
        quantity: castToType<int>(data['quantity']),
      );

  static CartStruct? maybeFromMap(dynamic data) =>
      data is Map ? CartStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'pizza': _pizza,
        'price': _price,
        'quantity': _quantity,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'pizza': serializeParam(
          _pizza,
          ParamType.DocumentReference,
        ),
        'price': serializeParam(
          _price,
          ParamType.int,
        ),
        'quantity': serializeParam(
          _quantity,
          ParamType.int,
        ),
      }.withoutNulls;

  static CartStruct fromSerializableMap(Map<String, dynamic> data) =>
      CartStruct(
        pizza: deserializeParam(
          data['pizza'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['pizza'],
        ),
        price: deserializeParam(
          data['price'],
          ParamType.int,
          false,
        ),
        quantity: deserializeParam(
          data['quantity'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'CartStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CartStruct &&
        pizza == other.pizza &&
        price == other.price &&
        quantity == other.quantity;
  }

  @override
  int get hashCode => const ListEquality().hash([pizza, price, quantity]);
}

CartStruct createCartStruct({
  DocumentReference? pizza,
  int? price,
  int? quantity,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CartStruct(
      pizza: pizza,
      price: price,
      quantity: quantity,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CartStruct? updateCartStruct(
  CartStruct? cart, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    cart
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCartStructData(
  Map<String, dynamic> firestoreData,
  CartStruct? cart,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (cart == null) {
    return;
  }
  if (cart.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && cart.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final cartData = getCartFirestoreData(cart, forFieldValue);
  final nestedData = cartData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = cart.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCartFirestoreData(
  CartStruct? cart, [
  bool forFieldValue = false,
]) {
  if (cart == null) {
    return {};
  }
  final firestoreData = mapToFirestore(cart.toMap());

  // Add any Firestore field values
  cart.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCartListFirestoreData(
  List<CartStruct>? carts,
) =>
    carts?.map((e) => getCartFirestoreData(e, true)).toList() ?? [];
