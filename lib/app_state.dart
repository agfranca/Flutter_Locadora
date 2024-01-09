import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
  }

  late SharedPreferences prefs;

  String LojaRetirada = '';

  String LojaEntrega = '';

  String Cidade = '';

  DateTime? DataInicial;

  DateTime? DataFinal;

  String Horario = '';

  String Cidade2 = '';

  String Horario2 = '';

  bool abri1 = false;

  bool temDataInicio = false;

  bool temDataTermino = false;

  String nameCar = '';

  String group = '';

  String imgCar = '';

  String LocalRetirada = '';

  String LocalEntrega = '';
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
