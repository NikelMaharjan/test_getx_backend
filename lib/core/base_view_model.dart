import 'package:get/get.dart';

class BaseViewModel extends GetxController
{
  bool _busy = false;
  bool get busy => _busy;

  void setBusy (bool val){
    _busy = val;
    update();
  }
}