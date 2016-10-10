class human{
      PVector hloc = new PVector (mouseX, mouseY);

  human(){
    
  }
  
  void humyDisplay(int x, int y){
    hloc.set(x, y);
    fill(0);
    ellipse(hloc.x, hloc.y, 15, 15);
  }
  
  void oscillate(){
  }
}