import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'swipe_screen_record.g.dart';

abstract class SwipeScreenRecord
    implements Built<SwipeScreenRecord, SwipeScreenRecordBuilder> {
  static Serializer<SwipeScreenRecord> get serializer =>
      _$swipeScreenRecordSerializer;

  String? get email;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  String? get uid;

  @BuiltValueField(wireName: 'edited_time')
  DateTime? get editedTime;

  String? get occupation;

  String? get description;

  String? get skills;

  LatLng? get location;

  @BuiltValueField(wireName: 'user_reference')
  DocumentReference? get userReference;

  @BuiltValueField(wireName: 'user_role')
  int? get userRole;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(SwipeScreenRecordBuilder builder) => builder
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..occupation = ''
    ..description = ''
    ..skills = ''
    ..userRole = 0
    ..phoneNumber = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('SwipeScreen');

  static Stream<SwipeScreenRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<SwipeScreenRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  SwipeScreenRecord._();
  factory SwipeScreenRecord([void Function(SwipeScreenRecordBuilder) updates]) =
      _$SwipeScreenRecord;

  static SwipeScreenRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createSwipeScreenRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? editedTime,
  String? occupation,
  String? description,
  String? skills,
  LatLng? location,
  DocumentReference? userReference,
  int? userRole,
  DateTime? createdTime,
  String? phoneNumber,
}) {
  final firestoreData = serializers.toFirestore(
    SwipeScreenRecord.serializer,
    SwipeScreenRecord(
      (s) => s
        ..email = email
        ..displayName = displayName
        ..photoUrl = photoUrl
        ..uid = uid
        ..editedTime = editedTime
        ..occupation = occupation
        ..description = description
        ..skills = skills
        ..location = location
        ..userReference = userReference
        ..userRole = userRole
        ..createdTime = createdTime
        ..phoneNumber = phoneNumber,
    ),
  );

  return firestoreData;
}
