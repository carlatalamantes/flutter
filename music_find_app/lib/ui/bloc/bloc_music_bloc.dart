import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

part 'bloc_music_event.dart';
part 'bloc_music_state.dart';

class BlocMusicBloc extends Bloc<BlocMusicEvent, BlocMusicState> {
  BlocMusicBloc() : super(BlocMusicInitial()) {
    on<StartRecording>(startRecord);
  }

  Future getDirectoryPath() async {
    Directory root = await getTemporaryDirectory();
    String _path = "${root.path}/recording.mp3";
    return _path;
  }

  Future startRecord(event, emit) async {
    final _audioRecorder = Record();

    var _path = await getDirectoryPath();

    if (await _audioRecorder.hasPermission()) {
      await _audioRecorder.start(
        path: _path,
        encoder: AudioEncoder.aacHe,
        bitRate: 128000,
        samplingRate: 44100,
      );
      await Future.delayed(const Duration(seconds: 7));
      final path = await _audioRecorder.stop();
      File file = File(path!);
      List<int> fileBytes = await file.readAsBytes();
      String finalFile = base64Encode(fileBytes);

      final response = await http.post(
        Uri.parse('https://api.audd.io/");'),
        headers: {
          'Content-Type': 'multipart/form-data',
        },
        body: jsonEncode(<String, dynamic>{
          'api_token': '115a65141c4cbc980b3adc6456d530d7',
          'return': 'apple_music,spotify',
          'audio': finalFile,
          'method': 'recognize',
        }),
      );

      print(response.body);

      var decodedResponse = jsonDecode(response.body);

      if (decodedResponse['result'] != null) {
        emit(AudDSuccess(
            artist: decodedResponse['result']['artist'],
            title: decodedResponse['result']['title'],
            album: decodedResponse['result']['album'],
            year: decodedResponse['result']['release_date'],
            image: decodedResponse['result']['spotify']['album']['images'][0]
                ['url'],
            linkSpotify: decodedResponse['result']['spotify']['external_urls']
                ['spotify'],
            linkApple: decodedResponse['result']['apple_music']['url'],
            linkAll: decodedResponse['result']['song_link']));
      } else {
        emit(AudDFailed());
      }
    } else {
      throw 'Microphone permission not granted';
    }
  }
}
