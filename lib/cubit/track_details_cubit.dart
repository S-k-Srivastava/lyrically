import 'package:bloc/bloc.dart';
import 'package:lyrically/utility/data_models/data_models.dart';
import 'package:lyrically/utility/repository.dart';
import 'package:meta/meta.dart';

part 'track_details_state.dart';

class TrackDetailsCubit extends Cubit<TrackDetailsState> {
  final Repository repository;

  TrackDetailsCubit({required this.repository}) : super(TrackDetailsInitial());

  void fetchLyrics(int trackId) async {
    final lyrics = await repository.fetchLyrics(trackId);
    emit(TrackLyricsfetched(lyrics: lyrics));
  }
}
