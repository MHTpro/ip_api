import 'dart:convert';

import 'package:http/http.dart' as httpmethod;
import 'package:my_api/model/model.dart';

Future<MainModel> getRequest(String theIp) async {
  final response = await httpmethod.get(
    Uri.https(
      "ipapi.co",
      "/$theIp/json/",
    ),
  );

  if (response.statusCode == 200) {
    return MainModel.fromJson(
      jsonDecode(response.body),
    );
  } else {
    throw Exception("Error:Can't load the data");
  }
}
