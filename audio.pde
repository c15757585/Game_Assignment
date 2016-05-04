/*disabled due to being bugged

==== JavaSound Minim Error ====
==== Error invoking createInput on the file loader object: null

class PlayAudio {
  PlayAudio() {
    sample = minim.loadSample("song.mp3", 2048);
    snippet = minim.loadSnippet("song.mp3");
  }

  void playSnippet() {
    sample.trigger();
    snippet.play();
  }
}*/

