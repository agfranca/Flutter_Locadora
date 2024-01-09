import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'reservar_record.g.dart';

abstract class ReservarRecord
    implements Built<ReservarRecord, ReservarRecordBuilder> {
  static Serializer<ReservarRecord> get serializer =>
      _$reservarRecordSerializer;

  String? get nameCar;

  String? get imgCarReserva;

  String? get groupNameCar;

  DateTime? get dateRetir;

  DateTime? get dateEntr;

  String? get localRet1;

  String? get localdev2;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ReservarRecordBuilder builder) => builder
    ..nameCar = ''
    ..imgCarReserva = ''
    ..groupNameCar = ''
    ..localRet1 = ''
    ..localdev2 = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reservar');

  static Stream<ReservarRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ReservarRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ReservarRecord._();
  factory ReservarRecord([void Function(ReservarRecordBuilder) updates]) =
      _$ReservarRecord;

  static ReservarRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createReservarRecordData({
  String? nameCar,
  String? imgCarReserva,
  String? groupNameCar,
  DateTime? dateRetir,
  DateTime? dateEntr,
  String? localRet1,
  String? localdev2,
}) {
  final firestoreData = serializers.toFirestore(
    ReservarRecord.serializer,
    ReservarRecord(
      (r) => r
        ..nameCar = nameCar
        ..imgCarReserva = imgCarReserva
        ..groupNameCar = groupNameCar
        ..dateRetir = dateRetir
        ..dateEntr = dateEntr
        ..localRet1 = localRet1
        ..localdev2 = localdev2,
    ),
  );

  return firestoreData;
}
