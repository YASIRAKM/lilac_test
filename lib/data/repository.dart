import 'dart:convert';
import 'dart:developer';

import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:lilac_machine_test/core/constants/api_strings.dart';
import 'package:lilac_machine_test/core/utils/shared_preference_helper.dart';
import 'package:lilac_machine_test/feateres/requirements/model/requirements_model.dart';

class ApiHelper {
  static Future<(bool, String)> login(
      {required String email, required String password}) async {
    try {
      var res = await http.post(Uri.parse(loginUrl), body: {
        "email": email,
        "password": password,
      });

      if (res.statusCode == HttpStatus.ok) {
        var body = jsonDecode(res.body);
        await SharedPreferenceHelper.saveValue(
            key: "token", value: body["token"]);
        await SharedPreferenceHelper.saveValue(
            key: "id", value: body["data"]["id"].toString());
        return (true, "login completed");
      } else {
        return (false, "failed to login");
      }
    } catch (e) {
      throw Exception(e);
    }
  }

/* get requirements */
  static Future<List<VenderRequirements>> getRequirements() async {
    try {
      String token = await SharedPreferenceHelper.getValue(key: "token") ?? "";
      var res = await http.get(Uri.parse(getVendorRequirementsUrl),
          headers: {"Authorization": "Baerer $token"});
      log(res.body);
      if (res.statusCode == 200) {
        var body = jsonDecode(res.body);
        return venderRequirementsFromJson(jsonEncode(body["data"]));
      } else {
        throw Exception("failed");
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
