import 'package:flutter_test1/models/user_model.dart';
import 'package:flutter_test1/pages/home/home_controller.dart';
import 'package:flutter_test1/services/repository.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isHighlight = false.obs;

  RxInt detailId = 0.obs;
  // RxString detailFirstName = ''.obs;
  // RxString detailLastName = ''.obs;
  // RxString detailAvatar = ''.obs;
  // RxString detailEmail = ''.obs;

  Rx<Data> userDetail = Rx(Data());

  Repository repo = Get.find<Repository>();

  void getUserDetail(int id) {
    isLoading.value = true;
    repo.fetchUserDetail(id).then(
      (value) {
        if (value != null) {
          print("VALUE : ${value.id}");
          userDetail.value = Data(
              id: value.id,
              firstName: value.firstName,
              lastName: value.lastName,
              avatar: value.avatar,
              email: value.email,
              isHighlighted: value.isHighlighted);
          isLoading.value = false;
        }
      },
    );
  }

  HomeController homeController = Get.find<HomeController>();

  void toggleHighlight(int id) {
    var users = homeController.users.firstWhereOrNull((e) => e.id == id);

    if (users!.isHighlighted == true) {
      users.isHighlighted = false;
    } else {
      users.isHighlighted = true;
    }
    Get.offAndToNamed('/');
  }

  @override
  void onInit() {
    super.onInit();
    getUserDetail(Get.arguments['id']);
  }
}
