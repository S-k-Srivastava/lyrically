import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lyrically/cubit/tracks_list_cubit.dart';
import 'package:lyrically/utility/data_models/data_models.dart';

class TrackLists extends StatefulWidget {
  const TrackLists({Key? key}) : super(key: key);

  @override
  State<TrackLists> createState() => _TrackListsState();
}

class _TrackListsState extends State<TrackLists> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TracksListCubit>(context).fetchTracks();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Available Lyrics"),
        centerTitle: true,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(20),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: Container(
              color: Colors.white,
              height: 20,
            ),
          ),
        ),
      ),
      body: BlocBuilder<TracksListCubit, TracksListState>(
        builder: (context, state) {
          if (state is! TracksListFetched) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final tracks = state.tracks;
          print(tracks);
          return SingleChildScrollView(
            child: Column(
              children: tracks.map((e) => _tracksCard(e, context)).toList(),
            ),
          );
        },
      ),
    );
  }

  Widget _tracksCard(
      TrackBasicDetails trackBasicDetails, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, 'track_details',
              arguments: trackBasicDetails);
        },
        child: Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(2000),
                    child: Image.network(
                      "https://wallpapercave.com/wp/wp9157761.jpg",
                      width: 50,
                      fit: BoxFit.contain,
                      height: 50,
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text(
                          "Track Name : ${trackBasicDetails.trackName!}",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                          "Track Id : ${trackBasicDetails.trackId!.toString()}"),
                      const SizedBox(
                        height: 5,
                      ),
                      Text("Artist Name : ${trackBasicDetails.trackArtist!}"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
