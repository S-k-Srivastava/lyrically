class TrackBasicDetails {
  int? trackId;
  String? trackName;
  String? trackArtist;
  int? hasLyrics;

  TrackBasicDetails(
      {required this.trackName,
      required this.trackId,
      required this.trackArtist,
      required this.hasLyrics});
  TrackBasicDetails.fromJson(Map json)
      : trackId = json["track"]["track_id"],
        trackName = json["track"]["track_name"],
        trackArtist = json["track"]["artist_name"],
        hasLyrics = json["track"]["has_lyrics"];
}
