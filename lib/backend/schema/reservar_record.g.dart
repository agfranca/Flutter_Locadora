// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservar_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ReservarRecord> _$reservarRecordSerializer =
    new _$ReservarRecordSerializer();

class _$ReservarRecordSerializer
    implements StructuredSerializer<ReservarRecord> {
  @override
  final Iterable<Type> types = const [ReservarRecord, _$ReservarRecord];
  @override
  final String wireName = 'ReservarRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ReservarRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.nameCar;
    if (value != null) {
      result
        ..add('nameCar')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.imgCarReserva;
    if (value != null) {
      result
        ..add('imgCarReserva')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.groupNameCar;
    if (value != null) {
      result
        ..add('groupNameCar')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dateRetir;
    if (value != null) {
      result
        ..add('dateRetir')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.dateEntr;
    if (value != null) {
      result
        ..add('dateEntr')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.localRet1;
    if (value != null) {
      result
        ..add('localRet1')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.localdev2;
    if (value != null) {
      result
        ..add('localdev2')
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
  ReservarRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ReservarRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'nameCar':
          result.nameCar = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'imgCarReserva':
          result.imgCarReserva = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'groupNameCar':
          result.groupNameCar = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'dateRetir':
          result.dateRetir = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'dateEntr':
          result.dateEntr = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'localRet1':
          result.localRet1 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'localdev2':
          result.localdev2 = serializers.deserialize(value,
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

class _$ReservarRecord extends ReservarRecord {
  @override
  final String? nameCar;
  @override
  final String? imgCarReserva;
  @override
  final String? groupNameCar;
  @override
  final DateTime? dateRetir;
  @override
  final DateTime? dateEntr;
  @override
  final String? localRet1;
  @override
  final String? localdev2;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ReservarRecord([void Function(ReservarRecordBuilder)? updates]) =>
      (new ReservarRecordBuilder()..update(updates))._build();

  _$ReservarRecord._(
      {this.nameCar,
      this.imgCarReserva,
      this.groupNameCar,
      this.dateRetir,
      this.dateEntr,
      this.localRet1,
      this.localdev2,
      this.ffRef})
      : super._();

  @override
  ReservarRecord rebuild(void Function(ReservarRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReservarRecordBuilder toBuilder() =>
      new ReservarRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReservarRecord &&
        nameCar == other.nameCar &&
        imgCarReserva == other.imgCarReserva &&
        groupNameCar == other.groupNameCar &&
        dateRetir == other.dateRetir &&
        dateEntr == other.dateEntr &&
        localRet1 == other.localRet1 &&
        localdev2 == other.localdev2 &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc(0, nameCar.hashCode),
                                imgCarReserva.hashCode),
                            groupNameCar.hashCode),
                        dateRetir.hashCode),
                    dateEntr.hashCode),
                localRet1.hashCode),
            localdev2.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReservarRecord')
          ..add('nameCar', nameCar)
          ..add('imgCarReserva', imgCarReserva)
          ..add('groupNameCar', groupNameCar)
          ..add('dateRetir', dateRetir)
          ..add('dateEntr', dateEntr)
          ..add('localRet1', localRet1)
          ..add('localdev2', localdev2)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ReservarRecordBuilder
    implements Builder<ReservarRecord, ReservarRecordBuilder> {
  _$ReservarRecord? _$v;

  String? _nameCar;
  String? get nameCar => _$this._nameCar;
  set nameCar(String? nameCar) => _$this._nameCar = nameCar;

  String? _imgCarReserva;
  String? get imgCarReserva => _$this._imgCarReserva;
  set imgCarReserva(String? imgCarReserva) =>
      _$this._imgCarReserva = imgCarReserva;

  String? _groupNameCar;
  String? get groupNameCar => _$this._groupNameCar;
  set groupNameCar(String? groupNameCar) => _$this._groupNameCar = groupNameCar;

  DateTime? _dateRetir;
  DateTime? get dateRetir => _$this._dateRetir;
  set dateRetir(DateTime? dateRetir) => _$this._dateRetir = dateRetir;

  DateTime? _dateEntr;
  DateTime? get dateEntr => _$this._dateEntr;
  set dateEntr(DateTime? dateEntr) => _$this._dateEntr = dateEntr;

  String? _localRet1;
  String? get localRet1 => _$this._localRet1;
  set localRet1(String? localRet1) => _$this._localRet1 = localRet1;

  String? _localdev2;
  String? get localdev2 => _$this._localdev2;
  set localdev2(String? localdev2) => _$this._localdev2 = localdev2;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ReservarRecordBuilder() {
    ReservarRecord._initializeBuilder(this);
  }

  ReservarRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _nameCar = $v.nameCar;
      _imgCarReserva = $v.imgCarReserva;
      _groupNameCar = $v.groupNameCar;
      _dateRetir = $v.dateRetir;
      _dateEntr = $v.dateEntr;
      _localRet1 = $v.localRet1;
      _localdev2 = $v.localdev2;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReservarRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReservarRecord;
  }

  @override
  void update(void Function(ReservarRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReservarRecord build() => _build();

  _$ReservarRecord _build() {
    final _$result = _$v ??
        new _$ReservarRecord._(
            nameCar: nameCar,
            imgCarReserva: imgCarReserva,
            groupNameCar: groupNameCar,
            dateRetir: dateRetir,
            dateEntr: dateEntr,
            localRet1: localRet1,
            localdev2: localdev2,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
