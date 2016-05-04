
class PlayAudio {
  PlayAudio() {
    sample = minim.loadSample("token.mp3", 2048);
    snippet = minim.loadSnippet("token.mp3");
  }

  void playSnippet() {
    sample.trigger();
    snippet.play();
  }
}

