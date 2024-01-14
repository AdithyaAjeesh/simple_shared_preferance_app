import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;
  @override
  void initState() {
    super.initState();
    checkCount();
  }

  Future<void> checkCount() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final int value = pref.getInt('countNum') ?? 0;
    setState(() {
      count = value;
    });
  }

  Future<void> increment() async {
    final value = count + 1;
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setInt('countNum', value);
    setState(() {
      count = value;
    });
  }

  Future<void> decrement() async {
    final value = count - 1;
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setInt('countNum', value);
    setState(() {
      count = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Text('the count is $count'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                increment();
              },
              child: const Text('Increment'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                decrement();
              },
              child: const Text('Decrement'),
            )
          ],
        ),
      ),
    );
  }
}
