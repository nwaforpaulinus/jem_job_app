// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vacancy_match_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<VacancyMatchRecord> _$vacancyMatchRecordSerializer =
    new _$VacancyMatchRecordSerializer();

class _$VacancyMatchRecordSerializer
    implements StructuredSerializer<VacancyMatchRecord> {
  @override
  final Iterable<Type> types = const [VacancyMatchRecord, _$VacancyMatchRecord];
  @override
  final String wireName = 'VacancyMatchRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, VacancyMatchRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.isMatched;
    if (value != null) {
      result
        ..add('is_matched')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.vacancyRef;
    if (value != null) {
      result
        ..add('vacancy_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.userRef;
    if (value != null) {
      result
        ..add('user_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ownerRef;
    if (value != null) {
      result
        ..add('owner_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
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
  VacancyMatchRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VacancyMatchRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'is_matched':
          result.isMatched = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'vacancy_ref':
          result.vacancyRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'user_ref':
          result.userRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'owner_ref':
          result.ownerRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
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

class _$VacancyMatchRecord extends VacancyMatchRecord {
  @override
  final bool? isMatched;
  @override
  final DocumentReference<Object?>? vacancyRef;
  @override
  final DocumentReference<Object?>? userRef;
  @override
  final String? status;
  @override
  final DocumentReference<Object?>? ownerRef;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$VacancyMatchRecord(
          [void Function(VacancyMatchRecordBuilder)? updates]) =>
      (new VacancyMatchRecordBuilder()..update(updates))._build();

  _$VacancyMatchRecord._(
      {this.isMatched,
      this.vacancyRef,
      this.userRef,
      this.status,
      this.ownerRef,
      this.ffRef})
      : super._();

  @override
  VacancyMatchRecord rebuild(
          void Function(VacancyMatchRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VacancyMatchRecordBuilder toBuilder() =>
      new VacancyMatchRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VacancyMatchRecord &&
        isMatched == other.isMatched &&
        vacancyRef == other.vacancyRef &&
        userRef == other.userRef &&
        status == other.status &&
        ownerRef == other.ownerRef &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isMatched.hashCode);
    _$hash = $jc(_$hash, vacancyRef.hashCode);
    _$hash = $jc(_$hash, userRef.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, ownerRef.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VacancyMatchRecord')
          ..add('isMatched', isMatched)
          ..add('vacancyRef', vacancyRef)
          ..add('userRef', userRef)
          ..add('status', status)
          ..add('ownerRef', ownerRef)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class VacancyMatchRecordBuilder
    implements Builder<VacancyMatchRecord, VacancyMatchRecordBuilder> {
  _$VacancyMatchRecord? _$v;

  bool? _isMatched;
  bool? get isMatched => _$this._isMatched;
  set isMatched(bool? isMatched) => _$this._isMatched = isMatched;

  DocumentReference<Object?>? _vacancyRef;
  DocumentReference<Object?>? get vacancyRef => _$this._vacancyRef;
  set vacancyRef(DocumentReference<Object?>? vacancyRef) =>
      _$this._vacancyRef = vacancyRef;

  DocumentReference<Object?>? _userRef;
  DocumentReference<Object?>? get userRef => _$this._userRef;
  set userRef(DocumentReference<Object?>? userRef) => _$this._userRef = userRef;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  DocumentReference<Object?>? _ownerRef;
  DocumentReference<Object?>? get ownerRef => _$this._ownerRef;
  set ownerRef(DocumentReference<Object?>? ownerRef) =>
      _$this._ownerRef = ownerRef;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  VacancyMatchRecordBuilder() {
    VacancyMatchRecord._initializeBuilder(this);
  }

  VacancyMatchRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isMatched = $v.isMatched;
      _vacancyRef = $v.vacancyRef;
      _userRef = $v.userRef;
      _status = $v.status;
      _ownerRef = $v.ownerRef;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VacancyMatchRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$VacancyMatchRecord;
  }

  @override
  void update(void Function(VacancyMatchRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VacancyMatchRecord build() => _build();

  _$VacancyMatchRecord _build() {
    final _$result = _$v ??
        new _$VacancyMatchRecord._(
            isMatched: isMatched,
            vacancyRef: vacancyRef,
            userRef: userRef,
            status: status,
            ownerRef: ownerRef,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
