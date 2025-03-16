import 'package:flutter/material.dart';
import 'package:kuis_rafly/detail_page.dart';
import 'package:kuis_rafly/login_page.dart';
import 'package:kuis_rafly/newsmodel.dart';
import 'package:kuis_rafly/profile_page.dart';

class HomePage extends StatefulWidget {
  final String username;

  const HomePage({super.key, required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 3, 173, 145),
      appBar: AppBar(
        title: const Text(
          'ViewGram',
          style: TextStyle(
            color: Color.fromARGB(255, 14, 14, 14),
            fontSize: 30,
          ),
        ),
        centerTitle: true,

        backgroundColor: const Color.fromARGB(255, 143, 229, 255),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),

          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      // (context) => const ProfilePage(usernameProfile: widged.username),
                      (context) => const ProfilePage(usernameProfile: "rafly"),
                ),
              );
            },
            icon: const Icon(Icons.person_2_sharp),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Text(""),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: dummyNews.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Padding(padding: const EdgeInsets.all(16.0)),
                        Image.network(
                          dummyNews[index].image,
                          // 'https://picsum.photos/800/400',
                        ),
                        const SizedBox(height: 10),
                        Text(
                          dummyNews[index].title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Likes : ${dummyNews[index].likes}',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.green,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => DetailPage(
                                      indexID: index,
                                      id: dummyNews[index].id,
                                    ),

                                // deskripsi: dummyNews[index].description,
                                // title: dummyNews[index].title,
                              ),
                            );
                          },
                          child: const Text(
                            'Lihat',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
