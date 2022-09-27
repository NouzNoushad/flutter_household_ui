import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List<Map<String, dynamic>> imagePreviews = [
    {
      "color": Colors.yellow.shade800,
      "image": "yellow_chair.png",
    },
    {
      "color": Colors.pink.shade300,
      "image": "pink_chair.png",
    },
    {
      "color": Colors.green.shade900,
      "image": "green_chair.png",
    },
    {
      "color": Colors.blue.shade900,
      "image": "blue_chair.png",
    },
  ];
  String? selectedImage;
  Color? selectedColor;
  @override
  void initState() {
    selectedImage = imagePreviews[0]["image"];
    selectedColor = imagePreviews[0]["color"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: Stack(
          children: [
            Container(
              height: height / 2 + 80,
              width: width,
              color: selectedColor,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Modern Sofa",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "Household series",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: Text(
                          "household".toUpperCase(),
                          style: const TextStyle(
                              height: 1,
                              fontWeight: FontWeight.w900,
                              fontSize: 60,
                              color: Colors.white30),
                        ),
                      ),
                    ),
                  ),
                  const Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 130,
                    ),
                  ),
                  Positioned(
                    right: 60,
                    top: 110,
                    child: Image.asset(
                      "assets/$selectedImage",
                      height: 240,
                      width: 220,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    left: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "More Choice",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Container(
                          height: 25,
                          width: 120,
                          // color: Colors.yellow,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: imagePreviews.length,
                            itemBuilder: (context, index) {
                              final imagePreview = imagePreviews[index];
                              return Padding(
                                padding: const EdgeInsets.only(right: 12),
                                // when i click on colors should change image
                                child: CircleAvatar(
                                  backgroundColor:
                                      Colors.white, // border effect
                                  radius: 10,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedImage = imagePreview["image"];
                                        selectedColor = imagePreview["color"];
                                      });
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: imagePreview["color"],
                                      radius: 8,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: height / 2 - 60,
                width: width,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        moreDetails("Price", "\$299"),
                        const SizedBox(
                          width: 15,
                        ),
                        moreDetails("Brand", "Sophia"),
                        const SizedBox(
                          width: 15,
                        ),
                        moreDetails("From", "Italy"),
                      ],
                    ),
                    Text(
                      "Commodity Introduction",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: selectedColor,
                      ),
                    ),
                    Text(
                      "A sofa set is a living room essential that cannot be compromised on. When choosing a sofa set for your living room, you need to consider a lot of the sofa set, your existing design asthetic and more",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: selectedColor,
                      ),
                    ),
                    Container(
                      height: 50,
                      width: width,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: selectedColor,
                        ),
                        child: const Text(
                          "Buy now",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget moreDetails(String title, String data) => Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          Text(
            data,
            style: TextStyle(
              color: selectedColor,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
        ],
      );
}
