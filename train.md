# Train Your DoodleBot!

Sound classification
Main steps : 
Set up a server with the boilerplace that uses ML5
Use a pre-trained model speech-commands to recognize speech
Design a web interface that recognized the speech word and prints it to a file
Use this file to load the current speech and send it to Arduino 




Color coding : 
code in sublime text : index.html
Code in sublime text : sketch.js
Code in terminal 

Step 1 : Set up a server with the boilerplate that uses ML5

Download the boilerplate here : https://drive.google.com/open?id=14w6u65YhrZ5H0LI_JHK-Zqxa3Mltz3X1
In the folder above, you will find two files : index.html and sketch.js. Your HTML code (interface) will go in index.html file, and your Javascript code will go in the sketch.js file. 
Let’s examine the files : 
Index.html : 

Verify that your code looks like this : 

This code contains html tags <head> and <body>. In the <head>, we load all the p5.js libraries which are responsible for the look and feel of the webpage and in the <body>, we load the sketch.js file, while is responsible for the logic of the webpage. 

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Getting Started with ml5.js</title>
    <!-- p5 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/0.8.0/p5.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/0.8.0/addons/p5.dom.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/0.8.0/addons/p5.sound.min.js"></script>
    <!-- ml5 -->
    <script src="https://unpkg.com/ml5@0.3.0/dist/ml5.min.js"></script>
  </head>

  <body>
    <script src="sketch.js"></script>
  </body>
</html>




Sketch.js

This is the base sketch file. All p5.js files have a setup() function, where you set up your space, and a draw() which updates constantly to run stuff. To learn more, go to : https://p5js.org


console.log('ml5 version:', ml5.version);

function setup(){
    createCanvas(400, 400);
}

function draw(){
    background(200);
    
}

In this sketch.js file, we simply make a canvas and we print the ml5 version to our console in the browser. We will first test if this works.
	
Run the server. 

In order to test if this is working, we will run a local server. 

Go to your terminal, and navigate to the directory: 

First navigate to home directory : 
cd
Then navigate to the project directory (this will depend on where your boilerplate folder is):
cd Documents/biolerplate-sound
Your folder might be in downloads instead of documents for example, if this is the case, replace the cd Documents/ part with cd Downloads/


In this folder, run the following command in your terminal to start a local server : 
python -m SimpleHTTPServer 8000

If you get an error here, check what python version you have by using which python in your terminal. It should give you a result like : /Library/Frameworks/Python.framework/Versions/2.7/bin/python
This also works:
(//anaconda3/bin/python)
If this is the case put in  python3 -m http.server instead
 python3 -m http.server

If it leads to no result, it means you need to install python. 

In order to test if the server is running, go to : http://localhost:8000 on your browser and you should see this : 



If right click and go to inspect element > and then select the ‘console’ tab, you can see the browser’s console. In the console, you should see : 0.3.0 to verify that your server is working correctly. 

Now stop your server in the terminal. If you Control+C in your terminal, the server should stop. 

Step 2 : Use a pre-trained model SoundClassifier to recognize speech words : 

The model we will be using is called speech-commands recognizer model. The ml5.soundClassifier() allows you to classify audio. With the right pre-trained models, you can detect whether a certain noise was made (e.g. a clapping sound or a whistle) or a certain word was said (e.g. Up, Down, Yes, No). At this moment, with the ml5.soundClassifier(), you can use the "SpeechCommands18w" which can recognize "the ten digits from "zero" to "nine", "up", "down", "left", "right", "go", "stop", "yes", "no", as well as the additional categories of "unknown word" and "background noise"."

To read more about this mode, go to : https://github.com/tensorflow/tfjs-models/tree/master/speech-commands

For our application, we will use numbers, directions, “go”, and “stop” to make the doodle bot draw things. Ensure that your Arduino file has functions for all of these (zero" to "nine", "up", "down", "left", "right", "go", "stop")
Open the index.html file. In the <head> tag, let’s first make the title of the page relevant to sound classification. 

<title>Sound classification using SpeechCommands18w and p5.js</title>

In the body tag, we will write some info to display what the model is actually doing.



<body>
  <h1>Sound classification using SpeechCommands18w and p5.js</h1>
  <p>Try to speak the following commands to your microphone: 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'up', 'down', 'left', 'right', 'go', 'stop', 'yes', and 'no', in addition to 'background_noise' and 'unknown'</p>
  <script src="sketch.js"></script>
</body>

Open the sketch.js file. Let’s first get rid of the createCanvas from the biolerplate, since we don’t need that. In addition to the setup() and sketch() function, we will add a preload() function before setup(). The preload() function loads the model in advance, in effect saving us time to load the model (when it is added in setup()), even before the interface is loaded. We do this since it quickens the process of loading the model, which is typically time consuming.


function preload() {
  // Load SpeechCommands18w sound classifier model
  classifier = ml5.soundClassifier('SpeechCommands18w', options);
}

We will now declare some variables in the beginning of this file.


// Initialize a sound classifier method with SpeechCommands18w model.
let classifier;
// Options for the SpeechCommands18w model, the default probabilityThreshold is 0
const options = { probabilityThreshold: 0.7 };
// Two variable to hold the label and confidence of the result
let label;
let confidence;

Setup

function setup() {
  noCanvas();
  // Create 'label' and 'confidence' div to hold results
  label = createDiv('Label: ...');
  confidence = createDiv('Confidence: ...');
  // Classify the sound from microphone in real time
  classifier.classify(gotResult);
}

GotResult
// A function to run when we get any errors and the results
function gotResult(error, results) {
  // Display error in the console
  if (error) {
    console.error(error);
  }
  // The results are in an array ordered by confidence.
  console.log(results);
  // Show the first label and confidence
  label.html('Label: ' + results[0].label);
  confidence.html('Confidence: ' + nf(results[0].confidence, 0, 2)); // Round the confidence to 0.01
}


Finally, your sketch.js file should look this this : 


// Initialize a sound classifier method with SpeechCommands18w model. A callback needs to be passed.
let classifier;
// Options for the SpeechCommands18w model, the default probabilityThreshold is 0
const options = { probabilityThreshold: 0.7 };
// Two variable to hold the label and confidence of the result
let label;
let confidence;

function preload() {
  // Load SpeechCommands18w sound classifier model
  classifier = ml5.soundClassifier('SpeechCommands18w', options);
}

function setup() {
  noCanvas();
  // Create 'label' and 'confidence' div to hold results
  label = createDiv('Label: ...');
  confidence = createDiv('Confidence: ...');
  // Classify the sound from microphone in real time
  classifier.classify(gotResult);
}

// A function to run when we get any errors and the results
function gotResult(error, results) {
  // Display error in the console
  if (error) {
    console.error(error);
  }
  // The results are in an array ordered by confidence.
  console.log(results);
  // Show the first label and confidence
  label.html('Label: ' + results[0].label);
  confidence.html('Confidence: ' + nf(results[0].confidence, 0, 2)); // Round the confidence to 0.01
}


Now run your server again (Step 3.c.) and load the localhost in your browser. 



Now write the result to a file in your arduino folder by using the write(data) function of p5.js. Read that file using Arduino IDE to tell the robot what to draw. 

For reference: 
P5.js side (in your sketch.js file) : https://p5js.org/reference/#/p5.PrintWriter/write
Arduino side (in your .ino file) https://www.arduino.cc/en/Reference/FileRead
