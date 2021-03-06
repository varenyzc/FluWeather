import 'package:fluweather/app/widgets/loading_dialog.dart';
import 'package:get/get.dart';

extension GetExtension on GetInterface {
  dismiss() {
    if(Get.isDialogOpen) {
      Get.back();
    }
  }
  
  loading() {
    if(Get.isDialogOpen) {
      Get.back();
    }
    Get.dialog(LoadingDialog());
  }
}