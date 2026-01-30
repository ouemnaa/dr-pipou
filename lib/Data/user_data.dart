import 'package:hive/hive.dart';

// [menopause, nodecaps, degmalig, breast, breastquad, irradiate, age_min, age_max, tumor_size_min,tulor_size_max,inv_nodes_min_inv_nodes_max]
class UserData {
  //
  List userSymptoms = [];

  final _userSymptomsBox = Hive.box('usersymptoms');

  //no data initially
  void createInitialData() {
    userSymptoms = [0];
  }

  //data loaded through controllers
  void loadAll() {
    userSymptoms = _userSymptomsBox.get('usersymptoms');
  }

  //data updated from form to form
  void updateAll() {
    _userSymptomsBox.put('usersymptoms', userSymptoms);
  }
}
