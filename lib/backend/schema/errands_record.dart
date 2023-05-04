import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'errands_record.g.dart';

abstract class ErrandsRecord
    implements Built<ErrandsRecord, ErrandsRecordBuilder> {
  static Serializer<ErrandsRecord> get serializer => _$errandsRecordSerializer;

  LatLng? get location;

  String? get address;

  DocumentReference? get userRef;

  @BuiltValueField(wireName: 'errand_name')
  String? get errandName;

  @BuiltValueField(wireName: 'employee_location')
  LatLng? get employeeLocation;

  bool? get isConfirmed;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ErrandsRecordBuilder builder) => builder
    ..address = ''
    ..errandName = ''
    ..isConfirmed = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('errands');

  static Stream<ErrandsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ErrandsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ErrandsRecord._();
  factory ErrandsRecord([void Function(ErrandsRecordBuilder) updates]) =
      _$ErrandsRecord;

  static ErrandsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createErrandsRecordData({
  LatLng? location,
  String? address,
  DocumentReference? userRef,
  String? errandName,
  LatLng? employeeLocation,
  bool? isConfirmed,
}) {
  final firestoreData = serializers.toFirestore(
    ErrandsRecord.serializer,
    ErrandsRecord(
      (e) => e
        ..location = location
        ..address = address
        ..userRef = userRef
        ..errandName = errandName
        ..employeeLocation = employeeLocation
        ..isConfirmed = isConfirmed,
    ),
  );

  return firestoreData;
}
