import 'package:lyrically/utility/data_models/data_models.dart';
import 'package:lyrically/utility/network_service.dart';

class Repository {
  final NetworkService networkService;
  const Repository({required this.networkService});

  Future<List<TrackBasicDetails>> fetchTracks() async {
    final tracks = await networkService.fetchTracks();
    List<TrackBasicDetails> list = [];
    TrackBasicDetails trackBasicDetails;
    tracks.forEach(
      (e) {
        trackBasicDetails = TrackBasicDetails(
            trackName: e["track"]["track_name"],
            trackId: e["track"]["track_id"],
            trackArtist: e["track"]["artist_name"],
            hasLyrics: e["track"]["has_lyrics"]);
        list.add(trackBasicDetails);
      },
    );
    return list;
  }

  Future<String> fetchLyrics(int trackId) async {
    return await networkService.fetchLyrics(trackId);
  }
}
