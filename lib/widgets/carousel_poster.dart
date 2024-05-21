import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cinelib/common/utils.dart';
import 'package:cinelib/models/movie_model.dart';
import 'package:cinelib/widgets/carousel_card.dart';
import 'package:flutter/material.dart';

class HomeCarouselSlider extends StatelessWidget {
  const HomeCarouselSlider({
    super.key,
    required this.data,
  });
  final MovieModel data;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var carouselOptions = CarouselOptions(
      height: 440,
      aspectRatio: 16 / 9,
      viewportFraction: 1,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: true,
      autoPlayInterval: const Duration(seconds: 3),
      autoPlayAnimationDuration: const Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
      enlargeCenterPage: true,
      scrollDirection: Axis.horizontal,
    );
    return SizedBox(
      width: size.width,
      height: 440,
      child: CarouselSlider.builder(
        itemCount: data.results.length,
        itemBuilder: (BuildContext context, int index, int realIndex) {
          var url = data.results[index].posterPath.toString();
          return GestureDetector(
            onTap: () {},
            child: CarouselCard(
              image: CachedNetworkImageProvider("$imageUrl$url"),
              name: data.results[index].title.toString(),
            ),
          );
        },
        options: carouselOptions,
      ),
    );
  }
}
