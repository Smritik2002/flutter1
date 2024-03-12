import 'package:facebookclone/Api/api.dart';
import 'package:facebookclone/Models/newsmodel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NewsModel? model;
  final Api _api = Api();
  void getData() async {
    model = await _api.fetchNews();
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'facebook',
            style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.blue[400]),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(3)),
              child: const Icon(
                Icons.add,
                color: Colors.blue,
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(3)),
              child: const Icon(
                Icons.search,
                color: Colors.blue,
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(3)),
              child: const Icon(
                Icons.menu,
                color: Colors.blue,
              ),
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.home,
                  color: Colors.blue,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.person_add_outlined,
                  color: Colors.blue,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.notification_add,
                  color: Colors.blue,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.video_call_outlined,
                  color: Colors.blue,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.message,
                  color: Colors.blue,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(3)),
                    child: const Icon(
                      Icons.person_2,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromRGBO(30, 30, 30, 0.1)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Whats on your mind??',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      const Icon(
                        Icons.photo_album,
                        color: Colors.green,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    width: 324,
                  ),
                  Text('Photo'),
                  FutureBuilder(
                    future: _api.fetchNews(),
                    builder: (BuildContext context,
                        AsyncSnapshot<NewsModel?> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return SizedBox(
                          height: 500,
                          child: ListView.builder(
                              itemCount: snapshot.data?.articles?.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        // Navigator.of(context)
                                        //     .pushNamed('third_page', arguments: {
                                        //   'title': snapshot
                                        //       .data?.articles?[index].title,
                                        //   'desc': snapshot
                                        //       .data?.articles?[index].description,
                                        //   'image': snapshot
                                        //       .data?.articles?[index].urlToImage
                                        // });
                                      },
                                      child: Image.network(snapshot.data
                                              ?.articles?[index].urlToImage ??
                                          'N/A'),
                                    ),
                                    Text(
                                      snapshot.data?.articles?[index].author ??
                                          "N/A",
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        snapshot.data?.articles?[index]
                                                .description ??
                                            "N/A",
                                      ),
                                    ),
                                    Text(
                                      snapshot.data?.articles?[index].title ??
                                          "N/A",
                                    ),
                                  ],
                                );
                              }),
                        );
                      }
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
