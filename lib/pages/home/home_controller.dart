import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:flutter_test1/models/user_model.dart';
import 'package:flutter_test1/services/repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  int page = 1;

  RxBool isLoading = false.obs;

  RxList<Data> users = <Data>[].obs;

  Repository repo = Get.find<Repository>();

  void getUserData() {
    isLoading.value = true;
    repo.fetchUsers(page).then((value) {
      if (value.data!.isNotEmpty) {
        users.addAll(value.data!);
        isLoading.value = false;
        refresh();
      }
    });
  }

  void toggleHighlight(Data user) {
    if (user.isHighlighted == true) {
      user.isHighlighted = false;
    } else {
      user.isHighlighted = true;
    }

    refresh();
  }

  @override
  void onInit() {
    super.onInit();
    getUserData();
  }
}
