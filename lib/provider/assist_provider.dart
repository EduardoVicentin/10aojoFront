import 'package:abc_tech_app/provider/constants.dart';
import 'package:get/get.dart';

abstract class AssistProviderInterface{
  Future<Response> getAssist();
}

class AssistProvider extends GetConnect implements AssistProviderInterface{
  
  @override
  Future<Response> getAssist() => get("${Constants.url}/assists");

}