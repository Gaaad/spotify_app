import 'package:flutter/material.dart';
import 'package:sptify/model/data.dart';

import '../model/widgets/playlist_header.dart';
import '../model/widgets/tracks_list.dart';

class PlaylistScreen extends StatelessWidget {
  final Playlist playlist;
  PlaylistScreen({
    super.key,
    required this.playlist,
  });

  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 140,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              customBorder: const CircleBorder(),
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: Colors.black26,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.chevron_left, size: 28),
              ),
            ),
            const SizedBox(width: 16),
            InkWell(
              customBorder: const CircleBorder(),
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: Colors.black26,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.chevron_right, size: 28),
              ),
            ),
          ],
        ),
        actions: [
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.account_circle_outlined),
            label: const Text("Abdalrhman Gad"),
            style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).iconTheme.color),
          ),
          const SizedBox(width: 8),
          IconButton(
            padding: const EdgeInsets.only(),
            onPressed: () {},
            icon: const Icon(Icons.keyboard_arrow_down),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color(0xFFAF1018),
                Theme.of(context).scaffoldBackgroundColor,
              ],
              stops: const [
                0,
                0.3
              ]),
        ),
        child: Scrollbar(
          thumbVisibility: true,
          controller: _scrollController,
          child: ListView(
            controller: _scrollController,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            children: [
              PlaylistHeader(playlist: playlist),
              TracksList(tracks: playlist.songs),
            ],
          ),
        ),
      ),
    );
  }
}
