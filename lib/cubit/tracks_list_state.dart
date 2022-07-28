part of 'tracks_list_cubit.dart';

@immutable
abstract class TracksListState {}

class TracksListInitial extends TracksListState {}

class TracksListFetched extends TracksListState {
  final List<TrackBasicDetails> tracks;
  TracksListFetched({required this.tracks});
}
