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
  RxBool detailIsHighlight = false.obs;

  Repository repo = Get.find<Repository>();

  void getUserDetail() {
    isLoading.value = true;
    repo.fetchUserDetail(Get.arguments['id']).then((value) {
      if (value != null) {
        detailId.value = value.id!;
        detailFirstName.value = value.firstName!;
        detailLastName.value = value.lastName!;
        detailAvatar.value = value.avatar!;
        detailEmail.value = value.email!;
        detailIsHighlight.value = value.isHighlighted!;
        isLoading.value = false;
        refresh();
      }
    });
  }

  void toggleHighlight(bool isHighlighted) {
    if (isHighlighted == true) {
      isHighlighted = false;
    } else {
      isHighlighted = true;
    }

    refresh();
  }

  @override
  void onInit() {
    super.onInit();
    getUserDetail();
  }
}
