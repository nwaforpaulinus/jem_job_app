// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swipe_screen_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SwipeScreenRecord> _$swipeScreenRecordSerializer =
    new _$SwipeScreenRecordSerializer();

class _$SwipeScreenRecordSerializer
    implements StructuredSerializer<SwipeScreenRecord> {
  @override
  final Iterable<Type> types = const [SwipeScreenRecord, _$SwipeScreenRecord];
  @override
  final String wireName = 'SwipeScreenRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, SwipeScreenRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.displayName;
    if (value != null) {
      result
        ..add('display_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.editedTime;
    if (value != null) {
      result
        ..add('edited_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.occupation;
    if (value != null) {
      result
        ..add('occupation')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.skills;
    if (value != null) {
      result
        ..add('skills')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.location;
    if (value != null) {
      result
        ..add('location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.userReference;
    if (value != null) {
      result
        ..add('user_reference')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.userRole;
    if (value != null) {
      result
        ..add('user_role')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phone_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  SwipeScreenRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SwipeScreenRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'display_name':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'edited_time':
          result.editedTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'occupation':
          result.occupation = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'skills':
          result.skills = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'user_reference':
          result.userReference = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'user_role':
          result.userRole = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$SwipeScreenRecord extends SwipeScreenRecord {
  @override
  final String? email;
  @override
  final String? displayName;
  @override
  final String? photoUrl;
  @override
  final String? uid;
  @override
  final DateTime? editedTime;
  @override
  final String? occupation;
  @override
  final String? description;
  @override
  final String? skills;
  @override
  final LatLng? location;
  @override
  final DocumentReference<Object?>? userReference;
  @override
  final int? userRole;
  @override
  final DateTime? createdTime;
  @override
  final String? phoneNumber;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$SwipeScreenRecord(
          [void Function(SwipeScreenRecordBuilder)? updates]) =>
      (new SwipeScreenRecordBuilder()..update(updates))._build();

  _$SwipeScreenRecord._(
      {this.email,
      this.displayName,
      this.photoUrl,
      this.uid,
      this.editedTime,
      this.occupation,
      this.description,
      this.skills,
      this.location,
      this.userReference,
      this.userRole,
      this.createdTime,
      this.phoneNumber,
      this.ffRef})
      : super._();

  @override
  SwipeScreenRecord rebuild(void Function(SwipeScreenRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SwipeScreenRecordBuilder toBuilder() =>
      new SwipeScreenRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SwipeScreenRecord &&
        email == other.email &&
        displayName == other.displayName &&
        photoUrl == other.photoUrl &&
        uid == other.uid &&
        editedTime == other.editedTime &&
        occupation == other.occupation &&
        description == other.description &&
        skills == other.skills &&
        location == other.location &&
        userReference == other.userReference &&
        userRole == other.userRole &&
        createdTime == other.createdTime &&
        phoneNumber == other.phoneNumber &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, photoUrl.hashCode);
    _$hash = $jc(_$hash, uid.hashCode);
    _$hash = $jc(_$hash, editedTime.hashCode);
    _$hash = $jc(_$hash, occupation.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, skills.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jc(_$hash, userReference.hashCode);
    _$hash = $jc(_$hash, userRole.hashCode);
    _$hash = $jc(_$hash, createdTime.hashCode);
    _$hash = $jc(_$hash, phoneNumber.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SwipeScreenRecord')
          ..add('email', email)
          ..add('displayName', displayName)
          ..add('photoUrl', photoUrl)
          ..add('uid', uid)
          ..add('editedTime', editedTime)
          ..add('occupation', occupation)
          ..add('description', description)
          ..add('skills', skills)
          ..add('location', location)
          ..add('userReference', userReference)
          ..add('userRole', userRole)
          ..add('createdTime', createdTime)
          ..add('phoneNumber', phoneNumber)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class SwipeScreenRecordBuilder
    implements Builder<SwipeScreenRecord, SwipeScreenRecordBuilder> {
  _$SwipeScreenRecord? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _photoUrl;
  String? get photoUrl => _$this._photoUrl;
  set photoUrl(String? photoUrl) => _$this._photoUrl = photoUrl;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  DateTime? _editedTime;
  DateTime? get editedTime => _$this._editedTime;
  set editedTime(DateTime? editedTime) => _$this._editedTime = editedTime;

  String? _occupation;
  String? get occupation => _$this._occupation;
  set occupation(String? occupation) => _$this._occupation = occupation;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _skills;
  String? get skills => _$this._skills;
  set skills(String? skills) => _$this._skills = skills;

  LatLng? _location;
  LatLng? get location => _$this._location;
  set location(LatLng? location) => _$this._location = location;

  DocumentReference<Object?>? _userReference;
  DocumentReference<Object?>? get userReference => _$this._userReference;
  set userReference(DocumentReference<Object?>? userReference) =>
      _$this._userReference = userReference;

  int? _userRole;
  int? get userRole => _$this._userRole;
  set userRole(int? userRole) => _$this._userRole = userRole;

  DateTime? _createdTime;
  DateTime? get createdTime => _$this._createdTime;
  set createdTime(DateTime? createdTime) => _$this._createdTime = createdTime;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  SwipeScreenRecordBuilder() {
    SwipeScreenRecord._initializeBuilder(this);
  }

  SwipeScreenRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _displayName = $v.displayName;
      _photoUrl = $v.photoUrl;
      _uid = $v.uid;
      _editedTime = $v.editedTime;
      _occupation = $v.occupation;
      _description = $v.description;
      _skills = $v.skills;
      _location = $v.location;
      _userReference = $v.userReference;
      _userRole = $v.userRole;
      _createdTime = $v.createdTime;
      _phoneNumber = $v.phoneNumber;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SwipeScreenRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SwipeScreenRecord;
  }

  @override
  void update(void Function(SwipeScreenRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SwipeScreenRecord build() => _build();

  _$SwipeScreenRecord _build() {
    final _$result = _$v ??
        new _$SwipeScreenRecord._(
            email: email,
            displayName: displayName,
            photoUrl: photoUrl,
            uid: uid,
            editedTime: editedTime,
            occupation: occupation,
            description: description,
            skills: skills,
            location: location,
            userReference: userReference,
            userRole: userRole,
            createdTime: createdTime,
            phoneNumber: phoneNumber,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
