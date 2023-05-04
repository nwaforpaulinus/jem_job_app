import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'vacancy_record.g.dart';

abstract class VacancyRecord
    implements Built<VacancyRecord, VacancyRecordBuilder> {
  static Serializer<VacancyRecord> get serializer => _$vacancyRecordSerializer;

  @BuiltValueField(wireName: 'name_position')
  String? get namePosition;

  @BuiltValueField(wireName: 'salary_per_month')
  double? get salaryPerMonth;

  @BuiltValueField(wireName: 'job_type')
  String? get jobType;

  String? get location;

  @BuiltValueField(wireName: 'job_description')
  String? get jobDescription;

  @BuiltValueField(wireName: 'user_reference')
  DocumentReference? get userReference;

  String? get requirement1;

  String? get requirement2;

  String? get requirement3;

  String? get requirement4;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  BuiltList<DocumentReference>? get bookmark;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(VacancyRecordBuilder builder) => builder
    ..namePosition = ''
    ..salaryPerMonth = 0.0
    ..jobType = ''
    ..location = ''
    ..jobDescription = ''
    ..requirement1 = ''
    ..requirement2 = ''
    ..requirement3 = ''
    ..requirement4 = ''
    ..bookmark = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('vacancy');

  static Stream<VacancyRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<VacancyRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  VacancyRecord._();
  factory VacancyRecord([void Function(VacancyRecordBuilder) updates]) =
      _$VacancyRecord;

  static VacancyRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createVacancyRecordData({
  String? namePosition,
  double? salaryPerMonth,
  String? jobType,
  String? location,
  String? jobDescription,
  DocumentReference? userReference,
  String? requirement1,
  String? requirement2,
  String? requirement3,
  String? requirement4,
  DateTime? createdTime,
}) {
  final firestoreData = serializers.toFirestore(
    VacancyRecord.serializer,
    VacancyRecord(
      (v) => v
        ..namePosition = namePosition
        ..salaryPerMonth = salaryPerMonth
        ..jobType = jobType
        ..location = location
        ..jobDescription = jobDescription
        ..userReference = userReference
        ..requirement1 = requirement1
        ..requirement2 = requirement2
        ..requirement3 = requirement3
        ..requirement4 = requirement4
        ..createdTime = createdTime
        ..bookmark = null,
    ),
  );

  return firestoreData;
}
