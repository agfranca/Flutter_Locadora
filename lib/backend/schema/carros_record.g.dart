// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carros_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CarrosRecord> _$carrosRecordSerializer =
    new _$CarrosRecordSerializer();

class _$CarrosRecordSerializer implements StructuredSerializer<CarrosRecord> {
  @override
  final Iterable<Type> types = const [CarrosRecord, _$CarrosRecord];
  @override
  final String wireName = 'CarrosRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, CarrosRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('Name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.cambio;
    if (value != null) {
      result
        ..add('Cambio')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.capacidade;
    if (value != null) {
      result
        ..add('Capacidade')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.imgCar;
    if (value != null) {
      result
        ..add('imgCar')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bagagem;
    if (value != null) {
      result
        ..add('bagagem')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.group;
    if (value != null) {
      result
        ..add('group')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.arCondicionado;
    if (value != null) {
      result
        ..add('ArCondicionado')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.abs;
    if (value != null) {
      result
        ..add('Abs')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.airbag;
    if (value != null) {
      result
        ..add('Airbag')
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
  CarrosRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CarrosRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'Name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Cambio':
          result.cambio = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Capacidade':
          result.capacidade = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'imgCar':
          result.imgCar = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'bagagem':
          result.bagagem = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'group':
          result.group = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'ArCondicionado':
          result.arCondicionado = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'Abs':
          result.abs = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'Airbag':
          result.airbag = serializers.deserialize(value,
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

class _$CarrosRecord extends CarrosRecord {
  @override
  final String? name;
  @override
  final String? cambio;
  @override
  final String? capacidade;
  @override
  final String? imgCar;
  @override
  final int? bagagem;
  @override
  final String? group;
  @override
  final bool? arCondicionado;
  @override
  final bool? abs;
  @override
  final bool? airbag;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$CarrosRecord([void Function(CarrosRecordBuilder)? updates]) =>
      (new CarrosRecordBuilder()..update(updates))._build();

  _$CarrosRecord._(
      {this.name,
      this.cambio,
      this.capacidade,
      this.imgCar,
      this.bagagem,
      this.group,
      this.arCondicionado,
      this.abs,
      this.airbag,
      this.ffRef})
      : super._();

  @override
  CarrosRecord rebuild(void Function(CarrosRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CarrosRecordBuilder toBuilder() => new CarrosRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CarrosRecord &&
        name == other.name &&
        cambio == other.cambio &&
        capacidade == other.capacidade &&
        imgCar == other.imgCar &&
        bagagem == other.bagagem &&
        group == other.group &&
        arCondicionado == other.arCondicionado &&
        abs == other.abs &&
        airbag == other.airbag &&
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
                            $jc(
                                $jc($jc($jc(0, name.hashCode), cambio.hashCode),
                                    capacidade.hashCode),
                                imgCar.hashCode),
                            bagagem.hashCode),
                        group.hashCode),
                    arCondicionado.hashCode),
                abs.hashCode),
            airbag.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CarrosRecord')
          ..add('name', name)
          ..add('cambio', cambio)
          ..add('capacidade', capacidade)
          ..add('imgCar', imgCar)
          ..add('bagagem', bagagem)
          ..add('group', group)
          ..add('arCondicionado', arCondicionado)
          ..add('abs', abs)
          ..add('airbag', airbag)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class CarrosRecordBuilder
    implements Builder<CarrosRecord, CarrosRecordBuilder> {
  _$CarrosRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _cambio;
  String? get cambio => _$this._cambio;
  set cambio(String? cambio) => _$this._cambio = cambio;

  String? _capacidade;
  String? get capacidade => _$this._capacidade;
  set capacidade(String? capacidade) => _$this._capacidade = capacidade;

  String? _imgCar;
  String? get imgCar => _$this._imgCar;
  set imgCar(String? imgCar) => _$this._imgCar = imgCar;

  int? _bagagem;
  int? get bagagem => _$this._bagagem;
  set bagagem(int? bagagem) => _$this._bagagem = bagagem;

  String? _group;
  String? get group => _$this._group;
  set group(String? group) => _$this._group = group;

  bool? _arCondicionado;
  bool? get arCondicionado => _$this._arCondicionado;
  set arCondicionado(bool? arCondicionado) =>
      _$this._arCondicionado = arCondicionado;

  bool? _abs;
  bool? get abs => _$this._abs;
  set abs(bool? abs) => _$this._abs = abs;

  bool? _airbag;
  bool? get airbag => _$this._airbag;
  set airbag(bool? airbag) => _$this._airbag = airbag;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  CarrosRecordBuilder() {
    CarrosRecord._initializeBuilder(this);
  }

  CarrosRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _cambio = $v.cambio;
      _capacidade = $v.capacidade;
      _imgCar = $v.imgCar;
      _bagagem = $v.bagagem;
      _group = $v.group;
      _arCondicionado = $v.arCondicionado;
      _abs = $v.abs;
      _airbag = $v.airbag;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CarrosRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CarrosRecord;
  }

  @override
  void update(void Function(CarrosRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CarrosRecord build() => _build();

  _$CarrosRecord _build() {
    final _$result = _$v ??
        new _$CarrosRecord._(
            name: name,
            cambio: cambio,
            capacidade: capacidade,
            imgCar: imgCar,
            bagagem: bagagem,
            group: group,
            arCondicionado: arCondicionado,
            abs: abs,
            airbag: airbag,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
