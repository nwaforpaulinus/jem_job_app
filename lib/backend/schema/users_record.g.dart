// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UsersRecord> _$usersRecordSerializer = new _$UsersRecordSerializer();

class _$UsersRecordSerializer implements StructuredSerializer<UsersRecord> {
  @override
  final Iterable<Type> types = const [UsersRecord, _$UsersRecord];
  @override
  final String wireName = 'UsersRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, UsersRecord object,
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
    value = object.role;
    if (value != null) {
      result
        ..add('role')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.address;
    if (value != null) {
      result
        ..add('Address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.nameOfCompany;
    if (value != null) {
      result
        ..add('name_of_company')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.nameOfEmployer;
    if (value != null) {
      result
        ..add('name_of_employer')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.country;
    if (value != null) {
      result
        ..add('country')
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
    value = object.occupation;
    if (value != null) {
      result
        ..add('occupation')
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
    value = object.dateOfBirth;
    if (value != null) {
      result
        ..add('date_of_birth')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.location;
    if (value != null) {
      result
        ..add('location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.userRole;
    if (value != null) {
      result
        ..add('user_role')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.desiredRole;
    if (value != null) {
      result
        ..add('desired_role')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.matches;
    if (value != null) {
      result
        ..add('matches')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.rejected;
    if (value != null) {
      result
        ..add('rejected')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.displayName;
    if (value != null) {
      result
        ..add('display_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.state;
    if (value != null) {
      result
        ..add('state')
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
  UsersRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UsersRecordBuilder();

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
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'role':
          result.role = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'name_of_company':
          result.nameOfCompany = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'name_of_employer':
          result.nameOfEmployer = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'country':
          result.country = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'occupation':
          result.occupation = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'skills':
          result.skills = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'date_of_birth':
          result.dateOfBirth = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'user_role':
          result.userRole = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'desired_role':
          result.desiredRole = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'matches':
          result.matches.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'rejected':
          result.rejected.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'display_name':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'state':
          result.state = serializers.deserialize(value,
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

class _$UsersRecord extends UsersRecord {
  @override
  final String? email;
  @override
  final String? photoUrl;
  @override
  final String? uid;
  @override
  final DateTime? createdTime;
  @override
  final String? phoneNumber;
  @override
  final String? role;
  @override
  final String? address;
  @override
  final String? nameOfCompany;
  @override
  final String? nameOfEmployer;
  @override
  final String? country;
  @override
  final String? description;
  @override
  final String? occupation;
  @override
  final String? skills;
  @override
  final DateTime? dateOfBirth;
  @override
  final LatLng? location;
  @override
  final int? userRole;
  @override
  final int? desiredRole;
  @override
  final BuiltList<String>? matches;
  @override
  final BuiltList<String>? rejected;
  @override
  final String? displayName;
  @override
  final String? state;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UsersRecord([void Function(UsersRecordBuilder)? updates]) =>
      (new UsersRecordBuilder()..update(updates))._build();

  _$UsersRecord._(
      {this.email,
      this.photoUrl,
      this.uid,
      this.createdTime,
      this.phoneNumber,
      this.role,
      this.address,
      this.nameOfCompany,
      this.nameOfEmployer,
      this.country,
      this.description,
      this.occupation,
      this.skills,
      this.dateOfBirth,
      this.location,
      this.userRole,
      this.desiredRole,
      this.matches,
      this.rejected,
      this.displayName,
      this.state,
      this.ffRef})
      : super._();

  @override
  UsersRecord rebuild(void Function(UsersRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsersRecordBuilder toBuilder() => new UsersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsersRecord &&
        email == other.email &&
        photoUrl == other.photoUrl &&
        uid == other.uid &&
        createdTime == other.createdTime &&
        phoneNumber == other.phoneNumber &&
        role == other.role &&
        address == other.address &&
        nameOfCompany == other.nameOfCompany &&
        nameOfEmployer == other.nameOfEmployer &&
        country == other.country &&
        description == other.description &&
        occupation == other.occupation &&
        skills == other.skills &&
        dateOfBirth == other.dateOfBirth &&
        location == other.location &&
        userRole == other.userRole &&
        desiredRole == other.desiredRole &&
        matches == other.matches &&
        rejected == other.rejected &&
        displayName == other.displayName &&
        state == other.state &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, photoUrl.hashCode);
    _$hash = $jc(_$hash, uid.hashCode);
    _$hash = $jc(_$hash, createdTime.hashCode);
    _$hash = $jc(_$hash, phoneNumber.hashCode);
    _$hash = $jc(_$hash, role.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, nameOfCompany.hashCode);
    _$hash = $jc(_$hash, nameOfEmployer.hashCode);
    _$hash = $jc(_$hash, country.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, occupation.hashCode);
    _$hash = $jc(_$hash, skills.hashCode);
    _$hash = $jc(_$hash, dateOfBirth.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jc(_$hash, userRole.hashCode);
    _$hash = $jc(_$hash, desiredRole.hashCode);
    _$hash = $jc(_$hash, matches.hashCode);
    _$hash = $jc(_$hash, rejected.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, state.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UsersRecord')
          ..add('email', email)
          ..add('photoUrl', photoUrl)
          ..add('uid', uid)
          ..add('createdTime', createdTime)
          ..add('phoneNumber', phoneNumber)
          ..add('role', role)
          ..add('address', address)
          ..add('nameOfCompany', nameOfCompany)
          ..add('nameOfEmployer', nameOfEmployer)
          ..add('country', country)
          ..add('description', description)
          ..add('occupation', occupation)
          ..add('skills', skills)
          ..add('dateOfBirth', dateOfBirth)
          ..add('location', location)
          ..add('userRole', userRole)
          ..add('desiredRole', desiredRole)
          ..add('matches', matches)
          ..add('rejected', rejected)
          ..add('displayName', displayName)
          ..add('state', state)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UsersRecordBuilder implements Builder<UsersRecord, UsersRecordBuilder> {
  _$UsersRecord? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _photoUrl;
  String? get photoUrl => _$this._photoUrl;
  set photoUrl(String? photoUrl) => _$this._photoUrl = photoUrl;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  DateTime? _createdTime;
  DateTime? get createdTime => _$this._createdTime;
  set createdTime(DateTime? createdTime) => _$this._createdTime = createdTime;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  String? _role;
  String? get role => _$this._role;
  set role(String? role) => _$this._role = role;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  String? _nameOfCompany;
  String? get nameOfCompany => _$this._nameOfCompany;
  set nameOfCompany(String? nameOfCompany) =>
      _$this._nameOfCompany = nameOfCompany;

  String? _nameOfEmployer;
  String? get nameOfEmployer => _$this._nameOfEmployer;
  set nameOfEmployer(String? nameOfEmployer) =>
      _$this._nameOfEmployer = nameOfEmployer;

  String? _country;
  String? get country => _$this._country;
  set country(String? country) => _$this._country = country;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _occupation;
  String? get occupation => _$this._occupation;
  set occupation(String? occupation) => _$this._occupation = occupation;

  String? _skills;
  String? get skills => _$this._skills;
  set skills(String? skills) => _$this._skills = skills;

  DateTime? _dateOfBirth;
  DateTime? get dateOfBirth => _$this._dateOfBirth;
  set dateOfBirth(DateTime? dateOfBirth) => _$this._dateOfBirth = dateOfBirth;

  LatLng? _location;
  LatLng? get location => _$this._location;
  set location(LatLng? location) => _$this._location = location;

  int? _userRole;
  int? get userRole => _$this._userRole;
  set userRole(int? userRole) => _$this._userRole = userRole;

  int? _desiredRole;
  int? get desiredRole => _$this._desiredRole;
  set desiredRole(int? desiredRole) => _$this._desiredRole = desiredRole;

  ListBuilder<String>? _matches;
  ListBuilder<String> get matches =>
      _$this._matches ??= new ListBuilder<String>();
  set matches(ListBuilder<String>? matches) => _$this._matches = matches;

  ListBuilder<String>? _rejected;
  ListBuilder<String> get rejected =>
      _$this._rejected ??= new ListBuilder<String>();
  set rejected(ListBuilder<String>? rejected) => _$this._rejected = rejected;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _state;
  String? get state => _$this._state;
  set state(String? state) => _$this._state = state;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UsersRecordBuilder() {
    UsersRecord._initializeBuilder(this);
  }

  UsersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _photoUrl = $v.photoUrl;
      _uid = $v.uid;
      _createdTime = $v.createdTime;
      _phoneNumber = $v.phoneNumber;
      _role = $v.role;
      _address = $v.address;
      _nameOfCompany = $v.nameOfCompany;
      _nameOfEmployer = $v.nameOfEmployer;
      _country = $v.country;
      _description = $v.description;
      _occupation = $v.occupation;
      _skills = $v.skills;
      _dateOfBirth = $v.dateOfBirth;
      _location = $v.location;
      _userRole = $v.userRole;
      _desiredRole = $v.desiredRole;
      _matches = $v.matches?.toBuilder();
      _rejected = $v.rejected?.toBuilder();
      _displayName = $v.displayName;
      _state = $v.state;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UsersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UsersRecord;
  }

  @override
  void update(void Function(UsersRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UsersRecord build() => _build();

  _$UsersRecord _build() {
    _$UsersRecord _$result;
    try {
      _$result = _$v ??
          new _$UsersRecord._(
              email: email,
              photoUrl: photoUrl,
              uid: uid,
              createdTime: createdTime,
              phoneNumber: phoneNumber,
              role: role,
              address: address,
              nameOfCompany: nameOfCompany,
              nameOfEmployer: nameOfEmployer,
              country: country,
              description: description,
              occupation: occupation,
              skills: skills,
              dateOfBirth: dateOfBirth,
              location: location,
              userRole: userRole,
              desiredRole: desiredRole,
              matches: _matches?.build(),
              rejected: _rejected?.build(),
              displayName: displayName,
              state: state,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'matches';
        _matches?.build();
        _$failedField = 'rejected';
        _rejected?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UsersRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
