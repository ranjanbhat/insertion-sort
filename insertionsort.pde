import processing.sound.*;

SoundFile s;
float count=500;

float[] arr=new float[101];
float r;
int dx;

void setup()
{
  fullScreen();
  for(int i=0; i<arr.length-1; i++)
  arr[i+1]=random(1000);
  dx=width/101;
  arr[0]=0;
  s=new SoundFile(this,"beep-07.mp3");
   
}

void show(int a)
{
  fill(255);
  clear();
  for(int i=1,j=0; i<width && j<101; i+=dx, j++)
  {
    if(a==j) fill(255,0,0);
    rect(i,0.95*height-arr[j],dx,arr[j]);
    fill(255);
  }
}

void show()
{
  fill(255);
  clear();
  for(int i=1,j=0; i<width && j<101; i+=dx, j++)
  {
    rect(i,0.95*height-arr[j],dx,arr[j]);
  }
}

int i=2;
int pos=i-1;
float temp=arr[i];  
  
void draw()
{
  //background(0);
  //show();

  if(arr[pos]>temp)
  {
    arr[pos+1]=arr[pos];
    show(pos);
    //arr[pos]=temp;
    pos--;
    //for(int w=0; w>0; w++)for(int x=0; x>0; x++)for(int y=0; y>0; y++);
    ////s.stop();
  }
  else
    { i++;
      arr[pos+1]=temp;
      pos=i-1;
      if(i<101)
      temp=arr[i];
      
      s.play(0.5);
    }
  if(i==101) noLoop();
}
