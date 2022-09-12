import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:group_radio_button/group_radio_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var costController = new TextEditingController();
  String servicePercentage = "Amazing (20%)";
  List<String> servicePercentageList = [
    "Amazing (20%)",
    "Good (18%)",
    "Okay (15%)"
  ];
  bool roundUp = false;
  double tipAmount = 0;
  int tipAmountInt = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tip Time'),
      ),
      body: ListView(
        children: [
          SizedBox(height: 14),
          ListTile(
            leading: Icon(Icons.room_service),
            title: Padding(
              padding: EdgeInsets.only(right: 24),
              child: TextField(
                controller: costController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Cost of service'),
                keyboardType: TextInputType.number,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.dinner_dining),
            title: Text("How was the service?"),
          ),
          Padding(
            padding: EdgeInsets.only(left: 60),
            child: RadioGroup<String>.builder(
              groupValue: servicePercentage,
              onChanged: (value) => setState(() {
                servicePercentage = value as String;
              }),
              items: servicePercentageList,
              itemBuilder: (item) => RadioButtonBuilder(
                item,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  RichText(
                    text: WidgetSpan(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: Padding(
                          padding: EdgeInsets.only(left: 18),
                          child: Icon(
                            Icons.credit_card,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 18),
                    child: Text(" Round Up Tip"),
                  ),
                ],
              ),
              Switch(
                value: roundUp,
                onChanged: (value) {
                  setState(() {
                    roundUp = value;
                  });
                },
              ),
            ],
          ),
          Padding(
              padding: EdgeInsets.all(18),
              child: MaterialButton(
                child: Text("CALCULATE"),
                onPressed: _tipCalculation,
                color: Colors.green,
                textColor: Colors.white,
              )),
          Padding(
            padding: EdgeInsets.all(18),
            child: roundUp
                ? Text(
                    "Tip amount: \$$tipAmountInt",
                    textAlign: TextAlign.center,
                  )
                : Text(
                    "Tip amount: \$$tipAmount",
                    textAlign: TextAlign.center,
                  ),
          ),
        ],
      ),
    );
  }

  void _tipCalculation() {
    double cost = double.parse(costController.text);
    if (servicePercentage == "Amazing (20%)") {
      tipAmount = cost * .20;
    } else if (servicePercentage == "Good (18%)") {
      tipAmount = cost * .18;
    } else if (servicePercentage == "Okay (15%)") {
      tipAmount = cost * .15;
    }
    if (roundUp == true) {
      tipAmountInt = tipAmount.ceil();
    }
    setState(() {});
  }
}
