// Grid Music - Probablistic Composition tool (beta)
// Author: Nels Oscar
// Mar 2011

class Block {

  PVector pos, s;
  int pitch, on, off, col;
  float duration;
  boolean isset=false;

  Block(PVector pos, PVector s, int note, float dur) {
    this.pos=pos;
    this.s=s;
    pitch=note;
    duration=dur;
    on=color(0, 255, 0);
    off=color(0, 100, 200);
  }

  void show() {
    rectMode(CENTER);
    col= isset ? color(on) : color(off);
    fill(col);
    rect(pos.x, pos.y, s.x, s.y);
  }

  boolean isSet() {
    return isset;
  }

  boolean contains(PVector v) {
    if (v.x<=pos.x+s.x/2. && v.x>=pos.x-s.x/2. &&
      v.y<=pos.y+s.y/2. && v.y>=pos.y-s.y/2. ) {
      isset=!isset;   
      return true;
    } else {
      return false;
    }
  }
}