import 'package:flutter/material.dart';
import 'package:gastosappg15/db/db_helper_gastos.dart';
import 'package:gastosappg15/models/gasto_model.dart';
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

  void showSelectorDeFecha() async {
    DateTime? selectedDay = await showDatePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      initialDate: DateTime.now(),
      helpText: "Selecciona una fecha",
      cancelText: "Cancelar",
      confirmText: "Aceptar",
      fieldHintText: "dd/mm//aaaa",
      fieldLabelText: "Fecha",
      selectableDayPredicate: (day) {
        return day.weekday != DateTime.sunday; //para deshabilitar algunos días
      },
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.cyan, //Color del encabezado y la selección
              onPrimary: Colors.white, //texto encabezado
              onSurface: Colors.black, //texto calendario
            ),
            dialogTheme: DialogThemeData(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(20),
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (selectedDay != null) {
      dateController.text =
          "${selectedDay.day}/${selectedDay.month}/${selectedDay.year}";
    }
    setState(() {});
  }

  Widget _buildAddButton() {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
        onPressed: () {
          GastoModel gastoModel = GastoModel(
            title: titleContoller.text.trim(),
            price: double.tryParse(priceControler.text.trim()) ?? 0,
            dateTime: dateController.text.trim(),
            type: typeSelected,
          );

          DbHelperGastos.instance.insertGasto(gastoModel).then((res) {
            if (res > 0) {
              // Se ha insertado correctamente
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.cyan,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(16),
                  ),
                  content: Text("Se ha registrado correctamente"),
                ),
              );
              Navigator.pop(context);
            }
          });
        },
        child: Text("Añadir", style: TextStyle(color: Colors.white)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text("Registra tu pago", style: TextStyle(fontSize: 22)),
            SizedBox(height: 12),
            FieldWidget(
              controller: titleContoller,
              hintText: "Ingresa el título",
            ),
            FieldWidget(
              controller: priceControler,
              hintText: "Ingresa el monto",
            ),
            FieldWidget(
              controller: dateController,
              hintText: "Ingresa la fecha",
              function: showSelectorDeFecha,
            ),
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
            SizedBox(height: 8),

            _buildAddButton(),
          ],
        ),
      ),
    );
  }
}
