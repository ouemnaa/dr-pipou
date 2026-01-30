import 'package:hive/hive.dart';

class DoctorData {
  //
  List averageSymptoms = [];
  List seSymptoms = [];
  List worstSymptoms = [];
  final _averageBox = Hive.box('averagesymptoms');
  final _seBox = Hive.box('sesymptoms');
  final _worstBox = Hive.box('worstsymptoms');
  //no data initially

  //data loaded through controllers
  void loadAverage() {
    averageSymptoms = _averageBox.get('averagesymptoms');
  }

  void loadSE() {
    seSymptoms = _seBox.get('sesymptoms');
  }

  void loadWorst() {
    worstSymptoms = _worstBox.get('worstsymptoms');
  }

  //data updated from form to form
  void updateAverage() {
    _averageBox.put('averagesymptoms', averageSymptoms);
  }

  void updateSE() {
    _seBox.put('sesymptoms', seSymptoms);
  }

  void updateWorst() {
    _worstBox.put('worstsymptoms', worstSymptoms);
  }
  //when you click on previous page the data is
}
