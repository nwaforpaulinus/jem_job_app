// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'errands_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ErrandsRecord> _$errandsRecordSerializer =
    new _$ErrandsRecordSerializer();

class _$ErrandsRecordSerializer implements StructuredSerializer<ErrandsRecord> {
  @override
  final Iterable<Type> types = const [ErrandsRecord, _$ErrandsRecord];
  @override
  final String wireName = 'ErrandsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ErrandsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.location;
    if (value != null) {
      result
        ..add('location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userRef;
    if (value != null) {
      result
        ..add('userRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.errandName;
    if (value != null) {
      result
        ..add('errand_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.employeeLocation;
    if (value != null) {
      result
        ..add('employee_location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.isConfirmed;
    if (value != null) {
      result
        ..add('isConfirmed')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
  ErrandsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ErrandsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'userRef':
          result.userRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'errand_name':
          result.errandName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'employee_location':
          result.employeeLocation = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'isConfirmed':
          result.isConfirmed = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
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

class _$ErrandsRecord extends ErrandsRecord {
  @override
  final LatLng? location;
  @override
  final String? address;
  @override
  final DocumentReference<Object?>? userRef;
  @override
  final String? errandName;
  @override
  final LatLng? employeeLocation;
  @override
  final bool? isConfirmed;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ErrandsRecord([void Function(ErrandsRecordBuilder)? updates]) =>
      (new ErrandsRecordBuilder()..update(updates))._build();

  _$ErrandsRecord._(
      {this.location,
      this.address,
      this.userRef,
      this.errandName,
      this.employeeLocation,
      this.isConfirmed,
      this.ffRef})
      : super._();

  @override
  ErrandsRecord rebuild(void Function(ErrandsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ErrandsRecordBuilder toBuilder() => new ErrandsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ErrandsRecord &&
        location == other.location &&
        address == other.address &&
        userRef == other.userRef &&
        errandName == other.errandName &&
        employeeLocation == other.employeeLocation &&
        isConfirmed == other.isConfirmed &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, userRef.hashCode);
    _$hash = $jc(_$hash, errandName.hashCode);
    _$hash = $jc(_$hash, employeeLocation.hashCode);
    _$hash = $jc(_$hash, isConfirmed.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ErrandsRecord')
          ..add('location', location)
          ..add('address', address)
          ..add('userRef', userRef)
          ..add('errandName', errandName)
          ..add('employeeLocation', employeeLocation)
          ..add('isConfirmed', isConfirmed)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ErrandsRecordBuilder
    implements Builder<ErrandsRecord, ErrandsRecordBuilder> {
  _$ErrandsRecord? _$v;

  LatLng? _location;
  LatLng? get location => _$this._location;
  set location(LatLng? location) => _$this._location = location;


  LatLng? _destinationLocation;
  LatLng? get destinationLocation => _$this._destinationLocation;
  set destinationLocation(LatLng? destinationLocation) => _$this
      ._destinationLocation =
      destinationLocation;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  DocumentReference<Object?>? _userRef;
  DocumentReference<Object?>? get userRef => _$this._userRef;
  set userRef(DocumentReference<Object?>? userRef) => _$this._userRef = userRef;

  String? _errandName;
  String? get errandName => _$this._errandName;
  set errandName(String? errandName) => _$this._errandName = errandName;

  LatLng? _employeeLocation;
  LatLng? get employeeLocation => _$this._employeeLocation;
  set employeeLocation(LatLng? employeeLocation) =>
      _$this._employeeLocation = employeeLocation;

  bool? _isConfirmed;
  bool? get isConfirmed => _$this._isConfirmed;
  set isConfirmed(bool? isConfirmed) => _$this._isConfirmed = isConfirmed;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ErrandsRecordBuilder() {
    ErrandsRecord._initializeBuilder(this);
  }

  ErrandsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _location = $v.location;
      _address = $v.address;
      _userRef = $v.userRef;
      _errandName = $v.errandName;
      _employeeLocation = $v.employeeLocation;
      _isConfirmed = $v.isConfirmed;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ErrandsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ErrandsRecord;
  }

  @override
  void update(void Function(ErrandsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ErrandsRecord build() => _build();

  _$ErrandsRecord _build() {
    final _$result = _$v ??
        new _$ErrandsRecord._(
            location: location,
            address: address,
            userRef: userRef,
            errandName: errandName,
            employeeLocation: employeeLocation,
            isConfirmed: isConfirmed,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint