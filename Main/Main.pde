import java.util.*;

final int W = 1080;
final int H = 720;
final int a = 10;
final int w = W / a;
final int h = H / a;

int[][] grid;



void setup(){
  size(1080,720);
  frameRate(2);
  background(0);
  drawInitial();
  //printAllPossible();
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
 //noLoop();
}

void updateGrid(){
 int[][] temp = new int[h][w];
 for(int row = 1; row < h-1; row++){
   for(int col = 1; col < w-1; col++){
    StringBuilder r = new StringBuilder();
     for(int i = -1; i <= 1; i++){
       for(int j = -1; j <= 1; j++){
         if(i == 0 && j == 0){
           continue;
         }
         else r.append(grid[row + i][col + j]);
       }
     }
     for(String rule: ruleSet.keySet()){
        if(rule.equals(r.toString())){
          temp[row][col] = ruleSet.get(rule);
          break;
        }
    } 
   }
  }
  grid = temp;
}

void drawInitial(){
 grid = new int[h][w];
 for(int row = 0; row < h; row++){
   for(int col = 0; col < w; col++){
     int k = round(random(0.55));
     //int k = round(noise(col*0.12, row*0.321));
     grid[row][col] = k;
   }
 }
}

void printAllPossible(){
  for(int i = 0; i < 255; i++){
    byte t = (byte)i;
    String s1 = String.format("put(\"%8s\",0);", Integer.toBinaryString(t & 0xFF)).replace(' ', '0');
    println(s1);
  }
}


