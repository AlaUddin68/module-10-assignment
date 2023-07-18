import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    CircleAvatar(
                      radius: MediaQuery.of(context).size.width * 0.3,
                      backgroundImage: const NetworkImage(
                        'https://picsum.photos/250?image=10',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "John Doe",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                              "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
                              "when an unknown printer took a galley of type and scrambled it to make a type specimen book. "),
                    ),
                    GridView.count(
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: List.generate(
                        10, // Number of images
                            (index) => Padding(
                          padding: const EdgeInsets.all(8),
                          child: Image.network(
                            'https://picsum.photos/250?image=${index + 10}',
                            height: 150,
                            width: 150,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.height * .4,
                    backgroundImage: const NetworkImage(
                      'https://picsum.photos/250?image=10',
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                SingleChildScrollView(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * .6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 8, bottom: 8),
                          child: Text(
                            "John Doe",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                                  "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
                                  "when an unknown printer took a galley of type and scrambled it to make a type specimen book. "),
                        ),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: List.generate(
                            10, // Number of images
                                (index) => Image.network(
                              'https://picsum.photos/250?image=${index + 10}',
                              height: 150,
                              width: 150,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}