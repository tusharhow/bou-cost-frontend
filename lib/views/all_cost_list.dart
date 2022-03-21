import 'package:bou_cost/models/cost_list_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/cost_controller.dart';

class AllCostList extends StatelessWidget {
  const AllCostList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Cost'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Consumer<CostController>(builder: (context, value, _) {
            return FutureBuilder<CostListModel>(
                future: value.getCost(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.data.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Dismissible(
                              background: Container(
                                color: Colors.red,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                ),
                                alignment: Alignment.centerRight,
                              ),
                              key: Key(snapshot.data!.data[index].id),
                              onDismissed: (direction) {
                                value.deleteCost(snapshot.data!.data[index].id);
                              },
                              child: Card(
                                  margin: EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            snapshot.data!.data[index].costType,
                                            style: TextStyle(
                                              fontSize: 20,
                                            ),
                                          ),
                                          Spacer(),
                                          Column(
                                            children: [
                                              Text(
                                                "\$${snapshot.data!.data[index].cost.toString()}",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        snapshot
                                            .data!.data[index].costDescription,
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                });
          }),
        ],
      ),
    );
  }
}
