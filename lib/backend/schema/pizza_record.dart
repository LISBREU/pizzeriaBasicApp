import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PizzaRecord extends FirestoreRecord {
  PizzaRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  bool hasPrice() => _price != null;

  // "img" field.
  String? _img;
  String get img => _img ?? '';
  bool hasImg() => _img != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _price = castToType<int>(snapshotData['price']);
    _img = snapshotData['img'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pizza');

  static Stream<PizzaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PizzaRecord.fromSnapshot(s));

  static Future<PizzaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PizzaRecord.fromSnapshot(s));

  static PizzaRecord fromSnapshot(DocumentSnapshot snapshot) => PizzaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PizzaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PizzaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PizzaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PizzaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPizzaRecordData({
  String? name,
  String? description,
  int? price,
  String? img,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'price': price,
      'img': img,
    }.withoutNulls,
  );

  return firestoreData;
}

class PizzaRecordDocumentEquality implements Equality<PizzaRecord> {
  const PizzaRecordDocumentEquality();

  @override
  bool equals(PizzaRecord? e1, PizzaRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.price == e2?.price &&
        e1?.img == e2?.img;
  }

  @override
  int hash(PizzaRecord? e) =>
      const ListEquality().hash([e?.name, e?.description, e?.price, e?.img]);

  @override
  bool isValidKey(Object? o) => o is PizzaRecord;
}
