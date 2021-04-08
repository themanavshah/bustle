String secondsToMinute(int time) {
  var min = 0;
  var sec = 0;
  var timeSec = '';
  var onesSec = 0;
  for (int i = 1; i <= time; i++) {
    //print(sec);
    if (i % 60 == 0) {
      min++;
      sec = 0;
      continue;
    }
    sec++;
  }
  if (sec == 0) {
    timeSec = '$min:$onesSec$onesSec';
  } else if (0 <= sec && sec <= 9) {
    timeSec = '$min:$onesSec$sec';
  } else {
    timeSec = '$min:$sec';
  }
  return timeSec;
}
