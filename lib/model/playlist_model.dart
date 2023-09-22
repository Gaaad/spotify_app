// To parse this JSON data, do
//
//     final playlist = playlistFromJson(jsonString);

import 'dart:convert';

Playlist playlistFromJson(String str) => Playlist.fromJson(json.decode(str));

String playlistToJson(Playlist data) => json.encode(data.toJson());

class Playlist {
  dynamic lyrics;
  String playlistId;
  String related;
  List<Track> tracks;

  Playlist({
    this.lyrics,
    required this.playlistId,
    required this.related,
    required this.tracks,
  });

  factory Playlist.fromJson(Map<String, dynamic> json) => Playlist(
        lyrics: json["lyrics"],
        playlistId: json["playlistId"],
        related: json["related"],
        tracks: List<Track>.from(json["tracks"].map((x) => Track.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "lyrics": lyrics,
        "playlistId": playlistId,
        "related": related,
        "tracks": List<dynamic>.from(tracks.map((x) => x.toJson())),
      };
}

class Track {
  List<Artist> artists;
  dynamic feedbackTokens;
  String length;
  dynamic likeStatus;
  List<Thumbnail> thumbnail;
  String title;
  String videoId;
  VideoType videoType;
  String views;

  Track({
    required this.artists,
    this.feedbackTokens,
    required this.length,
    this.likeStatus,
    required this.thumbnail,
    required this.title,
    required this.videoId,
    required this.videoType,
    required this.views,
  });

  factory Track.fromJson(Map<String, dynamic> json) => Track(
        artists:
            List<Artist>.from(json["artists"].map((x) => Artist.fromJson(x))),
        feedbackTokens: json["feedbackTokens"],
        length: json["length"],
        likeStatus: json["likeStatus"],
        thumbnail: List<Thumbnail>.from(
            json["thumbnail"].map((x) => Thumbnail.fromJson(x))),
        title: json["title"],
        videoId: json["videoId"],
        videoType: videoTypeValues.map[json["videoType"]]!,
        views: json["views"],
      );

  Map<String, dynamic> toJson() => {
        "artists": List<dynamic>.from(artists.map((x) => x.toJson())),
        "feedbackTokens": feedbackTokens,
        "length": length,
        "likeStatus": likeStatus,
        "thumbnail": List<dynamic>.from(thumbnail.map((x) => x.toJson())),
        "title": title,
        "videoId": videoId,
        "videoType": videoTypeValues.reverse[videoType],
        "views": views,
      };
}

class Artist {
  String id;
  String name;

  Artist({
    required this.id,
    required this.name,
  });

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Thumbnail {
  int height;
  String url;
  int width;

  Thumbnail({
    required this.height,
    required this.url,
    required this.width,
  });

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        height: json["height"],
        url: json["url"],
        width: json["width"],
      );

  Map<String, dynamic> toJson() => {
        "height": height,
        "url": url,
        "width": width,
      };
}

enum VideoType { MUSIC_VIDEO_TYPE_OMV, MUSIC_VIDEO_TYPE_UGC }

final videoTypeValues = EnumValues({
  "MUSIC_VIDEO_TYPE_OMV": VideoType.MUSIC_VIDEO_TYPE_OMV,
  "MUSIC_VIDEO_TYPE_UGC": VideoType.MUSIC_VIDEO_TYPE_UGC
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
