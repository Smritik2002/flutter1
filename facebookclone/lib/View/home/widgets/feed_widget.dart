import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../service/home_service.dart';

class HomePostWidget extends StatelessWidget {
  const HomePostWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Provider.of<HomePageNotifier>(context, listen: false).getData();

    return Consumer<HomePageNotifier>(builder: (context, homeNotifier, _) {
      return homeNotifier.isApiLoading
          ? const CircularProgressIndicator()
          : ListView.separated(
              shrinkWrap: true,
              itemCount: homeNotifier.model?.articles?.length ?? 0,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(24),
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 3),
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 2,
                        spreadRadius: 6,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      if (homeNotifier.model?.articles?[index].urlToImage !=
                          null)
                        GestureDetector(
                          onTap: () {},
                          child: Image.network(
                              homeNotifier.model?.articles?[index].urlToImage ??
                                  ""),
                        ),
                      Text(
                        homeNotifier.model?.articles?[index].author ?? "N/A",
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          homeNotifier.model?.articles?[index].description ??
                              "N/A",
                        ),
                      ),
                      Text(
                        homeNotifier.model?.articles?[index].title ?? "N/A",
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 30,
                );
              },
            );
    });
  }
}
