import 'package:flutter/material.dart';
import 'package:kuis_rafly/newsmodel.dart';

class DetailPage extends StatefulWidget {
  final String id;
  final int indexID;
  const DetailPage({super.key, required this.id, required this.indexID});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  void _likeNews(int index) {
    setState(() {
      dummyNews[index].likes++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 3, 173, 145),
      appBar: AppBar(
        title: Text(
          // dummyNews[widget.id].title,
          "Detailed Page",
          style: const TextStyle(
            color: Color.fromARGB(255, 14, 14, 14),
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Column(
                children: [
                  Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        dummyNews[widget.indexID].image,
                        width: 170,
                        height: 180,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    dummyNews[widget.indexID].title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 228, 228, 228),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    Text(
                      dummyNews[widget.indexID].description,
                      style: TextStyle(color: Colors.white),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            icon: Icon(Icons.favorite, color: Colors.red),
                            onPressed: () => _likeNews(widget.indexID),
                          ),
                          Text('${dummyNews[widget.indexID].likes} Likes'),
                        ],
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
}
