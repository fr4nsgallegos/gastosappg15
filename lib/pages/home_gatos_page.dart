import 'package:flutter/material.dart';
import 'package:gastosappg15/models/gasto_model.dart';
import 'package:gastosappg15/widgets/custom_card_widget.dart';
import 'package:gastosappg15/widgets/field_widget.dart';

class HomeGatosPage extends StatefulWidget {
  const HomeGatosPage({super.key});

  @override
  State<HomeGatosPage> createState() => _HomeGatosPageState();
}

class _HomeGatosPageState extends State<HomeGatosPage> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  color: Colors.black,
                  width: double.infinity,
                  height: 110,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        "Agregar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(25),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Resumen de gastos",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Gestiona tus gastos de la mejor forma",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: FieldWidget(
                            controller: _searchController,
                            hintText: "Buscar por gasto",
                          ),
                        ),

                        Expanded(
                          child: ListView.builder(
                            itemCount: 2,
                            itemBuilder: (BuildContext context, int index) {
                              return CustomCardWidget(
                                gastoModel: GastoModel(
                                  title: "Banco",
                                  price: 500,
                                  dateTime: "2026-05-06",
                                  type: "Bank",
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 90),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
