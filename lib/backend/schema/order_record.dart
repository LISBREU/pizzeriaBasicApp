import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrderRecord extends FirestoreRecord {
  OrderRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "numOrder" field.
  int? _numOrder;
  int get numOrder => _numOrder ?? 0;
  bool hasNumOrder() => _numOrder != null;

  // "userCreate" field.
  DocumentReference? _userCreate;
  DocumentReference? get userCreate => _userCreate;
  bool hasUserCreate() => _userCreate != null;

  // "createDate" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

  // "cart" field.
  List<CartStruct>? _cart;
  List<CartStruct> get cart => _cart ?? const [];
  bool hasCart() => _cart != null;

  // "street" field.
  String? _street;
  String get street => _street ?? '';
  bool hasStreet() => _street != null;

  // "home" field.
  String? _home;
  String get home => _home ?? '';
  bool hasHome() => _home != null;

  // "apart" field.
  String? _apart;
  String get apart => _apart ?? '';
  bool hasApart() => _apart != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  bool hasPhone() => _phone != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "typePay" field.
  String? _typePay;
  String get typePay => _typePay ?? '';
  bool hasTypePay() => _typePay != null;

  void _initializeFields() {
    _numOrder = castToType<int>(snapshotData['numOrder']);
    _userCreate = snapshotData['userCreate'] as DocumentReference?;
    _createDate = snapshotData['createDate'] as DateTime?;
    _cart = getStructList(
      snapshotData['cart'],
      CartStruct.fromMap,
    );
    _street = snapshotData['street'] as String?;
    _home = snapshotData['home'] as String?;
    _apart = snapshotData['apart'] as String?;
    _phone = snapshotData['phone'] as String?;
    _comment = snapshotData['comment'] as String?;
    _typePay = snapshotData['typePay'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('order');

  static Stream<OrderRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrderRecord.fromSnapshot(s));

  static Future<OrderRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrderRecord.fromSnapshot(s));

  static OrderRecord fromSnapshot(DocumentSnapshot snapshot) => OrderRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrderRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrderRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrderRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrderRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrderRecordData({
  int? numOrder,
  DocumentReference? userCreate,
  DateTime? createDate,
  String? street,
  String? home,
  String? apart,
  String? phone,
  String? comment,
  String? typePay,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'numOrder': numOrder,
      'userCreate': userCreate,
      'createDate': createDate,
      'street': street,
      'home': home,
      'apart': apart,
      'phone': phone,
      'comment': comment,
      'typePay': typePay,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrderRecordDocumentEquality implements Equality<OrderRecord> {
  const OrderRecordDocumentEquality();

  @override
  bool equals(OrderRecord? e1, OrderRecord? e2) {
    const listEquality = ListEquality();
    return e1?.numOrder == e2?.numOrder &&
        e1?.userCreate == e2?.userCreate &&
        e1?.createDate == e2?.createDate &&
        listEquality.equals(e1?.cart, e2?.cart) &&
        e1?.street == e2?.street &&
        e1?.home == e2?.home &&
        e1?.apart == e2?.apart &&
        e1?.phone == e2?.phone &&
        e1?.comment == e2?.comment &&
        e1?.typePay == e2?.typePay;
  }

  @override
  int hash(OrderRecord? e) => const ListEquality().hash([
        e?.numOrder,
        e?.userCreate,
        e?.createDate,
        e?.cart,
        e?.street,
        e?.home,
        e?.apart,
        e?.phone,
        e?.comment,
        e?.typePay
      ]);

  @override
  bool isValidKey(Object? o) => o is OrderRecord;
}
