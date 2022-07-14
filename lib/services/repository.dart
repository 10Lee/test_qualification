import 'package:flutter_test1/global/variables.dart';
import 'package:flutter_test1/models/user_model.dart';
import 'package:get/get.dart';

class Repository extends GetConnect {
  Future<UserModel> fetchUsers(int page) async {
    try {
      final Response response = await get(
        Global.baseurl,
        query: {
          'page': '$page',
        },
      );

      print("RESPONSE : ${response.body}");

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.body);
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception();
    }
  }

  Future<Data> fetchUserDetail(int userId) async {
    try {
      final Response response = await get('${Global.baseurl}/$userId');
      print(response.body['data']);
      if (response.statusCode == 200) {
        return Data.fromJson(response.body['data']);
      } else {
        print("RESPONSE FAILED");
        throw Exception();
      }
    } catch (e) {
      throw Exception();
    }
  }
}
