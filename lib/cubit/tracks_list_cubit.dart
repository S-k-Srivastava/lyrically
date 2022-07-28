import 'package:bloc/bloc.dart';
import 'package:lyrically/utility/data_models/data_models.dart';
import 'package:lyrically/utility/repository.dart';
import 'package:meta/meta.dart';

part 'tracks_list_state.dart';

class TracksListCubit extends Cubit<TracksListState> {
  final Repository repository;
  TracksListCubit({required this.repository}) : super(TracksListInitial());

  void fetchTracks() async {
    final tracks = await repository.fetchTracks();
    emit(TracksListFetched(tracks: tracks));
  }
}
