import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/assist.dart';
import '../provider/assist_provider.dart';

class AssistService extends GetxService{
  late AssistProviderInterface _assistProvider;
  Future<List<Assist>> getAssists() async{
    
    Response response = await _assistProvider.getAssist();

    if(response.hasError){
      //erro
      return Future.error(ErrorDescription("Erro de Conexão"));
    }
    try
    {
      List<Assist> listResult = response.body.map<Assist>((item)=>Assist.fromMap(item)).toList();
      return Future.sync(() => listResult);
    }
    catch(e){
          e.printInfo();
         return Future.error(ErrorDescription("Erro no retorno da lista de Assistência. ${e.toString()}"));
    }

  }

  Future <AssistService> init(AssistProviderInterface providerInterface) async{
    _assistProvider = providerInterface;
    return this;
  }

}