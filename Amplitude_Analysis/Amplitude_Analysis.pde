// NOTE: First time only when running this code, need to:
// 1. Go to Sketch menu.
// 2. Choose Import Library.
// 3. Choose Add Library.
// 4. Search for 'Sound' library, and install, then restart Processing.

// Load the sound library
import processing.sound.*;

// Object to read the sound file
SoundFile file;

// Object to analyze the sound file
Amplitude amp;

// Variable to store amplitude of current sample from audio file
float currentAmplitude = 0;

void setup() {

  // Canvas characteristics
  size(500, 500);
  background(0); // black

  // Load a soundfile from the /data folder of the sketch and play it back
  file = new SoundFile(this, "william_tell_overture_excerpt.mp3");
  file.play();

  // Create an Amplitude analyzer
  amp = new Amplitude(this);

  // Set the sound file as input to the analyzer
  amp.input(file);
}      

void draw() {

  // Erase whatever was drawn last time the draw() function looped
  noStroke();
  fill(0); // black
  rect(0, 0, width, height);
  
  // Get the current amplitude from the analyzer
  // Will always return a float value between 0 and 1
  currentAmplitude = amp.analyze();

  // Print the raw output of the analysis to the console
  println(currentAmplitude);

  // Use the amplitude value to draw a circle in centre of screen
  // Maximum diameter of 500 pixels (when currentAmplitude is 1)
  noFill();
  stroke(255); // white
  ellipse(width/2, height/2, currentAmplitude * width, currentAmplitude * height);
}
