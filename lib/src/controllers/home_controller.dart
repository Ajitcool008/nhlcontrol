import 'package:get/get.dart';
import 'package:nhlcontrol/src/models/nhl_response_model.dart';
import 'package:nhlcontrol/src/utils/helpers/appSnackbar.dart';
import 'package:nhlcontrol/src/utils/networks/network_manager.dart';

class HomeScreenController extends GetxController {
  Rx<NhlResponseModel?> nhlData = NhlResponseModel().obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    await NetworkManager.instance.getDio().get('20192020').then((rawResponse) async {
      nhlData.value = NhlResponseModel.fromJson(rawResponse.data);
      update();
    }).onError((error, stackTrace) {
      AppSnackbar.showSnackbar('Error', 'Something went wrong', AlertType.error);
    });
  }
}
