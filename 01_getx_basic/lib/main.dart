import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Tony',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: const HomePage(),
      getPages: [
        GetPage(name: "/course-page", page: () => const PageThree()),
        GetPage(name: "/more-page/:data", page: () => const PageFour())
      ],
    );
  }
}

// Home Screen
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(40),
                  ),
                  gradient: LinearGradient(
                    colors: [Colors.grey.shade900, Colors.grey.shade600, Colors.grey.shade900],
                  )),
              child: const Center(
                child: Text(
                  "GetX",
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
                child: Container(
                    width: MediaQuery.of(context).size.width - 20,
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      autocorrect: true,
                      decoration: InputDecoration(
                        hintText: 'Search GetX..',
                        hintStyle: const TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white70,
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                          borderSide: BorderSide(color: Colors.grey.shade100),
                        ),
                      ),
                    ))),
            const SizedBox(
              height: 50,
            ),
            //GetX start from here
            RichText(
                text: TextSpan(
                    text: 'First GetX',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.to(() => const PageOne());
                      },
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 30))),
            const SizedBox(
              height: 10,
            ),
            //Explore GetX
            RichText(
                text: TextSpan(
                    text: 'Explore GetX',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.to(() => const PageTwo(), arguments: {
                          'price': Random().nextInt(10000).toString(),
                          'text': 'The price is Canadian Dollar.'
                        });
                      },
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 30))),
            const SizedBox(
              height: 50,
            ),
            const Divider(),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Navigate named routes ${Random().nextInt(10000)}',
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 30,
            ),
            //last two routes/bottons
            Expanded(
                child: Container(
              height: 300,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                ),
                gradient: LinearGradient(colors: [Colors.grey, Colors.black, Colors.grey]),
              ),
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: 200,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Colors.grey.shade300,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          onPressed: () {
                            Get.toNamed('/course-page', arguments: {
                              'price': Random().nextInt(10000).toString(),
                              'text': 'The price is Canadian Dollar.'
                            });
                          },
                          child: Text(
                            "Course",
                            style: TextStyle(fontSize: 20, color: Colors.grey.shade900),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Container(
                      width: 200,
                      height: 70,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Color(0xFffbc33e)),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Colors.grey.shade300,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        onPressed: () {
                          Get.toNamed('/more-page/${Random().nextInt(10000)}');
                        },
                        child: Text(
                          "More",
                          style: TextStyle(fontSize: 20, color: Colors.grey.shade900),
                        ),
                      ),
                    ))
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}

// Page One
class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 200,
          height: 70,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: const Color(0xFffbc33e)),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Colors.grey.shade300,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            onPressed: () {
              Get.back();
            },
            child: Text(
              "Home",
              style: TextStyle(fontSize: 20, color: Colors.grey.shade900),
            ),
          ),
        ),
      ),
    );
  }
}

// Page Two
class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Two'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.grey.shade900, //change your color here
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("\$${Get.arguments["price"] ?? 'Exploration Page'}"),
            Text("${Get.arguments["text"] ?? 'Exploration Page'}")
          ],
        ),
      ),
    );
  }
}

// Page Three
class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black26),
        title: const Text(
          'Course Page',
          style: TextStyle(fontSize: 30, color: Colors.grey),
        ),
      ),
      body: Center(
        child: Text(
          "Course price is \$${Get.arguments['price'] ?? '0'}",
          style: TextStyle(fontSize: 30, color: Colors.grey.shade600),
        ),
      ),
    );
  }
}

// Page Four
class PageFour extends StatelessWidget {
  const PageFour({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black26,
        ),
        title: const Text('Page Four'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.transparent,
              ),
              onPressed: () {
                Get.to(const PageFive());
              },
              child: const Text(
                "Go to",
                style: TextStyle(fontSize: 40, color: Colors.grey),
              ),
            ),
            const Divider(),
            Text(
              "The parameter is ${Get.parameters['data'] ?? ''}",
              style: const TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}

class PageFive extends StatelessWidget {
  const PageFive({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page Five"),
      ),
      body: Center(
          child: Container(
        width: 200,
        height: 70,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: const Color(0xFffbc33e)),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.grey.shade300,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          onPressed: () {
            Get.to(() => const HomePage());
          },
          child: Text(
            "Home",
            style: TextStyle(fontSize: 20, color: Colors.grey.shade900),
          ),
        ),
      )),
    );
  }
}
