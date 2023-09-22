import 'package:get/get.dart';
import 'package:sptify/model/data.dart';

class CurrentTrackController extends GetxController {
  Song? selected;

  void selectTrack(Song track) {
    selected = track;
    update();
  }
}
