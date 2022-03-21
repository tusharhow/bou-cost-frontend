import 'package:bou_cost/views/all_cost_list.dart';
import 'package:flutter/material.dart';

import '../controllers/cost_controller.dart';

class AddCostScreen extends StatelessWidget {
  AddCostScreen({Key? key}) : super(key: key);
  TextEditingController costController = TextEditingController();
  TextEditingController costTypeController = TextEditingController();
  TextEditingController costDateController = TextEditingController();
  TextEditingController costDescController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    CostController addCostController = CostController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Cost'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                height: 380,
                width: MediaQuery.of(context).size.width,
                child: Form(
                  key: _formKey,
                  child: Column(children: [
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                        controller: costController,
                        decoration: InputDecoration(
                          labelText: "Cost Amount",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                        controller: costTypeController,
                        decoration: InputDecoration(
                          labelText: "Cost Type",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                          controller: costDateController,
                          decoration: InputDecoration(
                            labelText: "Cost Date",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter some';
                            }
                          }),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                        controller: costDescController,
                        decoration: InputDecoration(
                          labelText: "Cost Description",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                  ]),
                ),
              ),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width / 1.2,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print("Form is valid");
                    addCostController.addCost(
                      int.parse(costController.text),
                      costTypeController.text,
                      costDateController.text,
                      costDescController.text,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Cost Added"),
                      ),
                    );
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AllCostList();
                    }));
                  } else {
                    print("Form is invalid");
                  }
                },
                child: Text("Add Cost"),
              ),
            ),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
