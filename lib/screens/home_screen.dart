import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodtrack/custom_widgets/custom_button.dart';
import 'package:foodtrack/custom_widgets/input_field.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController foodNameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController caloriesController = TextEditingController();

  bool isLoading = false;

  Future<void> calculateCalories() async {
    setState(() {
      isLoading = true;
    });

    try {
      print('Food Name: ${foodNameController.text}');
      print('Quantity: ${quantityController.text}');

      final response = await http.post(
        Uri.parse(
            'http://127.0.0.1:5000/calculate_calories'), // Replace with your API URL
        headers: {'Content-Type': 'application/json'},
        
        body: json.encode({
          'food_name': foodNameController.text,
          'quantity': quantityController.text,
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print(response.body);
        setState(() {
          caloriesController.text = data['calories'].toString();
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to calculate calories')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomInputField(
                  controller: foodNameController,
                  hintText: "Enter your Food Name",
                  labelText: "Food Name",
                  isRequired: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomInputField(
                  controller: quantityController,
                  hintText: "Enter your Quantity",
                  labelText: "Quantity (gram / litre)",
                  isRequired: true,
                ),
              ),
              isLoading
                  ? CircularProgressIndicator()
                  : CustomInstButton(
                      text: "Calculate Calories",
                      onPressed: (){
                        print('Food Name: ${foodNameController.text}');
                        print('Quantity: ${quantityController.text}');
                        calculateCalories();
                      },
                    ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomInputField(
                  controller: caloriesController,
                  hintText: "calories",
                  labelText: "Calories",
                  isRequired: true,
                ),
              ),
              CustomInstButton(
                text: "Submit",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
