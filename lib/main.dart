import 'package:flutter/material.dart';
import 'package:money_converter/Currency.dart';
import 'package:money_converter/money_converter.dart';
//import 'package:money_converter/Currency.dart';
//import 'package:money_converter/money_converter.dart';

void main()
{
  runApp(MaterialApp(
    home: demo(),
  ));
}
class demo extends StatefulWidget {
  const demo({Key? key}) : super(key: key);

  @override
  State<demo> createState() => _demoState();
}

class _demoState extends State<demo> {
  String? uc;
  @override
  void initState() {
    super.initState();
    getmoney();
  }
  getmoney()
  async {
    var usdConvert = await MoneyConverter.convert(
        Currency(Currency.USD, amount: 2000), Currency(Currency.EUR,amount: 200));
    setState(() {
      uc = usdConvert.toString();
    });
    print(usdConvert);
    print(uc);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Currency Converter"),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50,),
            Container(
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent, width: 2)),
                      child: Text("India",
                        style: TextStyle(letterSpacing: 2, fontSize: 15),)),
                  Icon(Icons.cached, color: Colors.blueAccent,),
                  Container(decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent, width: 2)),
                      child: Text("usa",
                        style: TextStyle(letterSpacing: 2, fontSize: 15),)),

                ],
              ),
            ),
            SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextField(keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "India",
                      border: OutlineInputBorder()
                  )
              ),
            ),
            SizedBox(height: 15,),

            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Align(alignment: Alignment.centerLeft,
                child: DropdownButton(icon: Icon(Icons.add_business),dropdownColor: Colors.blueAccent,elevation: 2,onChanged: (value) {

                },items: [
                  DropdownMenuItem(child: Row(children: [Icon(Icons.currency_rupee),Text("India")],),value: "india",),
                  DropdownMenuItem(child: Row(children: [Icon(Icons.monetization_on_outlined,color: Colors.amber,),Text("usa")],),value: "usa",),
                  DropdownMenuItem(child: Row(children: [Icon(Icons.euro),Text("brazil")],),value: "brazil",),
                ]),
              ),
            ),
            SizedBox(height: 15,),

            Container(
              margin: EdgeInsets.only(top: 100),
                height: 100,
                width: 300,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(width: 2, color: Colors.blueAccent)
                ),
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Result", style: TextStyle(fontSize: 20,),
                      textAlign: TextAlign.center,),

                    Text("$uc", style: TextStyle(fontSize: 20,),
                      textAlign: TextAlign.center,),
                  ],
                )
            )
          ],
        ),
      ),
    );
  }

}
