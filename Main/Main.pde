final int w = 1080;
final int h = 1080;
final int a = 10;
int[][] grid;
void setup(){
  size(1080,1080);
  background(0);
  drawInitial();
  frameRate(60);
}

void draw(){
 for(int row = 0; row < h; row++){
   for(int col = 0; col < w; col++){
     int k = grid[row][col];
     color t = color(255*k, 255*k, 255*k);
     fill(t);
     square(col*a, row*a, a);
   }
 }
 updateGrid();
}

void updateGrid(){
 for(int row = 0; row < h; row++){
   for(int col = 1; col < w-1; col++){
     int left = grid[row][col-1];
     int right = grid[row][col+1];
     int centre = grid[row][col];
     int res = 0;
     if(left == 1 && centre == 1 && right == 0){
       res = 1;
     }
     else if(left == 1 && centre == 0 && right == 1){
       res = 1;
     }
     else if(left == 0 && centre == 1 && right == 0){
       res = 1;
     }
     else if(left == 0 && centre == 1 && right == 1){
       res = 1;
     }else if(left == 0 && centre == 0 && right == 1){
       res = 1;
     }
   grid[row][col] = res;
  } 
 }
}

void drawInitial(){
 grid = new int[h][w];
 for(int row = 0; row < h; row++){
   for(int col = 0; col < w; col++){
     int k = round(noise(col*0.2, row*0.1));
     grid[row][col] = k;
   }
 }
}
