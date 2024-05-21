import 'package:cinelib/api/api.dart';
import 'package:cinelib/models/movie_model.dart';
import 'package:cinelib/models/tvseries_model.dart';
import 'package:cinelib/screens/movie_detail.dart';
import 'package:cinelib/screens/search.dart';
import 'package:cinelib/widgets/carousel_poster.dart';
import 'package:cinelib/widgets/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiServices apiServices = ApiServices();

  late Future<MovieModel> nowPlaying;
  late Future<MovieModel> trendingFuture;
  late Future<MovieModel> upcomingFuture;
  late Future<MovieModel> topRatedMovies;
  late Future<TvSeriesModel> topRatedSeries;

  @override
  void initState() {
    upcomingFuture = apiServices.getUpcomingMovies();
    nowPlaying = apiServices.getNowPlayingMovies();
    trendingFuture = apiServices.getTrendingMovies();
    topRatedMovies = apiServices.getTopRatedMovies();
    topRatedSeries = apiServices.getTopRatedSeries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
        leading: Padding(
          padding:
              const EdgeInsets.only(left: 16.0), // Adjust the value as needed
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              size: 24,
            ),
          ),
        ),
        title: const Text(
          "CineLib",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 16.0,
              // top: 8.0,
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchScreen(),
                  ),
                );
              },
              child: const Icon(
                Icons.search,
                size: 24,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<MovieModel>(
              future: trendingFuture,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return HomeCarouselSlider(data: snapshot.data!);
                }
                return const SizedBox();
              },
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                    },
                    icon: const Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.play_circle_fill,
                      color: Colors.white,
                      size: 64.0,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => MovieDetailScreen(
                      //       movieId: data[index].id,
                      //     ),
                      //   ),
                      // );
                    },
                    icon: const Icon(
                      Icons.info_outline,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            SizedBox(
              height: 280,
              child: UpcomingMovieCard(
                future: nowPlaying,
                headlineText: 'Now Playing',
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            SizedBox(
              height: 280,
              child: UpcomingMovieCard(
                future: trendingFuture,
                headlineText: 'Trending Movies',
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            SizedBox(
              height: 280,
              child: UpcomingMovieCard(
                future: topRatedMovies,
                headlineText: 'Top Rated Movies',
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            SizedBox(
              height: 280,
              child: UpcomingMovieCard(
                future: upcomingFuture,
                headlineText: 'Upcoming Movies',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
