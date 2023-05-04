import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'vacancy_match_record.g.dart';

abstract class VacancyMatchRecord
    implements Built<VacancyMatchRecord, VacancyMatchRecordBuilder> {
  static Serializer<VacancyMatchRecord> get serializer =>
      _$vacancyMatchRecordSerializer;

  @BuiltValueField(wireName: 'is_matched')
  bool? get isMatched;

  @BuiltValueField(wireName: 'vacancy_ref')
  DocumentReference? get vacancyRef;

  @BuiltValueField(wireName: 'user_ref')
  DocumentReference? get userRef;

  String? get status;

  @BuiltValueField(wireName: 'owner_ref')
  DocumentReference? get ownerRef;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(VacancyMatchRecordBuilder builder) => builder
    ..isMatched = false
    ..status = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('vacancy_match');

  static Stream<VacancyMatchRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<VacancyMatchRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  VacancyMatchRecord._();
  factory VacancyMatchRecord(
          [void Function(VacancyMatchRecordBuilder) updates]) =
      _$VacancyMatchRecord;

  static VacancyMatchRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createVacancyMatchRecordData({
  bool? isMatched,
  DocumentReference? vacancyRef,
  DocumentReference? userRef,
  String? status,
  DocumentReference? ownerRef,
}) {
  final firestoreData = serializers.toFirestore(
    VacancyMatchRecord.serializer,
    VacancyMatchRecord(
      (v) => v
        ..isMatched = isMatched
        ..vacancyRef = vacancyRef
        ..userRef = userRef
        ..status = status
        ..ownerRef = ownerRef,
    ),
  );

  return firestoreData;
}
