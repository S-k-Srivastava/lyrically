import 'dart:convert';
import 'package:http/http.dart';

class NetworkService {
  Future<List<dynamic>> fetchTracks() async {
    try {
      final res = await get(Uri.parse(
          "https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7"));
      final userdata = Map<String, dynamic>.from(jsonDecode(res.body));
      return userdata["message"]["body"]["track_list"] as List;
    } catch (e) {
      return [];
    }
  }

  Future<String> fetchLyrics(int trackId) async {
    var lyrics = "loading...";
    try {
      final res = await get(Uri.parse(
          "https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=$trackId&apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7"));
      lyrics = jsonDecode(res.body)["message"]["body"]["lyrics"]["lyrics_body"];
    } catch (e) {
      lyrics = "No Lyrics Available";
    }
    return lyrics;
  }
}
