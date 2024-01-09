// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lojas_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LojasRecord> _$lojasRecordSerializer = new _$LojasRecordSerializer();

class _$LojasRecordSerializer implements StructuredSerializer<LojasRecord> {
  @override
  final Iterable<Type> types = const [LojasRecord, _$LojasRecord];
  @override
  final String wireName = 'LojasRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, LojasRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.lojaname;
    if (value != null) {
      result
        ..add('Lojaname')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.cidade;
    if (value != null) {
      result
        ..add('Cidade')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.distancia;
    if (value != null) {
      result
        ..add('distancia')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.horaFuci;
    if (value != null) {
      result
        ..add('HoraFuci')
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
  LojasRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LojasRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'Lojaname':
          result.lojaname = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Cidade':
          result.cidade = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'distancia':
          result.distancia = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'HoraFuci':
          result.horaFuci = serializers.deserialize(value,
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

class _$LojasRecord extends LojasRecord {
  @override
  final String? lojaname;
  @override
  final String? cidade;
  @override
  final LatLng? distancia;
  @override
  final String? horaFuci;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$LojasRecord([void Function(LojasRecordBuilder)? updates]) =>
      (new LojasRecordBuilder()..update(updates))._build();

  _$LojasRecord._(
      {this.lojaname, this.cidade, this.distancia, this.horaFuci, this.ffRef})
      : super._();

  @override
  LojasRecord rebuild(void Function(LojasRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LojasRecordBuilder toBuilder() => new LojasRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LojasRecord &&
        lojaname == other.lojaname &&
        cidade == other.cidade &&
        distancia == other.distancia &&
        horaFuci == other.horaFuci &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, lojaname.hashCode), cidade.hashCode),
                distancia.hashCode),
            horaFuci.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LojasRecord')
          ..add('lojaname', lojaname)
          ..add('cidade', cidade)
          ..add('distancia', distancia)
          ..add('horaFuci', horaFuci)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class LojasRecordBuilder implements Builder<LojasRecord, LojasRecordBuilder> {
  _$LojasRecord? _$v;

  String? _lojaname;
  String? get lojaname => _$this._lojaname;
  set lojaname(String? lojaname) => _$this._lojaname = lojaname;

  String? _cidade;
  String? get cidade => _$this._cidade;
  set cidade(String? cidade) => _$this._cidade = cidade;

  LatLng? _distancia;
  LatLng? get distancia => _$this._distancia;
  set distancia(LatLng? distancia) => _$this._distancia = distancia;

  String? _horaFuci;
  String? get horaFuci => _$this._horaFuci;
  set horaFuci(String? horaFuci) => _$this._horaFuci = horaFuci;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  LojasRecordBuilder() {
    LojasRecord._initializeBuilder(this);
  }

  LojasRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _lojaname = $v.lojaname;
      _cidade = $v.cidade;
      _distancia = $v.distancia;
      _horaFuci = $v.horaFuci;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LojasRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LojasRecord;
  }

  @override
  void update(void Function(LojasRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LojasRecord build() => _build();

  _$LojasRecord _build() {
    final _$result = _$v ??
        new _$LojasRecord._(
            lojaname: lojaname,
            cidade: cidade,
            distancia: distancia,
            horaFuci: horaFuci,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
