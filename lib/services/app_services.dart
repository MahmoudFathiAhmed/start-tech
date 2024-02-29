import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:mahmoud_fathi_start_tech_task/core/utils/network_constants.dart';
import 'package:mahmoud_fathi_start_tech_task/core/utils/values_manager.dart';
import 'package:mahmoud_fathi_start_tech_task/models/auth_model.dart';
import 'package:mahmoud_fathi_start_tech_task/models/error_model.dart';

class AppServices {
  static Future<Either<ErrorModel, AuthModel>> registerRequest(
      {required String name,
      required String email,
      required String phone,
      required String password,
      required String countryCode,
      required String confirmPassword}) async {
    var response = await http.post(Uri.parse(register), body: {
      "name": name,
      "email": email,
      "phone": phone,
      "password": password,
      "country_code": countryCode,
      "password_confirm": confirmPassword
    });

    if (response.statusCode == AppInt.i201) {
      var jsonData = jsonDecode(response.body);
      return Right(AuthModel.fromJson(jsonData));
    } else {
      var jsonData = jsonDecode(response.body);
      return Left(ErrorModel.fromJson(jsonData));
    }
  }

  static Future<Either<ErrorModel, AuthModel>> loginRequest({
    required String email,
    required String password,
  }) async {
    var response = await http.post(Uri.parse(login), body: {
      "email": email,
      "password": password,
    });

    if (response.statusCode == AppInt.i200) {
      var jsonData = jsonDecode(response.body);
      return Right(AuthModel.fromJson(jsonData));
    } else {
      var jsonData = jsonDecode(response.body);
      return Left(ErrorModel.fromJson(jsonData));
    }
  }
  static Future<Either<ErrorModel, AuthModel>> updateInfoRequest(
      {required String name,
        required String email,
        required String phone,
        required String countryCode,
        required String token}) async {
    var response = await http.post(Uri.parse(updateInfo), body: {
      "name": name,
      "email": email,
      "phone": phone,
      "country_code": countryCode,
    },
        headers: {
          'Authorization': 'Bearer $token',
        }
    );

    if (response.statusCode == AppInt.i200) {
      var jsonData = jsonDecode(response.body);
      return Right(AuthModel.fromJson(jsonData));
    } else {
      var jsonData = jsonDecode(response.body);
      return Left(ErrorModel.fromJson(jsonData));
    }
  }
  static Future<ErrorModel> delete(
      {required String token}) async {
    var response = await http.delete(Uri.parse(deleteUser),
        headers: {
          'Authorization': 'Bearer $token',
        }
    );
    if (response.statusCode == AppInt.i200) {
      var jsonData = jsonDecode(response.body);
      return ErrorModel.fromJson(jsonData);
    }else{
      return ErrorModel.fromJson(jsonDecode(response.body));
    }
  }
}
