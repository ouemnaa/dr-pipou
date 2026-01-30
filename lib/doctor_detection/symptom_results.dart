import 'package:drpipou/Data/doctor_data.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SymptomResults extends StatefulWidget {
  SymptomResults({super.key});

  @override
  State<SymptomResults> createState() => _SymptomResultsState();
}

class _SymptomResultsState extends State<SymptomResults> {
  var result = "results are shown here";
  late Interpreter interpreter;
  late Interpreter secinterpreter;

  final _worstBox = Hive.box('worstsymptoms');
  final _averageBox = Hive.box('averagesymptoms');
  final _seBox = Hive.box('sesymptoms');
  DoctorData db = DoctorData();

  @override
  void initState() {
    super.initState();
    print("hello");
    //loadModel();
    db.loadAverage();
    db.loadSE();
    db.loadWorst();
  }

  Future<double?> fetchPrediction(List<double> features) async {
    // Replace this with your actual ngrok URL
    final url = Uri.parse('https://f152-196-203-13-5.ngrok-free.app/predict');

    try {
      // Create the JSON data as a map
      final Map<String, double> featureMap = {
        for (var i = 0; i < features.length; i++) 'feature${i + 1}': features[i]
      };

      // Send POST request with JSON data
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode(featureMap),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['prediction']?.toDouble();
      } else {
        print('Failed to get prediction: ${response.reasonPhrase}');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  // Future<double?> fetchPrediction(
  //   double feature1,
  //   double feature2,
  //   double feature3,
  //   double feature4,
  //   double feature5,
  //   double feature6,
  //   double feature7,
  //   double feature8,
  //   double feature9,
  //   double feature10,
  //   double feature11,
  //   double feature12,
  //   double feature13,
  //   double feature14,
  //   double feature15,
  //   double feature16,
  //   double feature17,
  //   double feature18,
  //   double feature19,
  //   double feature20,
  //   double feature21,
  //   double feature22,
  //   double feature23,
  //   double feature24,
  //   double feature25,
  //   double feature26,
  //   double feature27,
  //   double feature28,
  //   double feature29,
  //   double feature30,
  // ) async {
  //   final url = Uri.parse(
  //       'https://f152-196-203-13-5.ngrok-free.app/predict?feature1=$feature1&feature2=$feature2&feature3=$feature3&feature4=$feature4&feature5=$feature5&feature6=$feature6&feature7=$feature7&feature8=$feature8&feature9=$feature9&feature10=$feature10&feature11=$feature11&feature12=$feature12&feature13=$feature13&feature14=$feature14&feature15=$feature15&feature16=$feature16&feature17=$feature17&feature18=$feature18&feature19=$feature19&feature20=$feature20&feature21=$feature21&feature22=$feature22&feature23=$feature23&feature24=$feature24&feature25=$feature25&feature26=$feature26&feature27=$feature27&feature28=$feature28&feature29=$feature29&feature30=$feature30');

  //   try {
  //     final response = await http.get(url);

  //     if (response.statusCode == 200) {
  //       final data = jsonDecode(response.body);
  //       return data['prediction'];
  //     } else {
  //       print('Failed to get prediction: ${response.reasonPhrase}');
  //       return null;
  //     }
  //   } catch (e) {
  //     print('Error: $e');
  //     return null;
  //   }
  // }

  void getPrediction() async {
    List features = db.averageSymptoms + db.seSymptoms + db.worstSymptoms;
    if (features.length == 30) {
      final prediction = await fetchPrediction([
        features[0],
        features[1],
        features[2],
        features[3],
        features[4],
        features[5],
        features[6],
        features[7],
        features[8],
        features[9],
        features[10],
        features[11],
        features[12],
        features[13],
        features[14],
        features[15],
        features[16],
        features[17],
        features[18],
        features[19],
        features[20],
        features[21],
        features[22],
        features[23],
        features[24],
        features[25],
        features[26],
        features[27],
        features[28],
        features[29],
      ]);
      print("HERERERERERERERER");
      if (prediction != null) {
        print('Prediction: $prediction');
      } else {
        print('Error retrieving prediction');
      }
    } else {
      print('Error: Not enough features provided');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(result),
          ElevatedButton(
            onPressed: getPrediction,
            child: Text("get results"),
          )
        ],
      ),
    ));
  }
}
