import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:mudeo/constants.dart';
import 'package:mudeo/data/models/artist_model.dart';
import 'package:mudeo/data/models/song_model.dart';

part 'ui_state.g.dart';

abstract class UIState implements Built<UIState, UIStateBuilder> {
  factory UIState() {
    return _$UIState._(
      selectedTabIndex: kTabExplore,
      recordingTimestamp: 0,
      song: SongEntity(),
      artist: ArtistEntity(),
    );
  }

  UIState._();

  int get selectedTabIndex;

  int get recordingTimestamp;

  SongEntity get song;

  ArtistEntity get artist;

  Duration get recordingDuration => Duration(
      milliseconds: DateTime.now().millisecondsSinceEpoch -
          recordingTimestamp);

  bool get isRecording => recordingTimestamp > 0;

  static Serializer<UIState> get serializer => _$uIStateSerializer;
}
