// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vacancy_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<VacancyRecord> _$vacancyRecordSerializer =
    new _$VacancyRecordSerializer();

class _$VacancyRecordSerializer implements StructuredSerializer<VacancyRecord> {
  @override
  final Iterable<Type> types = const [VacancyRecord, _$VacancyRecord];
  @override
  final String wireName = 'VacancyRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, VacancyRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.namePosition;
    if (value != null) {
      result
        ..add('name_position')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.salaryPerMonth;
    if (value != null) {
      result
        ..add('salary_per_month')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.jobType;
    if (value != null) {
      result
        ..add('job_type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.location;
    if (value != null) {
      result
        ..add('location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.jobDescription;
    if (value != null) {
      result
        ..add('job_description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userReference;
    if (value != null) {
      result
        ..add('user_reference')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.requirement1;
    if (value != null) {
      result
        ..add('requirement1')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.requirement2;
    if (value != null) {
      result
        ..add('requirement2')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.requirement3;
    if (value != null) {
      result
        ..add('requirement3')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.requirement4;
    if (value != null) {
      result
        ..add('requirement4')
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
    value = object.bookmark;
    if (value != null) {
      result
        ..add('bookmark')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
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
  VacancyRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VacancyRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name_position':
          result.namePosition = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'salary_per_month':
          result.salaryPerMonth = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'job_type':
          result.jobType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'job_description':
          result.jobDescription = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user_reference':
          result.userReference = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'requirement1':
          result.requirement1 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'requirement2':
          result.requirement2 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'requirement3':
          result.requirement3 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'requirement4':
          result.requirement4 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'bookmark':
          result.bookmark.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
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

class _$VacancyRecord extends VacancyRecord {
  @override
  final String? namePosition;
  @override
  final double? salaryPerMonth;
  @override
  final String? jobType;
  @override
  final String? location;
  @override
  final String? jobDescription;
  @override
  final DocumentReference<Object?>? userReference;
  @override
  final String? requirement1;
  @override
  final String? requirement2;
  @override
  final String? requirement3;
  @override
  final String? requirement4;
  @override
  final DateTime? createdTime;
  @override
  final BuiltList<DocumentReference<Object?>>? bookmark;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$VacancyRecord([void Function(VacancyRecordBuilder)? updates]) =>
      (new VacancyRecordBuilder()..update(updates))._build();

  _$VacancyRecord._(
      {this.namePosition,
      this.salaryPerMonth,
      this.jobType,
      this.location,
      this.jobDescription,
      this.userReference,
      this.requirement1,
      this.requirement2,
      this.requirement3,
      this.requirement4,
      this.createdTime,
      this.bookmark,
      this.ffRef})
      : super._();

  @override
  VacancyRecord rebuild(void Function(VacancyRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VacancyRecordBuilder toBuilder() => new VacancyRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VacancyRecord &&
        namePosition == other.namePosition &&
        salaryPerMonth == other.salaryPerMonth &&
        jobType == other.jobType &&
        location == other.location &&
        jobDescription == other.jobDescription &&
        userReference == other.userReference &&
        requirement1 == other.requirement1 &&
        requirement2 == other.requirement2 &&
        requirement3 == other.requirement3 &&
        requirement4 == other.requirement4 &&
        createdTime == other.createdTime &&
        bookmark == other.bookmark &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, namePosition.hashCode);
    _$hash = $jc(_$hash, salaryPerMonth.hashCode);
    _$hash = $jc(_$hash, jobType.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jc(_$hash, jobDescription.hashCode);
    _$hash = $jc(_$hash, userReference.hashCode);
    _$hash = $jc(_$hash, requirement1.hashCode);
    _$hash = $jc(_$hash, requirement2.hashCode);
    _$hash = $jc(_$hash, requirement3.hashCode);
    _$hash = $jc(_$hash, requirement4.hashCode);
    _$hash = $jc(_$hash, createdTime.hashCode);
    _$hash = $jc(_$hash, bookmark.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VacancyRecord')
          ..add('namePosition', namePosition)
          ..add('salaryPerMonth', salaryPerMonth)
          ..add('jobType', jobType)
          ..add('location', location)
          ..add('jobDescription', jobDescription)
          ..add('userReference', userReference)
          ..add('requirement1', requirement1)
          ..add('requirement2', requirement2)
          ..add('requirement3', requirement3)
          ..add('requirement4', requirement4)
          ..add('createdTime', createdTime)
          ..add('bookmark', bookmark)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class VacancyRecordBuilder
    implements Builder<VacancyRecord, VacancyRecordBuilder> {
  _$VacancyRecord? _$v;

  String? _namePosition;
  String? get namePosition => _$this._namePosition;
  set namePosition(String? namePosition) => _$this._namePosition = namePosition;

  double? _salaryPerMonth;
  double? get salaryPerMonth => _$this._salaryPerMonth;
  set salaryPerMonth(double? salaryPerMonth) =>
      _$this._salaryPerMonth = salaryPerMonth;

  String? _jobType;
  String? get jobType => _$this._jobType;
  set jobType(String? jobType) => _$this._jobType = jobType;

  String? _location;
  String? get location => _$this._location;
  set location(String? location) => _$this._location = location;

  String? _jobDescription;
  String? get jobDescription => _$this._jobDescription;
  set jobDescription(String? jobDescription) =>
      _$this._jobDescription = jobDescription;

  DocumentReference<Object?>? _userReference;
  DocumentReference<Object?>? get userReference => _$this._userReference;
  set userReference(DocumentReference<Object?>? userReference) =>
      _$this._userReference = userReference;

  String? _requirement1;
  String? get requirement1 => _$this._requirement1;
  set requirement1(String? requirement1) => _$this._requirement1 = requirement1;

  String? _requirement2;
  String? get requirement2 => _$this._requirement2;
  set requirement2(String? requirement2) => _$this._requirement2 = requirement2;

  String? _requirement3;
  String? get requirement3 => _$this._requirement3;
  set requirement3(String? requirement3) => _$this._requirement3 = requirement3;

  String? _requirement4;
  String? get requirement4 => _$this._requirement4;
  set requirement4(String? requirement4) => _$this._requirement4 = requirement4;

  DateTime? _createdTime;
  DateTime? get createdTime => _$this._createdTime;
  set createdTime(DateTime? createdTime) => _$this._createdTime = createdTime;

  ListBuilder<DocumentReference<Object?>>? _bookmark;
  ListBuilder<DocumentReference<Object?>> get bookmark =>
      _$this._bookmark ??= new ListBuilder<DocumentReference<Object?>>();
  set bookmark(ListBuilder<DocumentReference<Object?>>? bookmark) =>
      _$this._bookmark = bookmark;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  VacancyRecordBuilder() {
    VacancyRecord._initializeBuilder(this);
  }

  VacancyRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _namePosition = $v.namePosition;
      _salaryPerMonth = $v.salaryPerMonth;
      _jobType = $v.jobType;
      _location = $v.location;
      _jobDescription = $v.jobDescription;
      _userReference = $v.userReference;
      _requirement1 = $v.requirement1;
      _requirement2 = $v.requirement2;
      _requirement3 = $v.requirement3;
      _requirement4 = $v.requirement4;
      _createdTime = $v.createdTime;
      _bookmark = $v.bookmark?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VacancyRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$VacancyRecord;
  }

  @override
  void update(void Function(VacancyRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VacancyRecord build() => _build();

  _$VacancyRecord _build() {
    _$VacancyRecord _$result;
    try {
      _$result = _$v ??
          new _$VacancyRecord._(
              namePosition: namePosition,
              salaryPerMonth: salaryPerMonth,
              jobType: jobType,
              location: location,
              jobDescription: jobDescription,
              userReference: userReference,
              requirement1: requirement1,
              requirement2: requirement2,
              requirement3: requirement3,
              requirement4: requirement4,
              createdTime: createdTime,
              bookmark: _bookmark?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'bookmark';
        _bookmark?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'VacancyRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
