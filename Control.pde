// Grid Music - Probablistic Composition tool (beta)
// Author: Nels Oscar
// Mar 2011
// Modified: spc, 9/30/11 - 10/4/12

String PLY = "Play";
String EXP = "Expand";
String VCS = "Voices";              // number of voices
String EXPLEN = "Expansion Size";  // expansion length
String CNCT = "Concat";             // concatanate or not
String REV = "Reverse";
String TMP = "Tempo";
String MAXSHFT = "MaxShift";
String SCL = "scale";
String MOD = "mode";
String RND = "Random";
String RWLK = "RandomWalk";
String RWLKINT = "RandomInterval";
String HPYBD = "Happy Birthday";
String CLR = "Clear";
String CMPLN = "CompLength";
String SAV = "Melody";
String SAVEXP = "Expansion";
String TRI = "Triangle";
String SQR = "Square";
String SIN = "Sine";
String SAW = "Saw";
String QTR = "Q-Pulse";

void setupControls() {
  controlP5 = new ControlP5(this);
  //cWin.hideCoordinates();

  // Create control groups
  ControlGroup l1 = controlP5.addGroup("cntrls", 20, 10);
  ControlGroup l2 = controlP5.addGroup("scales/modes", 160, 10);
  ControlGroup l3 = controlP5.addGroup("gen", 20, 190);
  ControlGroup l4 = controlP5.addGroup("save", 20, 372);
  ControlGroup l5 = controlP5.addGroup("adsr", 160, 248);
  ControlGroup l6 = controlP5.addGroup("waveform", 20, 280);
  
  // Add controls to WAVEFORM section - stehnce0
  controlP5.addBang(SIN, 0, 4, 20, 20).setGroup(l6);
  controlP5.addBang(SQR, 0, 40, 20, 20).setGroup(l6);
  controlP5.addBang(SAW, 35, 4, 20, 20).setGroup(l6);
  controlP5.addBang(TRI, 35, 40, 20, 20).setGroup(l6);
  controlP5.addBang(QTR, 70, 4, 20, 20).setGroup(l6);
  
  // Add controls to ADSR section - stehnce0
  controlP5.addKnob("atk")
               .setRange(0.01,1)
               .setRadius(15)
               .setPosition(10,4)
               .setValue(0.01)
               .setDragDirection(Knob.VERTICAL)
               .setGroup(l5);
  controlP5.addKnob("dly") //
               .setRange(0.01,1)
               .setRadius(15)
               .setPosition(10,54)
               .setValue(0.05)
               .setDragDirection(Knob.VERTICAL)
               .setGroup(l5);
  controlP5.addKnob("sus")
               .setRange(0,1)
               .setRadius(15)
               .setPosition(60,4)
               .setValue(0.5)
               .setDragDirection(Knob.VERTICAL)
               .setGroup(l5);
  controlP5.addKnob("rel")
               .setRange(0.01,3)
               .setRadius(15)
               .setPosition(60,54)
               .setValue(0.5)
               .setDragDirection(Knob.VERTICAL)
               .setGroup(l5);
                     
  // Add controls to CNTRLS section
  controlP5.addBang(PLY, 0, 4, 20, 20).setGroup(l1);
  controlP5.addBang(EXP, 30, 4, 20, 20).setGroup(l1);
  controlP5.addBang(CLR, 64, 4, 20, 20).setGroup(l1);
  controlP5.addToggle(CNCT, true, 0, 44, 15, 15).setGroup(l1);
  controlP5.addToggle(REV, false, 35, 44, 15, 15).setGroup(l1);
  controlP5.addSlider(VCS, 1, 4, 2, 0, 74, 50, 10).setGroup(l1);
  controlP5.addSlider(EXPLEN, 1, 240, 120, 0, 94, 50, 10).setGroup(l1);
  controlP5.addSlider(MAXSHFT, 0, 16, 8, 0, 114, 50, 10).setGroup(l1);
  controlP5.addSlider(CMPLN, 8, 76, 32, 0, 134, 50, 10).setGroup(l1);
  controlP5.addSlider(TMP, 50, 150, tempo, 0, 154, 50, 10).setGroup(l1);

  // Add generators to GEN section
  controlP5.addBang(RND, 0, 4, 20, 20).setGroup(l3);
  controlP5.addBang(RWLK, 0, 40, 20, 20).setGroup(l3);
  //controlP5.addBang(HPYBD, 60, 4, 20, 20).setGroup(l3);
  controlP5.addBang(RWLKINT, 60, 40, 20, 20).setGroup(l3);
  controlP5.addBang("WEIGHTED RANDOM", 60, 4, 20, 20).setGroup(l3);


  // Add buttons to SAVE section
  controlP5.addButton(SAV, 1.0, 0, 4, 35, 20).setGroup(l4);
  controlP5.addButton(SAVEXP, 2.0, 40, 4, 55, 20).setGroup(l4);
  controlP5.addButton("LOAD", 1.0, 0, 30, 30, 20).setGroup(l4);
  controlP5.addTextfield("FILE").setPosition(35,30).setText("song.seq").setGroup(l4);
  // Add radio buttons to SCALE/MODE section
  RadioButton r = controlP5.addRadio(SCL, 0, 4);
  r.add("A", 0);
  r.add("Bb", 1);
  r.add("B", 2);
  r.add("C", 3);
  r.add("C#", 4);
  r.add("D", 5);
  r.add("Eb", 6);
  r.add("E", 7);
  r.add("Fb", 8);
  r.add("F", 9);
  r.add("Gb", 10);
  r.add("G", 11);
  r.add("G#", 12);
  r.activate(0);
  r.setGroup(l2);
  RadioButton r2 = controlP5.addRadio(MOD, 30, 4);
  r2.add("Mjr", 0);
  r2.add("Mnr", 1);
  r2.add("Pnt", 2);
  r2.add("Whl", 3);
  r2.add("Chr", 4);
  r2.add("Oct", 5);
  r2.add("MS1", 6);
  r2.add("MS2", 7);
  r2.add("MS3", 8);
  r2.add("MS4", 9);
  r2.add("MS5", 10);
  r2.add("MS6", 11);
  r2.add("MS7", 12);
  r2.add("ION", 13);
  r2.add("DOR", 14);
  r2.add("PHR", 15);
  r2.add("LYD", 16);
  r2.add("LD-MXLD", 17);
  r2.add("MXLD", 18);
  r2.add("AEO", 19);
  r2.add("LOC", 20);
  r2.activate(0);
  r2.setGroup(l2);
}

