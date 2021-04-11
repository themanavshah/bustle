import 'package:flutter_riverpod/flutter_riverpod.dart';

enum MusicState {
  not_started,
  playing,
  paused,
  completed,
}

class QuizState extends StateNotifierProvider {
  QuizState(create) : super(create);
  bool isPLaying = false;
}
