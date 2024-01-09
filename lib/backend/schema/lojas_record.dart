import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'lojas_record.g.dart';

abstract class LojasRecord implements Built<LojasRecord, LojasRecordBuilder> {
  static Serializer<LojasRecord> get serializer => _$lojasRecordSerializer;

  @BuiltValueField(wireName: 'Lojaname')
  String? get lojaname;

  @BuiltValueField(wireName: 'Cidade')
  String? get cidade;

  LatLng? get distancia;

  @BuiltValueField(wireName: 'HoraFuci')
  String? get horaFuci;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(LojasRecordBuilder builder) => builder
    ..lojaname = ''
    ..cidade = ''
    ..horaFuci = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Lojas');

  static Stream<LojasRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<LojasRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  LojasRecord._();
  factory LojasRecord([void Function(LojasRecordBuilder) updates]) =
      _$LojasRecord;

  static LojasRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createLojasRecordData({
  String? lojaname,
  String? cidade,
  LatLng? distancia,
  String? horaFuci,
}) {
  final firestoreData = serializers.toFirestore(
    LojasRecord.serializer,
    LojasRecord(
      (l) => l
        ..lojaname = lojaname
        ..cidade = cidade
        ..distancia = distancia
        ..horaFuci = horaFuci,
    ),
  );

  return firestoreData;
}
