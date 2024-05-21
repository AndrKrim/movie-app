import 'package:flutter/material.dart';
import 'package:cinelib/models/movie_clip_model.dart';

class MovieVideosWidget extends StatelessWidget {
  final MovieVideosModel movieVideos;

  const MovieVideosWidget({Key? key, required this.movieVideos})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movieVideos.results.length,
      itemBuilder: (context, index) {
        final video = movieVideos.results[index];
        return InkWell(
          onTap: () {
          },
          child: ListTile(
            leading: const Icon(Icons.video_library),
            title: Text(video.name),
            subtitle: Text(video.site),
          ),
        );
      },
    );
  }
}
