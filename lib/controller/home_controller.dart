import 'package:get/get.dart';

class HomeController extends GetxController {
  var isSelected = 0.obs;

 void onTab(int index){
   isSelected.value = index;
 }
}
