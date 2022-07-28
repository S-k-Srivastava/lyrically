import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lyrically/cubit/track_details_cubit.dart';
import 'package:lyrically/cubit/tracks_list_cubit.dart';
import 'package:lyrically/pages/track_details.dart';
import 'package:lyrically/pages/track_lists.dart';
import 'package:lyrically/utility/data_models/data_models.dart';
import 'package:lyrically/utility/network_service.dart';
import 'package:lyrically/utility/repository.dart';

class AppRouter {
  late Repository repository;
  late TracksListCubit tracksListCubit;
  late TrackDetailsCubit trackDetailsCubit;

  AppRouter() {
    repository = Repository(networkService: NetworkService());
    tracksListCubit = TracksListCubit(repository: repository);
    trackDetailsCubit = TrackDetailsCubit(repository: repository);
  }

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: tracksListCubit,
            child: const TrackLists(),
          ),
        );
      case 'track_details':
        TrackBasicDetails tracks = settings.arguments as TrackBasicDetails;
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: trackDetailsCubit,
            child: TrackDetails(
              trackDetails: tracks,
            ),
          ),
        );
      default:
        return MaterialPageRoute(builder: (context) => const TrackLists());
    }
  }
}
