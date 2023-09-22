import 'package:flutter/material.dart';
import 'package:sptify/model/data.dart';
import 'package:sptify/model/widgets/widgets.dart';

import 'playlist_screen.dart';

class Shell extends StatelessWidget {
  const Shell({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                if (MediaQuery.of(context).size.width > 800) const SideMenu(),
                Expanded(
                  child: PlaylistScreen(playlist: lofihiphopPlaylist),
                ),
              ],
            ),
          ),
          const CurrentTrack(),
        ],
      ),
    );
  }
}
