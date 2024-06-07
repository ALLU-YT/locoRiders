import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import 'widgets/event_tab_widget.dart';
import 'widgets/thinsksitem.dart';

class ExploreList extends StatefulWidget {
  const ExploreList({super.key});

  @override
  _ExploreListState createState() => _ExploreListState();
}

class _ExploreListState extends State<ExploreList> {
  final ScrollController scrollController = ScrollController();
  final GlobalKey contentKey = GlobalKey();
  final GlobalKey thingsToSeeKey = GlobalKey();
  final GlobalKey foodKey = GlobalKey();
  final GlobalKey hotelsKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: const Center(
          child: Text('Explore'),
        ),
        actions: const [SizedBox(width: 60)],
      ),
      body: NestedScrollView(
        controller: scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              leading: const SizedBox(),
              expandedHeight: 370,
              pinned: false,
              flexibleSpace: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: SizedBox(
                    height: 350,
                    width: size.width,
                    child: Stack(
                      children: [
                        Image.asset('assets/exploreSample.png',
                            fit: BoxFit.cover, height: 350, width: size.width),
                        Positioned(
                          bottom: 10,
                          left: 10,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.69),
                                borderRadius: BorderRadius.circular(32)),
                            child: Row(
                              children: [
                                for (int i = 0; i < 3; i++)
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 3),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(90),
                                      child: SizedBox(
                                          height: 30,
                                          width: 30,
                                          child: Image.asset(
                                              'assets/exploreSample.png',
                                              fit: BoxFit.cover)),
                                    ),
                                  ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Text('See more',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w600)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ];
        },
        body: Column(
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Varkala',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 29,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700)),
                  const Text('Cliffside Serenity, Spiritual Awakening.',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500)),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          _scrollToSection(contentKey); // Scroll to Content
                        },
                        child: const Text("Content"),
                      ),
                      TextButton(
                        onPressed: () {
                          _scrollToSection(
                              thingsToSeeKey); // Scroll to Things To See
                        },
                        child: const Text("Things To See"),
                      ),
                      TextButton(
                        onPressed: () {
                          _scrollToSection(foodKey); // Scroll to Food
                        },
                        child: const Text("Food"),
                      ),
                      TextButton(
                        onPressed: () {
                          _scrollToSection(hotelsKey); // Scroll to Hotels
                        },
                        child: const Text("Hotels"),
                      ),
                    ],
                  )
                ],
              ),
            ),
            NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (scrollInfo is ScrollUpdateNotification) {
                  print(
                      "Current scroll position: ${scrollInfo.metrics.pixels}");
                }
                return true;
              },
              child: Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverStickyHeader(
                      header: Container(
                        color: Colors.white,
                        child: const SizedBox.shrink(),
                      ),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 15),
                                Container(
                                  key: contentKey,
                                  child: const Text(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec at tincidunt erat. Cras scelerisque, nunc ac cursus volutpat, orci purus iaculis mauris, a aliquam lacus nulla id nulla. Donec rhoncus ante nec volutpat rhoncus. Sed in odio mauris. Quisque ac placerat nulla, quis ultrices ante. Nam commodo aliquet mauris a pharetra. Ut aliquet quis tortor auctor laoreet.',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w300),
                                  ),
                                ),
                                exploreSubHead(
                                    label: 'Things To See & Do',
                                    onpressed: () {}),
                                const SizedBox(height: 10),
                                for (var i = 0; i < 3; i++)
                                  ThinksItem(
                                    key: i == 0 ? thingsToSeeKey : null,
                                  ),
                                exploreSubHead(
                                    label: 'Food To Explore', onpressed: () {}),
                                FoodExploreItem(key: foodKey),
                                const FoodExploreItem(),
                                exploreSubHead(
                                    label: 'Hotels To Stay', onpressed: () {}),
                                HotelExploreItem(key: hotelsKey),
                                const HotelExploreItem(),
                                const HotelExploreItem(),
                                const SizedBox(height: 50)
                              ],
                            );
                          },
                          childCount: 1,
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
}

Widget exploreSubHead(
    {required String label, required VoidCallback onpressed}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.arrow_forward),
          onPressed: onpressed,
        ),
      ],
    ),
  );
}

class ThinksItem extends StatelessWidget {
  const ThinksItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 100,
        color: Colors.grey.shade200,
        child: const Center(child: Text("Thinks Item")),
      ),
    );
  }
}

class FoodExploreItem extends StatelessWidget {
  const FoodExploreItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 100,
        color: Colors.grey.shade200,
        child: const Center(child: Text("Food Item")),
      ),
    );
  }
}

class HotelExploreItem extends StatelessWidget {
  const HotelExploreItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 100,
        color: Colors.grey.shade200,
        child: const Center(child: Text("Hotel Item")),
      ),
    );
  }
}
