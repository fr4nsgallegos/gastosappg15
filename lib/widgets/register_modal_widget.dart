import 'package:flutter/material.dart';
import 'package:gastosappg15/utils/data_general.dart';
import 'package:gastosappg15/widgets/field_widget.dart';
import 'package:gastosappg15/widgets/item_type_widget.dart';

class RegisterModalWidget extends StatefulWidget {
  const RegisterModalWidget({super.key});

  @override
  State<RegisterModalWidget> createState() => _RegisterModalWidgetState();
}

class _RegisterModalWidgetState extends State<RegisterModalWidget> {
  TextEditingController titleContoller = TextEditingController();
  TextEditingController priceControler = TextEditingController();
  TextEditingController dateController = TextEditingController();
  String typeSelected = "Alimentos";
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: double.infinity,
      child: Column(
        children: [
          Text("Registra tu pago", style: TextStyle(fontSize: 22)),
          SizedBox(height: 12),
          FieldWidget(
            controller: titleContoller,
            hintText: "Ingresa el título",
          ),
          FieldWidget(controller: priceControler, hintText: "Ingresa el monto"),
          FieldWidget(controller: dateController, hintText: "Ingresa la fecha"),
          SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: types
                .map(
                  (type) => ItemTypeWidget(
                    data: type,
                    isSelected: typeSelected == type["name"] ? true : false,
                    tap: () {
                      typeSelected = type["name"];
                      setState(() {});
                    },
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