// Event getController for Radio Button scale
public void scale(int theValue) {
  RadioButton b  = (RadioButton) controlP5.getGroup(MOD);
  currScale      = new Scale(theValue+9, (int) b.getValue()); // magic number 9 here !!!
  Slider complen = (Slider) controlP5.getController(CMPLN);
  grid.update(currScale, BASE_DUR, (int) complen.getValue());
}

// Event getController for Radio Button mode
public void mode(int theValue) {
  RadioButton b  = (RadioButton) controlP5.getGroup(SCL);
  currScale      = new Scale((int) b.getValue(), theValue);
  Slider complen = (Slider) controlP5.getController(CMPLN);
  grid.update(currScale, BASE_DUR, (int) complen.getValue());
}

// Event handler for all other getControllers
void controlEvent(ControlEvent theEvent) {
  if (theEvent.isController()) {
    Slider complen=(Slider)controlP5.getController(CMPLN);
    out.setTempo(controlP5.getController(TMP).getValue());
    if (theEvent.getController().getName() == PLY) {
      grid.play();
    } else if (theEvent.getController().getName() == EXP) {
      Slider vcs = (Slider)controlP5.getController(VCS);    // number of voices
      Slider len = (Slider)controlP5.getController(EXPLEN); // expansion length
      Toggle cnct = (Toggle)controlP5.getController(CNCT);  // concatanate or not

      for (int i=0; i<vcs.getValue (); i++) {
        grid.playExp((int)len.getValue(), cnct.getState());
      }

      println("--Playing Expansion--");
      println("max sequence shift:         "+grid.seq.maxPShift);
      println("sequence shift probability: "+grid.seq.tshiftThreshold);
      println("pitch shift probablity:     "+grid.seq.pshiftThreshold);
      println("rest probablity:            "+grid.seq.restThreshold);
    } else if (theEvent.getController().getName()==MAXSHFT) {
      Slider s=(Slider)controlP5.getController(MAXSHFT);
      grid.seq.maxPShift=(int)s.getValue();
    } else if (theEvent.getController().getName()==RND) {
      grid.clear();
      grid.randomMelody();
    } else if (theEvent.getController().getName()==RWLK) {
      grid.clear();
      grid.randomWalkMelody();
    } else if (theEvent.getController().getName()==RWLKINT) {
      grid.clear();
      grid.randomIntervalWalkMelody();
    } else if (theEvent.getController().getName().equals(HPYBD)) {
      happyBirthday();
    } else if (theEvent.getController().getName() == CLR) {
      grid.clear();
    } else if (theEvent.getController().getName() == CMPLN) {
      grid.clear();
      grid.update(currScale, BASE_DUR, (int) complen.getValue());
    } else if (theEvent.getController().getName() == SAV) {
      print("Saving...");
      grid.buildSequence();
      grid.checkModifiers();
      grid.seq.writeSequence();
      println("done");
    } else if (theEvent.getController().getName() == SAVEXP) {
      print("Saving...");
      grid.buildSequence();
      grid.buildSequence();
      grid.checkModifiers();
      Toggle cnct = (Toggle) controlP5.getController(CNCT);
      Slider len = (Slider) controlP5.getController(EXPLEN);
      if (cnct.getState()) {
        // states the original seed before going on to the expansion
        grid.seq = grid.seq.concat(grid.seq.getExpandedSequence((int)len.getValue()));
      } else {
        grid.seq = grid.seq.getExpandedSequence((int)len.getValue());
      }
      grid.seq.writeSequence();
      println("done");
    } else if (theEvent.getController().getName() == SIN) {
      grid.wf = Waves.SINE;
    } else if (theEvent.getController().getName() == SQR) {
      grid.wf = Waves.SQUARE;
    } else if (theEvent.getController().getName() == SAW) {
      grid.wf = Waves.SAW;
    } else if (theEvent.getController().getName() == TRI) {
      grid.wf = Waves.TRIANGLE;
    } else if (theEvent.getController().getName() == QTR) {
      grid.wf = Waves.QUARTERPULSE;
    } else if (theEvent.getController().getName() == "atk") {
      grid.adsr[0]=theEvent.getController().getValue();
    } else if (theEvent.getController().getName() == "dly") {
      grid.adsr[1]=theEvent.getController().getValue();
    } else if (theEvent.getController().getName() == "sus") {
      grid.adsr[2]=theEvent.getController().getValue();
    } else if (theEvent.getController().getName() == "rel") {
      grid.adsr[3]=theEvent.getController().getValue();
    } else if (theEvent.getController().getName() == "LOAD") {
      grid.clear();
      Textfield tf = (Textfield) controlP5.getController("FILE");
      readFile(tf.getText());
    } else if (theEvent.getController().getName() == "WEIGHTED RANDOM") {
      grid.clear();
      grid.randomWeightedInterval();
    }
  }
}