final int w = 480;
final int h = 480;
void setup(){
  size(480,480);
  background(0);
  fill(255);
  circle(w/2, h/2, 45);
}

void draw(){
 loadPixels();
 for(int row = 0; row < h; row++){
   for(int col = 0; col < w; col++){
     int k = round(noise(col, row));
     color t = color(255*k, 255*k, 255*k);
     print(row * w + col);
     pixels[row * w + col] = t;
   }
 }
 updatePixels();
}
