import 'package:flutter/material.dart';

class EventTabWidget extends StatelessWidget {
  const EventTabWidget(
      {super.key,
      required this.s1,
      required this.s2,
      required this.s3,
      this.index = 3,
      required this.s4});
  final int index;
  final Function() s1;
  final Function() s2;
  final Function() s3;
  final Function() s4;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
            bottom: 0,
            child: Container(
                width: size.width,
                height: 2,
                decoration: const BoxDecoration(color: Color(0xFFD9D9D9)))),
        Row(children: [
          InkWell(
            onTap: () => s1(),
            child: Column(children: [
              const Text(
                'Overview',
              ),
              Container(
                  width: 55,
                  height: 2,
                  margin: const EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                      color: index == 0 ? const Color(0xFFFF7234) : null))
            ]),
          ),
          const SizedBox(width: 10),
          InkWell(
            onTap: () => s2(),
            child: Column(children: [
              const Text(
                'Things to do',
              ),
              Container(
                  width: 75,
                  height: 2,
                  margin: const EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                      color: index == 1 ? const Color(0xFFFF7234) : null))
            ]),
          ),
          const SizedBox(width: 10),
          InkWell(
            onTap: () => s3(),
            child: Column(children: [
              const Text(
                'Food to explore',
              ),
              Container(
                  width: 85,
                  height: 2,
                  margin: const EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                      color: index == 2 ? const Color(0xFFFF7234) : null))
            ]),
          ),
          const SizedBox(width: 10),
          InkWell(
            onTap: () => s4(),
            child: Column(children: [
              const Text(
                'Hotels to stay',
              ),
              Container(
                  width: 80,
                  height: 2,
                  margin: const EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                      color: index == 3 ? const Color(0xFFFF7234) : null))
            ]),
          ),
        ])
      ],
    );
  }
}
