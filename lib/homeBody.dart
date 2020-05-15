import 'package:flutter/material.dart';
import './cfClass.dart';

class HomeBody extends StatefulWidget {
  final List<CfClass> theLIST; //List of food and calories

  final Function foodSubmission; //setState submission function
  final Function calSubmission; //setState submission function
  final Function foodValidation; //setState validation function
  final Function caloriesValidation; //setState validation function
  final bool isNameValid; //food validation
  final bool isCalValid; //calorie validation
  final String errorMsg; // errMsg cal
  final String ferrorMsg; //food errMsg
  final int total; //total calories
  HomeBody(
      {this.errorMsg,
      this.ferrorMsg,
      this.calSubmission,
      this.caloriesValidation,
      this.foodValidation,
      this.foodSubmission,
      this.isNameValid,
      this.isCalValid,
      this.total,
      this.theLIST});

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final calories = TextEditingController(); //calories controller
  final food = TextEditingController(); //food controller
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            title: Align(
              alignment: Alignment.center,
              child: Text(
                'Food List',
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.w300),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Material(
                shadowColor: Colors.green,
                elevation: 3,
                child: TextField(
                  style: TextStyle(fontSize: 25),
                  decoration: InputDecoration(
                      errorText: widget.isNameValid ? null : widget.ferrorMsg,
                      // contentPadding: EdgeInsets.only(bottom: 15, top:0 ),
                      errorStyle: TextStyle(fontSize: 20),
                      labelText: 'Food',contentPadding: EdgeInsets.only(left: 10),
                      alignLabelWithHint: true),
                  keyboardType: TextInputType.text,
                  controller: food,
                  onChanged: (food) => widget.foodValidation(food),
                  onSubmitted: (foodSubmissionText) =>
                      widget.foodSubmission(foodSubmissionText, calories),
                ),
              ),
              Container(
                
                margin: EdgeInsets.only(top: 7, bottom: 5),
                child: Material(
                  shadowColor: Colors.green,
                  elevation: 4,
                  child: TextField(
                    
                    controller: calories,
                    onSubmitted: (calSubmissionText) =>
                        widget.calSubmission(calSubmissionText, food),
                    style: TextStyle(fontSize: 25),
                    
                    onChanged: (calories) =>
                        widget.caloriesValidation(calories),
                    decoration: InputDecoration(
                        errorText: widget.isCalValid ? null : widget.errorMsg,
                        errorStyle: TextStyle(fontSize: 20),
                        labelText: 'Calories',contentPadding: EdgeInsets.only(left: 10),
                        alignLabelWithHint: true),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 25),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black45))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Text(
                        'Food',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Text(
                        'Calories',
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 25),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  height: 300,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          // Text(calories.text),
                          Container(
                            padding: EdgeInsets.only(left: 6),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "${widget.theLIST[index].food}",
                                  style: TextStyle(fontSize: 20),
                                )),
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 35),
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "${widget.theLIST[index].calories}",
                                  style: TextStyle(fontSize: 20),
                                )),
                          ),
                        ],
                      );
                    },
                    itemCount: widget.theLIST.length,
                  )),
                  Text('total calories: ${widget.total}', style: TextStyle(fontSize: 25)),
            ], //Column Children
          ),
        ),
      ),
    );
  }
}
