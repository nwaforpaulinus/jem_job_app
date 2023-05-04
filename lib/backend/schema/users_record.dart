import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

  String? get email;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  String? get uid;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  String? get role;

  @BuiltValueField(wireName: 'Address')
  String? get address;

  @BuiltValueField(wireName: 'name_of_company')
  String? get nameOfCompany;

  @BuiltValueField(wireName: 'name_of_employer')
  String? get nameOfEmployer;

  String? get country;

  String? get description;

  String? get occupation;

  String? get skills;

  @BuiltValueField(wireName: 'date_of_birth')
  DateTime? get dateOfBirth;

  LatLng? get location;

  @BuiltValueField(wireName: 'user_role')
  int? get userRole;

  @BuiltValueField(wireName: 'desired_role')
  int? get desiredRole;

  BuiltList<String>? get matches;

  BuiltList<String>? get rejected;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  String? get state;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..email = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = ''
    ..role = ''
    ..address = ''
    ..nameOfCompany = ''
    ..nameOfEmployer = ''
    ..country = ''
    ..description = ''
    ..occupation = ''
    ..skills = ''
    ..userRole = 0
    ..desiredRole = 0
    ..matches = ListBuilder()
    ..rejected = ListBuilder()
    ..displayName = ''
    ..state = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;

  static UsersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? role,
  String? address,
  String? nameOfCompany,
  String? nameOfEmployer,
  String? country,
  String? description,
  String? occupation,
  String? skills,
  DateTime? dateOfBirth,
  LatLng? location,
  int? userRole,
  int? desiredRole,
  String? displayName,
  String? state,
}) {
  final firestoreData = serializers.toFirestore(
    UsersRecord.serializer,
    UsersRecord(
      (u) => u
        ..email = email
        ..photoUrl = photoUrl
        ..uid = uid
        ..createdTime = createdTime
        ..phoneNumber = phoneNumber
        ..role = role
        ..address = address
        ..nameOfCompany = nameOfCompany
        ..nameOfEmployer = nameOfEmployer
        ..country = country
        ..description = description
        ..occupation = occupation
        ..skills = skills
        ..dateOfBirth = dateOfBirth
        ..location = location
        ..userRole = userRole
        ..desiredRole = desiredRole
        ..matches = null
        ..rejected = null
        ..displayName = displayName
        ..state = state,
    ),
  );

  return firestoreData;
}
