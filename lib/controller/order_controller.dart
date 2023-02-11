import 'dart:developer';
import 'package:abc_tech_app/model/assist.dart';
import 'package:abc_tech_app/service/geolocation.service.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class OrderController extends GetxController{
  final GeolocatorService _geolocationService;
  final formKey = GlobalKey<FormState>();
  final operatorIDController = TextEditingController();
  final selectedAssists = <Assist>[].obs;

  OrderController(this._geolocationService);

  @override
  void onInit() {    
    super.onInit();
    _geolocationService.start();
  }

  getLocation () {
    _geolocationService.getPosition().then((value) => log(value.toJson().toString()));
  }

  finishStartOrder(){
    log("Teste");

  }
  selectAssists(){
    Get.toNamed("/assists", arguments: selectedAssists);
  }

  

}