import 'package:facebookclone/View/home/widgets/feed_widget.dart';
import 'package:facebookclone/View/home/widgets/status_widget.dart';
import 'package:facebookclone/service/home_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: ChangeNotifierProvider<HomePageNotifier>(
        create: (context) => HomePageNotifier(),
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
          body: const SingleChildScrollView(
            child: Column(
              children: [
                StatusWidget(),
                HomePostWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   void initState() {
//     super.initState();
//     Provider.of<HomePageNotifier>(context, listen: false).getData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 6,
//       child: Scaffold(
//         appBar: AppBar(
//           automaticallyImplyLeading: false,
//           title: Text(
//             'facebook',
//             style: TextStyle(
//                 fontSize: 35,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.blue[400]),
//           ),
//           actions: [
//             ElevatedButton(
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.white,
//                   shape: const CircleBorder(),
//                   padding: const EdgeInsets.all(3)),
//               child: const Icon(
//                 Icons.add,
//                 color: Colors.blue,
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.white,
//                   shape: const CircleBorder(),
//                   padding: const EdgeInsets.all(3)),
//               child: const Icon(
//                 Icons.search,
//                 color: Colors.blue,
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.white,
//                   shape: const CircleBorder(),
//                   padding: const EdgeInsets.all(3)),
//               child: const Icon(
//                 Icons.menu,
//                 color: Colors.blue,
//               ),
//             ),
//           ],
//           bottom: const TabBar(
//             tabs: [
//               Tab(
//                 icon: Icon(
//                   Icons.home,
//                   color: Colors.blue,
//                 ),
//               ),
//               Tab(
//                 icon: Icon(
//                   Icons.person_add_outlined,
//                   color: Colors.blue,
//                 ),
//               ),
//               Tab(
//                 icon: Icon(
//                   Icons.notification_add,
//                   color: Colors.blue,
//                 ),
//               ),
//               Tab(
//                 icon: Icon(
//                   Icons.video_call_outlined,
//                   color: Colors.blue,
//                 ),
//               ),
//               Tab(
//                 icon: Icon(
//                   Icons.message,
//                   color: Colors.blue,
//                 ),
//               ),
//               Tab(
//                 icon: Icon(
//                   Icons.shopping_cart,
//                   color: Colors.blue,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         body: const SingleChildScrollView(
//           child: Column(
//             children: [
//               StatusWidget(),
//               HomePostWidget(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
