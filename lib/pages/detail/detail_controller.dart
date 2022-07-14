import 'package:flutter_test1/models/user_model.dart';
import 'package:flutter_test1/services/repository.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  RxBool isLoading = false.obs;
  RxInt detailId = 0.obs;
  RxString detailFirstName = ''.obs;
  RxString detailLastName = ''.obs;
  RxString detailAvatar = ''.obs;
  RxString detailEmail = ''.obs;

  Repository repo = Get.find<Repository>();

  void getUserDetail(int id) {
    isLoading.value = true;
    repo.fetchUserDetail(id).then(
      (value) {
        if (value != null) {
          print("VALUE : ${value.id}");
          detailId.value = value.id!;
          detailFirstName.value = value.firstName!;
          detailLastName.value = value.lastName!;
          detailAvatar.value = value.avatar!;
          detailEmail.value = value.email!;
          isLoading.value = false;
        }
      },
    );
  }

  void toggleHighlight(bool isHighlighted) {
    if (isHighlighted == true) {
      isHighlighted = false;
    } else {
      isHighlighted = true;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getUserDetail(Get.arguments['id']);
  }
}
