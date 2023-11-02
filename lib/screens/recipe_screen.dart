import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_example/constants.dart';
import 'package:food_example/models/food.dart';
import 'package:food_example/widgets/food_counter.dart';
import 'package:iconsax/iconsax.dart';

class RecipeScreen extends StatefulWidget {
  final Food food;
  const RecipeScreen({super.key, required this.food});

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  int currentNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              flex: 6,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: kprimaryColor,
                  foregroundColor: Colors.white,
                ),
                child: const Text("Start Cooking"),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: IconButton(
                onPressed: () {},
                style: IconButton.styleFrom(
                  shape: CircleBorder(
                    side: BorderSide(
                      color: Colors.grey.shade300,
                      width: 2,
                    ),
                  ),
                ),
                icon: Icon(
                  widget.food.isLiked ? Iconsax.heart5 : Iconsax.heart,
                  color: widget.food.isLiked ? Colors.red : Colors.black,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Positioned(
                  child: Container(
                    height: MediaQuery.of(context).size.width - 20,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.food.image),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 10,
                  right: 10,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          fixedSize: const Size(50, 50),
                        ),
                        icon: const Icon(CupertinoIcons.chevron_back),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          fixedSize: const Size(50, 50),
                        ),
                        icon: const Icon(Iconsax.notification),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: MediaQuery.of(context).size.width - 50,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Container(
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.food.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(
                        Iconsax.flash_1,
                        size: 20,
                        color: Colors.grey,
                      ),
                      Text(
                        "${widget.food.cal} Cal",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      const Text(
                        " · ",
                        style: TextStyle(color: Colors.grey),
                      ),
                      const Icon(
                        Iconsax.clock,
                        size: 20,
                        color: Colors.grey,
                      ),
                      Text(
                        "${widget.food.time} Min",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(
                        Iconsax.star5,
                        color: Colors.yellow.shade700,
                        size: 25,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "${widget.food.rate}/5",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "(${widget.food.reviews} Reviews)",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade400,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ingredients",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "How many servings?",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                      const Spacer(),
                      FoodCounter(
                        currentNumber: currentNumber,
                        onAdd: () => setState(() {
                          currentNumber++;
                        }),
                        onRemove: () {
                          if (currentNumber != 1) {
                            setState(() {
                              currentNumber--;
                            });
                          }
                        },
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: AssetImage(widget.food.image),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            "Ramen Noodles",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "400g",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade400,
                            ),
                          )
                        ],
                      ),
                      Divider(
                        height: 20,
                        color: Colors.grey.shade300,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: AssetImage(widget.food.image),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            "Ramen Noodles",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "400g",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade400,
                            ),
                          )
                        ],
                      ),
                      Divider(
                        height: 20,
                        color: Colors.grey.shade300,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: AssetImage(widget.food.image),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            "Ramen Noodles",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "400g",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade400,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
