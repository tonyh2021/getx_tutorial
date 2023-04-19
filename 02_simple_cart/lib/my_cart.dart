import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_cart/my_controller.dart';
import 'package:simple_cart/total_page.dart';

class MyCart extends StatelessWidget {
  MyCart({Key? key}) : super(key: key);
  final MyController _c = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              const Text(
                "Books",
                style: TextStyle(fontSize: 30, color: Colors.amber),
              ),
              Expanded(child: Container()),
              Material(
                borderRadius: BorderRadius.circular(25),
                color: Colors.redAccent,
                child: IconButton(
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    _c.increment();
                  },
                  // ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 50,
                child: Center(
                  child: Obx(() => Text(
                        _c.books.toString(),
                        style: const TextStyle(fontSize: 30),
                      )),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Material(
                borderRadius: BorderRadius.circular(25),
                color: Colors.redAccent,
                child: IconButton(
                  icon: const Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    _c.decrement();
                  },
                  // ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const Text(
                "Pens",
                style: TextStyle(fontSize: 30, color: Colors.amber),
              ),
              Expanded(child: Container()),
              Material(
                borderRadius: BorderRadius.circular(25),
                color: Colors.redAccent,
                child: IconButton(
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    _c.incrementPens();
                  },
                  // ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 50,
                child: Center(
                  child: Obx(() => Text(
                        _c.pens.toString(),
                        style: const TextStyle(fontSize: 30),
                      )),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Material(
                borderRadius: BorderRadius.circular(25),
                color: Colors.redAccent,
                child: IconButton(
                  icon: const Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    _c.decrementPens();
                  },
                  // ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(child: Container()),
              Container(
                width: 150,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blue.shade900,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  )),
                  onPressed: () {
                    Get.to(TotalPage());
                  },
                  child: const Text(
                    "Total",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
