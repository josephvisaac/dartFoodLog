import 'package:flutter/material.dart';
import './homeBody.dart';
import './cfClass.dart'; //calorie/food Class
import 'package:string_validator/string_validator.dart'; //string validation tools

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String errorMsg = 'field required'; //errMsg cal
  String ferrorMsg = 'field required'; //food errMsg
  bool isNameValid = true; //food validation
  bool isCalValid = true; //calories validation
  int total = 0; //total calories

  List<CfClass> theLIST = []; //list of foods and calories

  foodSubmission(foodSubmissionText, calController) {
    print('\nSubmission food: $foodSubmissionText');
    print('It\'s me ${calController.text}');

    if (calController.text.length > 0 && foodSubmissionText != '') {
      int calories = int.parse(
          calController.text); //converts string into int, for the calories
      setState(() {
        theLIST.add(CfClass(food: foodSubmissionText, calories: calories));
        total += calories;
      });
    }
  }

  calSubmission(calSubmissionText, foodController) {
    print('\nSubmission calories: $calSubmissionText');
    print('foodController: ${foodController.text}');
    if (foodController.text.length > 0) {
      //if food text has content
      int calText = int.parse(
          calSubmissionText); //converts string into int, for the calories
      setState(() {
        theLIST.add(CfClass(calories: calText, food: foodController.text));
        total += calText;
      });
    }
  }
//change
  foodValidation(food) {
    if (food.isEmpty) {
      setState(() {
        isNameValid = false;
      });
    } else {
      setState(() {
        isNameValid = true;
      });
    }
  }

  caloriesValidation(calories) {
    if (calories.isEmpty) {
      setState(() {
        isCalValid = false;
        errorMsg = 'field required';
      });
    } else if (isAlpha(calories)) {
      setState(() {
        isCalValid = false;
        errorMsg = 'must be a number';
      });
    } else
      setState(() {
        isCalValid = true;
      });
  }

  @override
  Widget build(BuildContext context) {
    return HomeBody(
      isNameValid: isNameValid,
      foodSubmission: foodSubmission,
      calSubmission: calSubmission,
      isCalValid: isCalValid,
      theLIST: theLIST,
      foodValidation: foodValidation,
      caloriesValidation: caloriesValidation,
      errorMsg: errorMsg,
      ferrorMsg: ferrorMsg,
      total: total,
    );
  }
}
