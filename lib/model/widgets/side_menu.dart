import 'package:flutter/material.dart';
import 'package:sptify/model/data.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: double.infinity,
      color: Theme.of(context).primaryColor,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  "assets/spotify_logo.png",
                  height: 55,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ],
          ),
          _SideMenuIconTap(
            icon: Icons.home,
            title: 'Home',
            onTap: () {},
          ),
          _SideMenuIconTap(
            icon: Icons.search,
            title: 'Search',
            onTap: () {},
          ),
          _SideMenuIconTap(
            icon: Icons.audiotrack,
            title: 'Radio',
            onTap: () {},
          ),
          const SizedBox(height: 12),
          _LibraryPlaylists(),
        ],
      ),
    );
  }
}

class _SideMenuIconTap extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  const _SideMenuIconTap({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.centerLeft,
      child: ListTile(
        leading: Icon(
          icon,
          color: Theme.of(context).iconTheme.color,
          size: 28,
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge,
          overflow: TextOverflow.ellipsis,
        ),
        onTap: onTap,
      ),
    );
  }
}

class _LibraryPlaylists extends StatelessWidget {
  _LibraryPlaylists();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scrollbar(
        thumbVisibility: true,
        controller: _scrollController,
        child: ListView(
          controller: _scrollController,
          physics: const ClampingScrollPhysics(),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                  child: Text(
                    "YOUR LIBRARY",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                ...yourLibrary.map(
                  (e) => ListTile(
                    dense: true,
                    title: Text(
                      e,
                      style: Theme.of(context).textTheme.bodyMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                  child: Text(
                    "PLAYLISTS",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                ...playlists.map(
                  (e) => ListTile(
                    dense: true,
                    title: Text(
                      e,
                      style: Theme.of(context).textTheme.bodyMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
