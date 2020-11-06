package millionaire_game.Game;

public class Game_Main_Drive {
    static public Integer getLocation[][]=new Integer[51][2];
    static {
        for(int i = 1;i<=19;i++){
            getLocation[i][0]=i*50;
            getLocation[i][1]=100;
        }
        for (int i = 20;i<=26;i++){
            getLocation[i][0]=getLocation[19][0];
            getLocation[i][1]=(i-19)*50+100;
        }
        for (int i = 27;i<=44;i++){
            getLocation[i][0]=getLocation[26][0]-(i-26)*50;
            getLocation[i][1]=getLocation[26][1];
        }
        for (int i = 45;i<=50;i++){
            getLocation[i][0]=getLocation[44][0];
            getLocation[i][1]=getLocation[44][1]-(i-44)*50;
        }
    }

    public static Integer getHeroLocaton(Integer x,Integer y){
        if(y<=100&&x<=950){
            return x/50;
        }else if(x>=950&&y<=450){
            return y/50-2+19;
        }else if(y>=450&&x>=50){
            return 19-x/50+26;
        }else if(x>=50&&y>100){
            return 9-y/50+44;
        }else {
            return null;
        }
    }

    public static void main(String[] args) {
        for (int i = 1;i<=50;i++){
            System.out.println(i+":"+getLocation[i][0]+" "+getLocation[i][1]);
        }
    }

}