Map<String, Integer> ruleSet = new HashMap(){{
   put("00000000",0);
  put("00000001",0);
  put("00000010",0);
  put("00000011",1);
  put("00000100",0);
  put("00000101",1);
  put("00000110",1);
  put("00000111",1);
  put("00001000",0);
  put("00001001",1);
  put("00001010",1);
  put("00001011",1);
  put("00001100",1);
  put("00001101",1);
  put("00001110",1);
  put("00001111",0);
  put("00010000",0);
  put("00010001",1);
  put("00010010",1);
  put("00010011",1);
  put("00010100",1);
  put("00010101",1);
  put("00010110",1);
  put("00010111",0);
  put("00011000",1);
  put("00011001",1);
  put("00011010",1);
  put("00011011",0);
  put("00011100",1);
  put("00011101",0);
  put("00011110",0);
  put("00011111",0);
  put("00100000",0);
  put("00100001",1);
  put("00100010",1);
  put("00100011",1);
  put("00100100",1);
  put("00100101",1);
  put("00100110",1);
  put("00100111",0);
  put("00101000",1);
  put("00101001",1);
  put("00101010",1);
  put("00101011",0);
  put("00101100",1);
  put("00101101",0);
  put("00101110",0);
  put("00101111",0);
  put("00110000",1);
  put("00110001",1);
  put("00110010",1);
  put("00110011",0);
  put("00110100",1);
  put("00110101",0);
  put("00110110",0);
  put("00110111",0);
  put("00111000",1);
  put("00111001",0);
  put("00111010",0);
  put("00111011",0);
  put("00111100",0);
  put("00111101",0);
  put("00111110",0);
  put("00111111",0);
  put("01000000",0);
  put("01000001",1);
  put("01000010",1);
  put("01000011",1);
  put("01000100",1);
  put("01000101",1);
  put("01000110",1);
  put("01000111",0);
  put("01001000",1);
  put("01001001",1);
  put("01001010",1);
  put("01001011",0);
  put("01001100",1);
  put("01001101",0);
  put("01001110",0);
  put("01001111",0);
  put("01010000",1);
  put("01010001",1);
  put("01010010",1);
  put("01010011",0);
  put("01010100",1);
  put("01010101",0);
  put("01010110",0);
  put("01010111",0);
  put("01011000",1);
  put("01011001",0);
  put("01011010",0);
  put("01011011",0);
  put("01011100",0);
  put("01011101",0);
  put("01011110",0);
  put("01011111",0);
  put("01100000",1);
  put("01100001",1);
  put("01100010",1);
  put("01100011",0);
  put("01100100",1);
  put("01100101",0);
  put("01100110",0);
  put("01100111",0);
  put("01101000",1);
  put("01101001",0);
  put("01101010",0);
  put("01101011",0);
  put("01101100",0);
  put("01101101",0);
  put("01101110",0);
  put("01101111",0);
  put("01110000",1);
  put("01110001",0);
  put("01110010",0);
  put("01110011",0);
  put("01110100",0);
  put("01110101",0);
  put("01110110",0);
  put("01110111",0);
  put("01111000",0);
  put("01111001",0);
  put("01111010",0);
  put("01111011",0);
  put("01111100",0);
  put("01111101",0);
  put("01111110",0);
  put("01111111",0);
  put("10000000",0);
  put("10000001",1);
  put("10000010",1);
  put("10000011",1);
  put("10000100",1);
  put("10000101",1);
  put("10000110",1);
  put("10000111",0);
  put("10001000",1);
  put("10001001",1);
  put("10001010",1);
  put("10001011",0);
  put("10001100",1);
  put("10001101",0);
  put("10001110",0);
  put("10001111",0);
  put("10010000",1);
  put("10010001",1);
  put("10010010",1);
  put("10010011",0);
  put("10010100",1);
  put("10010101",0);
  put("10010110",0);
  put("10010111",0);
  put("10011000",1);
  put("10011001",0);
  put("10011010",0);
  put("10011011",0);
  put("10011100",0);
  put("10011101",0);
  put("10011110",0);
  put("10011111",0);
  put("10100000",1);
  put("10100001",1);
  put("10100010",1);
  put("10100011",0);
  put("10100100",1);
  put("10100101",0);
  put("10100110",0);
  put("10100111",0);
  put("10101000",1);
  put("10101001",0);
  put("10101010",0);
  put("10101011",0);
  put("10101100",0);
  put("10101101",0);
  put("10101110",0);
  put("10101111",0);
  put("10110000",1);
  put("10110001",0);
  put("10110010",0);
  put("10110011",0);
  put("10110100",0);
  put("10110101",0);
  put("10110110",0);
  put("10110111",0);
  put("10111000",0);
  put("10111001",0);
  put("10111010",0);
  put("10111011",0);
  put("10111100",0);
  put("10111101",0);
  put("10111110",0);
  put("10111111",0);
  put("11000000",1);
  put("11000001",1);
  put("11000010",1);
  put("11000011",0);
  put("11000100",1);
  put("11000101",0);
  put("11000110",0);
  put("11000111",0);
  put("11001000",1);
  put("11001001",0);
  put("11001010",0);
  put("11001011",0);
  put("11001100",0);
  put("11001101",0);
  put("11001110",0);
  put("11001111",0);
  put("11010000",1);
  put("11010001",0);
  put("11010010",0);
  put("11010011",0);
  put("11010100",0);
  put("11010101",0);
  put("11010110",0);
  put("11010111",0);
  put("11011000",0);
  put("11011001",0);
  put("11011010",0);
  put("11011011",0);
  put("11011100",0);
  put("11011101",0);
  put("11011110",0);
  put("11011111",0);
  put("11100000",1);
  put("11100001",0);
  put("11100010",0);
  put("11100011",0);
  put("11100100",0);
  put("11100101",0);
  put("11100110",0);
  put("11100111",0);
  put("11101000",0);
  put("11101001",0);
  put("11101010",0);
  put("11101011",0);
  put("11101100",0);
  put("11101101",0);
  put("11101110",0);
  put("11101111",0);
  put("11110000",0);
  put("11110001",0);
  put("11110010",0);
  put("11110011",0);
  put("11110100",0);
  put("11110101",0);
  put("11110110",0);
  put("11110111",0);
  put("11111000",0);
  put("11111001",0);
  put("11111010",0);
  put("11111011",0);
  put("11111100",0);
  put("11111101",0);
  put("11111110",0);
}};
