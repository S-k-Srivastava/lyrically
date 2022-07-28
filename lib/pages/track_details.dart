import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lyrically/cubit/track_details_cubit.dart';
import 'package:lyrically/utility/data_models/data_models.dart';

class TrackDetails extends StatefulWidget {
  final TrackBasicDetails trackDetails;
  const TrackDetails({Key? key, required this.trackDetails}) : super(key: key);

  @override
  State<TrackDetails> createState() => _TrackDetailsState();
}

class _TrackDetailsState extends State<TrackDetails> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TrackDetailsCubit>(context)
        .fetchLyrics(widget.trackDetails.trackId!);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Track Details"),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: 1,
                          color: Colors.red,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          "Track Details",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.red),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: 1,
                          color: Colors.red,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "Track Name : ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Text(
                                  widget.trackDetails.trackName.toString(),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "Track Id : ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Text(
                                  widget.trackDetails.trackId.toString(),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "Artist Name : ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Text(
                                  widget.trackDetails.trackArtist.toString(),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            BlocBuilder<TrackDetailsCubit, TrackDetailsState>(
              builder: (context, state) {
                if (state is! TrackLyricsfetched) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final tracks = state.lyrics;
                return Center(
                    child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.7,
                                height: 1,
                                color: Colors.red,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                "Lyrics",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.red),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.7,
                                height: 1,
                                color: Colors.red,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                tracks,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
