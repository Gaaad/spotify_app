import 'package:http/http.dart' as http;
import 'package:sptify/model/playlist_model.dart';

class PlaylistService {
  Future<Playlist> fetchPlaylistData() async {
    var headers = {
      'X-RapidAPI-Key': 'ba9c7a50f8msh5f2192c5d71ac88p1745dejsn63b5ea9fd1ce',
      'X-RapidAPI-Host': 'youtube-music-api-detailed.p.rapidapi.com',
    };

    var request = http.Request(
      'GET',
      Uri.parse(
          'https://youtube-music-api-detailed.p.rapidapi.com/get_watch_playlist?video_id=1A7Qw88As64'),
    );
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    try {
      var body = await response.stream.bytesToString();
      return playlistFromJson(body);
    } catch (e) {
      print(e.toString());
      throw Exception();
    }
  }
}
