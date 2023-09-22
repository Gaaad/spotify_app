import 'package:flutter/material.dart';
import 'package:sptify/model/data.dart';

class PlaylistHeader extends StatelessWidget {
  final Playlist playlist;

  const PlaylistHeader({
    super.key,
    required this.playlist,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              playlist.imageURL,
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "PLAYLIST",
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(fontSize: 12),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    playlist.name,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    playlist.description,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Created by ${playlist.creator} . ${playlist.songs.length} songs ${playlist.duration}",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 20),
        _PlaylistButtons(followers: playlist.followers),
      ],
    );
  }
}

class _PlaylistButtons extends StatelessWidget {
  final String followers;
  const _PlaylistButtons({required this.followers});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: Theme.of(context).colorScheme.secondary,
            foregroundColor: Theme.of(context).iconTheme.color,
            textStyle: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontSize: 12, letterSpacing: 2),
          ),
          child: const Text('PLAY'),
        ),
        const SizedBox(width: 8),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite_border),
          iconSize: 30,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_horiz),
          iconSize: 30,
        ),
        const Spacer(),
        Text(
          "Followers\n$followers",
          style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 12),
          textAlign: TextAlign.right,
        ),
      ],
    );
  }
}
