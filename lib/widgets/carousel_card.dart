import 'package:cinelib/common/utils.dart';
import 'package:flutter/material.dart';

class CarouselCard extends StatelessWidget {
  const CarouselCard({super.key, required this.image, required this.name});
  final ImageProvider image;
  final String name;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: 440,
      child: Stack(
        children: [
          Stack(
            children: [
              Container(
                height: 440,
                decoration: BoxDecoration(
                  image: DecorationImage(fit: BoxFit.cover, image: image),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black12.withOpacity(1.00),
                      ]),
                ),
              ),
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.center,
                    colors: [
                      backgroundPrimary.withOpacity(0.80),
                      backgroundPrimary.withOpacity(0.60),
                      backgroundPrimary.withOpacity(0.40),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 24,
                left: 0,
                right: 0,
                child: Container(
                  width: size.width,
                  alignment: Alignment.center,
                  child: Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
