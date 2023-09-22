import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sptify/controller/current_track_controller.dart';
import 'package:sptify/model/data.dart';

class TracksList extends StatelessWidget {
  final List<Song> tracks;

  TracksList({
    super.key,
    required this.tracks,
  });

  CurrentTrackController currentTrackController =
      Get.put(CurrentTrackController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CurrentTrackController>(builder: (e) {
      return DataTable(
        showCheckboxColumn: false,
        dataRowMaxHeight: 54,
        headingTextStyle:
            Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 12),
        columns: const [
          DataColumn(label: Text("TITLE")),
          DataColumn(label: Text("ARTIST")),
          DataColumn(label: Text("ALBUM")),
          DataColumn(label: Icon(Icons.access_time)),
        ],
        rows: tracks.map(
          (e) {
            final TextStyle textStyle = TextStyle(
              color: currentTrackController.selected == e
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).iconTheme.color,
            );
            return DataRow(
              onSelectChanged: (_) {
                currentTrackController.selectTrack(e);
              },
              selected: currentTrackController.selected == e,
              cells: [
                DataCell(
                  Text(
                    e.title,
                    style: textStyle,
                  ),
                ),
                DataCell(
                  Text(
                    e.artist,
                    style: textStyle,
                  ),
                ),
                DataCell(
                  Text(
                    e.album,
                    style: textStyle,
                  ),
                ),
                DataCell(
                  Text(
                    e.duration,
                    style: textStyle,
                  ),
                ),
              ],
            );
          },
        ).toList(),
      );
    });
  }
}
