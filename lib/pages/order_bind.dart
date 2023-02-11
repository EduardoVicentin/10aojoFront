import 'package:abc_tech_app/controller/order_controller.dart';
import 'package:abc_tech_app/service/geolocation.service.dart';
import 'package:get/get.dart';

class OrderBind extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<OrderController>(() => OrderController(GeolocatorService()));
  }

}