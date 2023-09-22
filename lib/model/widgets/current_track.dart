import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sptify/controller/current_track_controller.dart';
import 'package:window_manager/window_manager.dart';

class CurrentTrack extends StatelessWidget {
  const CurrentTrack({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 93,
      width: double.infinity,
      color: Colors.black87,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            _TrackInfo(),
            const Spacer(),
            _PlayerControlls(),
            const Spacer(),
            if (MediaQuery.of(context).size.width > 800) const _MoreControlls(),
          ],
        ),
      ),
    );
  }
}

class _TrackInfo extends StatelessWidget {
  _TrackInfo();

  CurrentTrackController currentTrackController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CurrentTrackController>(builder: (c) {
      if (currentTrackController.selected == null) {
        return const SizedBox.shrink();
      } else {
        return Row(
          children: [
            Image.asset(
              'assets/lofigirl.jpg',
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 12),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currentTrackController.selected!.title,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 4),
                Text(
                  currentTrackController.selected!.artist,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.grey[300],
                        fontSize: 12,
                      ),
                ),
              ],
            ),
            const SizedBox(width: 9.5),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border),
            ),
          ],
        );
      }
    });
  }
}

class _PlayerControlls extends StatelessWidget {
  _PlayerControlls();

  CurrentTrackController currentTrackController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shuffle),
              iconSize: 20,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.skip_previous_outlined),
              iconSize: 20,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.play_circle_outline),
              iconSize: 34,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.skip_next_outlined),
              iconSize: 20,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.repeat),
              iconSize: 20,
            ),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Text(
              "0:00",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(width: 8),
            Container(
              height: 5,
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              currentTrackController.selected?.duration ?? "0:00",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        )
      ],
    );
  }
}

class _MoreControlls extends StatelessWidget {
  const _MoreControlls();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.devices_outlined),
          iconSize: 20,
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.volume_up_outlined),
            ),
            Container(
              height: 5,
              width: 70,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () async {
            if (await windowManager.isFullScreen()) {
              await windowManager.setFullScreen(false);
            } else {
              await windowManager.setFullScreen(true);
            }
          },
          icon: const Icon(Icons.fullscreen),
          iconSize: 20,
        ),
      ],
    );
  }
}
