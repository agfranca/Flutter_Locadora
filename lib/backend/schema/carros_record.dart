import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'carros_record.g.dart';

abstract class CarrosRecord
    implements Built<CarrosRecord, CarrosRecordBuilder> {
  static Serializer<CarrosRecord> get serializer => _$carrosRecordSerializer;

  @BuiltValueField(wireName: 'Name')
  String? get name;

  @BuiltValueField(wireName: 'Cambio')
  String? get cambio;

  @BuiltValueField(wireName: 'Capacidade')
  String? get capacidade;

  String? get imgCar;

  int? get bagagem;

  String? get group;

  @BuiltValueField(wireName: 'ArCondicionado')
  bool? get arCondicionado;

  @BuiltValueField(wireName: 'Abs')
  bool? get abs;

  @BuiltValueField(wireName: 'Airbag')
  bool? get airbag;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(CarrosRecordBuilder builder) => builder
    ..name = ''
    ..cambio = ''
    ..capacidade = ''
    ..imgCar = ''
    ..bagagem = 0
    ..group = ''
    ..arCondicionado = false
    ..abs = false
    ..airbag = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Carros');

  static Stream<CarrosRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CarrosRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  CarrosRecord._();
  factory CarrosRecord([void Function(CarrosRecordBuilder) updates]) =
      _$CarrosRecord;

  static CarrosRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCarrosRecordData({
  String? name,
  String? cambio,
  String? capacidade,
  String? imgCar,
  int? bagagem,
  String? group,
  bool? arCondicionado,
  bool? abs,
  bool? airbag,
}) {
  final firestoreData = serializers.toFirestore(
    CarrosRecord.serializer,
    CarrosRecord(
      (c) => c
        ..name = name
        ..cambio = cambio
        ..capacidade = capacidade
        ..imgCar = imgCar
        ..bagagem = bagagem
        ..group = group
        ..arCondicionado = arCondicionado
        ..abs = abs
        ..airbag = airbag,
    ),
  );

  return firestoreData;
}
