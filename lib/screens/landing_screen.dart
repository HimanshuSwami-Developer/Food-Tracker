import 'package:flutter/material.dart';

class FoodListScreen extends StatelessWidget {
  final List<Map<String, dynamic>> foodData = [
    {
      'foodName': 'Apple',
      'calories': 52,
      'quantity': '100g',
      'timestamp': '10:00 AM'
    },
    {
      'foodName': 'Banana',
      'calories': 89,
      'quantity': '120g',
      'timestamp': '10:30 AM'
    },
    {
      'foodName': 'Chicken Breast',
      'calories': 165,
      'quantity': '200g',
      'timestamp': '12:00 PM'
    },
    {
      'foodName': 'Rice',
      'calories': 130,
      'quantity': '150g',
      'timestamp': '1:00 PM'
    },
    {
      'foodName': 'Milk',
      'calories': 42,
      'quantity': '250ml',
      'timestamp': '3:00 PM'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food List'),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView.builder(
        itemCount: foodData.length,
        itemBuilder: (context, index) {
          final item = foodData[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.blueAccent, Colors.blueGrey],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(4, 4),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Container(
                    color: Colors.green,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                        item['timestamp'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white60,
                        ),
                      ),
                  ),
                    
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Text(
                                item['foodName'][0],
                                style: const TextStyle(
                                  color: Colors.black38,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Food Name',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  '${item['foodName']}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                        
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Calories',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  '${item['calories']} kcal',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                          
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Quantity',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  '${item['quantity']}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
