import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import 'widgets/event_tab_widget.dart';
import 'widgets/thinsksitem.dart';

final ScrollController scrollController = ScrollController();
final ScrollController scrollController1 = ScrollController();

class ExploreList extends StatelessWidget {
  const ExploreList({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: const Center(
            child: Text(
          'Explore',
        )),
        actions: const [SizedBox(width: 60)],
      ),
      body: NestedScrollView(
        controller: scrollController,
        headerSliverBuilder: (context, innerOverscrollY) {
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
        body: Container(
          width: size.width,
          height: size.height,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          color: Colors.white,
          child: CustomScrollView(
            slivers: [
              SliverStickyHeader(
                header: Container(
                  color: Colors.white,
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
                      EventTabWidget(
                        s1: () {
                          scrollController.animateTo(370,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        },
                        s2: () {
                          scrollController.animateTo((500),
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        },
                        s3: () {},
                        s4: () {},
                      ),
                    ],
                  ),
                ),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 15),
                          // overview point
                          const Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec at tincidunt erat. Cras scelerisque, nunc ac cursus volutpat, orci purus iaculis mauris, a aliquam lacus nulla id nulla. Donec rhoncus ante nec volutpat rhoncus. Sed in odio mauris. Quisque ac placerat nulla, quis ultrices ante. Nam commodo aliquet mauris a pharetra. Ut aliquet quis tortor auctor laoreet.',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w300,
                                height: 0),
                          ),
                          exploreSubHead(
                              label: 'Things To See & Do', onpressed: () {}),
                          const SizedBox(height: 10),
                          for (var i = 0; i < 3; i++) const ThinksItem(),
                          exploreSubHead(
                              label: 'Food To Explore', onpressed: () {}),
                          const FoodExploreItem(),
                          const FoodExploreItem(),
                          exploreSubHead(
                              label: 'Hotels To Stay', onpressed: () {}),
                          const HotelExploreItem(),
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
    );
  }

  Widget exploreSubHead({String label = '', required Function() onpressed}) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700)),
          GestureDetector(
              onTap: onpressed,
              child: const Text('View All',
                  style: TextStyle(
                      color: Color(0xFF418CFF),
                      fontSize: 13,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.underline))),
        ],
      ),
    );
  }
}

// height 200+10
class FoodExploreItem extends StatelessWidget {
  const FoodExploreItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 1, vertical: 10),
      height: 200,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(color: Color(0x3F000000), blurRadius: 1)
          ]),
      child: Row(
        children: [
          Image.asset('assets/foodexploresmple1.png'),
          const SizedBox(width: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Zeit Varkala',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w700)),
                      const SizedBox(height: 5),
                      reviewBoxWithBorder(),
                      const SizedBox(height: 5),
                      const Text('Italian, Arabic',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400)),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 45,
                        height: 45,
                        decoration: const ShapeDecoration(
                            color: Colors.white,
                            shape: OvalBorder(
                                side: BorderSide(
                                    width: 1, color: Color(0xFFFF7134)))),
                        child: MaterialButton(
                            onPressed: () {},
                            padding: EdgeInsets.zero,
                            shape: const OvalBorder(),
                            child: Center(
                                child: Image.asset(
                                    'assets/icons/arrow_up_small.png',
                                    height: 30,
                                    color: const Color(0xFFFF7134)))),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

//height 210+10
class HotelExploreItem extends StatelessWidget {
  const HotelExploreItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 1, vertical: 10),
      height: 210,
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(color: Color(0x3F000000), blurRadius: 1)
          ]),
      child: Column(
        children: [
          ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              child: SizedBox(
                  height: 150,
                  child: Image.asset('assets/explorehotelsamplle.png',
                      width: double.maxFinite, fit: BoxFit.fitWidth))),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Grand Royal Hotel',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.65,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w700)),
                      Text('Junction name, Varkala, Kerala',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 9.82,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400))
                    ],
                  ),
                ),
                reviewBoxWithBorder(clr: const Color(0xFFFF7134))
              ],
            ),
          )
        ],
      ),
    );
  }
}

Container reviewBox({String i = '4.8 (17k)'}) {
  return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      height: 22,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),
      child: Row(children: [
        const Icon(Icons.star, color: Colors.yellow, size: 20),
        const SizedBox(width: 3),
        Text(i,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 8.35,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700))
      ]));
}

Widget reviewBoxWithBorder(
    {String i = '4.8 (17k)', Color clr = const Color(0xFFBABABA)}) {
  return Container(
      height: 22,
      width: 75,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(width: 1, color: clr)),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Icon(Icons.star, color: Colors.yellow, size: 20),
        const SizedBox(width: 3),
        Text(i,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 8.35,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700))
      ]));
}
