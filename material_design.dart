import 'package:flutter/material.dart';

class MaterialDesign extends StatefulWidget {
  const MaterialDesign({super.key});

  @override
  State<MaterialDesign> createState() {
    return _CurrencyConverter();
  }
}

class _CurrencyConverter extends State<MaterialDesign> {
  final TextEditingController myController = TextEditingController();
  double result = 0;

  void convert() {
    setState(() {
      result = double.parse(myController.text) * 83;
    });
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.black,
        width: 2.0,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.circular(10),
    );

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 61, 80, 88),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 61, 80, 88),
        elevation: 0.0,
        title: const Text(
          'Currency Converter',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'INR ${result != 0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0)}',
              style: const TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: myController,
                style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                decoration: InputDecoration(
                  hintText: "Please enter the amount",
                  hintStyle:
                      const TextStyle(color: Color.fromARGB(255, 79, 72, 72)),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 255, 255, 255),
                  prefixIcon: const Icon(Icons.monetization_on_outlined),
                  prefixIconColor: Colors.black,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextButton(
                onPressed: convert,
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(150, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Convert',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
