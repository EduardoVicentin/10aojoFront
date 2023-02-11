import 'package:abc_tech_app/controller/order_controller.dart';
import 'package:abc_tech_app/model/assist.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class OrderPage extends GetView<OrderController>
{
  const OrderPage({Key? key}) : super (key: key);

Widget _renderAssists (List<Assist> assists){
  return ListView.builder(
    shrinkWrap: true,
    itemCount: assists.length,
    itemBuilder: (context, index) => ListTile(title: Text(assists[index].name)));

}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Formulário")),
      body: Container(
        constraints: const BoxConstraints.expand(),
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: const [Expanded(child: Text("Preecha o formulário de ordem de serviço", 
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold))),
                  ]),
                   TextFormField(controller: controller.operatorIDController,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: "Código prestador"), textAlign: TextAlign.center,
                  ),
                  Row(
                    children: [
                      const Expanded(child: Padding (
                        padding: EdgeInsets.only(top: 25, bottom: 25),
                        child: Text("Selecione as assistências a serem realizadas:",
                        textAlign: TextAlign.left, 
                        style: TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.bold)),)),
                        Ink(
                          decoration: const ShapeDecoration(
                            shape: CircleBorder(), color: Color.fromARGB(255, 73, 45, 4)),
                            width: 40,
                            height: 40,
                            child: IconButton(
                              icon: const Icon(Icons.search, color:Colors.white),
                            onPressed: () => controller.selectAssists())
                         )
                   
                    ],
                  ),
                  Obx(() => _renderAssists(controller.selectedAssists)),

                  Row (
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: controller.finishStartOrder,
                          child: const Text("Finalizar"),
                          ))
                    ],
                  )


                ],
              )),)
        )
      
    );

  }
}