import 'package:flutter/material.dart';

class ThinksItem extends StatelessWidget {
  const ThinksItem({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: SizedBox(
          width: size.width,
          height: 200,
          child: Stack(
            children: [
              SizedBox(
                  height: 200,
                  width: size.width,
                  child: Image.asset('assets/exploresample4.png',
                      fit: BoxFit.fill)),
              Positioned(top: 15, left: 20, child: reviewBox()),
              Positioned(
                bottom: 15,
                left: 0,
                right: 0,
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: 50,
                    width: size.width,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Expanded(
                              child: Text('Shivakayaking',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w700))),
                          Container(
                              width: 39,
                              height: 39,
                              decoration: const ShapeDecoration(
                                  color: Colors.white, shape: OvalBorder()))
                        ])),
              )
            ],
          ),
        ),
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
