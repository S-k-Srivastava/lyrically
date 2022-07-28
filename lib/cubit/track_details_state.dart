part of 'track_details_cubit.dart';

@immutable
abstract class TrackDetailsState {}

class TrackDetailsInitial extends TrackDetailsState {}

class TrackLyricsfetched extends TrackDetailsState {
  final String lyrics;
  TrackLyricsfetched({required this.lyrics});
}
