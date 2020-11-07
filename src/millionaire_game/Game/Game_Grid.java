package millionaire_game.Game;

import millionaire_game.dao.Character_Operate_Dao;
import millionaire_game.dao.Character_Record_OP_Dao;
import millionaire_game.javabean.Character_Message_bean;
import millionaire_game.javabean.Character_Record_bean;
import millionaire_game.servlet.Ajax_packAndSend;

import java.util.HashMap;
import java.util.Map;

public class Game_Grid {

    public static Map<String,Integer> randomWeight=new HashMap<>();
    public static String grids[]=new String[51];
    static {
        randomWeight.put( "Grid_Block", 1);
        randomWeight.put("Grid_Circle",2);
        randomWeight.put("Grid_Colour",1);
        randomWeight.put("Grid_Fork_Big",1);
        randomWeight.put("Grid_Down_Yellow",1);
        randomWeight.put("Grid_None_Green",1);
        grids[1]="Grid_FINISH";
    }

    public static void GridElement(String str){

        Ajax_packAndSend.pack("respond",str);
        Character_Message_bean cmb=Character_Message_bean.getCM();
        if("Grid_Circle".equals(str)){
            ReflushGrids();
            cmb.setRecord(Game_Grid.GridsToString());
            Ajax_packAndSend.pack("respond","Grid_Circle");
            cmb.setHealth(cmb.getHealth()+2);
            if(cmb.getHealth()>10){
                cmb.setHealth(10);
            }
        }
        if("Grid_Fork_Big".equals(str)){
            cmb.setHealth(cmb.getHealth()-2);
        }
        if("Grid_Colour".equals(str)){
            cmb.setGold(cmb.getGold()+10);
        }
        if("Grid_Down_Yellow".equals(str)){
            cmb.setGold(cmb.getGold()-5);
        }

        if("Grid_FINISH".equals(str)){
            cmb.setGold(cmb.getGold()+20);
        }

        if("Grid_None_Green".equals(str)){
            cmb.setGold(cmb.getGold()-1);
        }

        if(cmb.getGold()<=0||cmb.getHealth()<=0){
            Ajax_packAndSend.pack("sss","shibai");
            Character_Record_bean crb = new Character_Record_bean(null,
                    Character_Message_bean.getCM().getName(),
                    null,
                    false
                    );
            Character_Record_OP_Dao.add(crb);
            Character_Operate_Dao.deleteDate(Character_Message_bean.getCM().getId());
            Character_Message_bean.exitCM();
        }else if(cmb.getGold()>=100){
            Character_Record_bean crb = new Character_Record_bean(null,
                    Character_Message_bean.getCM().getName(),
                    null,
                    true
            );
            Character_Record_OP_Dao.add(crb);
            Character_Operate_Dao.deleteDate(Character_Message_bean.getCM().getId());
            Ajax_packAndSend.pack("sss","chenggong");
            Character_Message_bean.exitCM();
        }else {
            Ajax_packAndSend.pack("sss","www");
        }

    }

    public static String randomGrid(){
        int i = 0;
        Map<String,Integer> random = new HashMap<>();
        i+=randomWeight.get("Grid_Block");
        random.put("Grid_Block",i);
        i+=randomWeight.get("Grid_Circle");
        random.put("Grid_Circle",i);
        i+=randomWeight.get("Grid_Colour");
        random.put("Grid_Colour",i);
        i+=randomWeight.get("Grid_Fork_Big");
        random.put("Grid_Fork_Big",i);
        i+=randomWeight.get("Grid_Down_Yellow");
        random.put("Grid_Down_Yellow",i);
        i+=randomWeight.get("Grid_None_Green");
        random.put("Grid_None_Green",i);

       int answer = (int)(Math.random()*i);
        if(answer<random.get("Grid_Block")){
            return "Grid_Block";
        }else if(answer<random.get("Grid_Circle")){
            return "Grid_Circle";
        }else if(answer<random.get("Grid_Colour")){
            return "Grid_Colour";
        }else if(answer<random.get("Grid_Fork_Big")){
            return "Grid_Fork_Big";
        }else if(answer<random.get("Grid_Down_Yellow")){
            return "Grid_Down_Yellow";
        }else if(answer<random.get("Grid_None_Green")){
            return "Grid_None_Green";
        }else {
            return null;
        }
    }

    public static void ReflushGrids(){
        for (int i = 2; i<=50;i++){
            grids[i]=randomGrid();
        }
    }

    public static String GridsToString(){
        StringBuffer sb = new StringBuffer();
        sb.append("grids:");
        for (int i = 1;  i<=50 ;i++){
            sb.append(",");
            if(grids[i].equals("Grid_FINISH")){
                sb.append("1");
            }
            if(grids[i].equals("Grid_Block")){
                sb.append("2");
            }
            if(grids[i].equals("Grid_Circle")){
                sb.append("3");
            }
            if(grids[i].equals("Grid_Colour")){
                sb.append("4");
            }
            if(grids[i].equals("Grid_Fork_Big")){
                sb.append("5");
            }
            if(grids[i].equals("Grid_Down_Yellow")){
                sb.append("6");
            }
            if(grids[i].equals("Grid_None_Green")){
                sb.append("7");
            }
        }
        return sb.toString();
    }

    public static void readGrids(String str){
        String sb[] = str.split(",");
        for(int i =1 ; i<= 50 ;i++){
            if("1".equals(sb[i])){
                grids[i]="Grid_FINISH";
            }
            if("2".equals(sb[i])){
                grids[i]="Grid_Block";
            }
            if("3".equals(sb[i])){
                grids[i]="Grid_Circle";
            }
            if("4".equals(sb[i])){
                grids[i]="Grid_Colour";
            }
            if("5".equals(sb[i])){
                grids[i]="Grid_Fork_Big";
            }
            if("6".equals(sb[i])){
                grids[i]="Grid_Down_Yellow";
            }
            if("7".equals(sb[i])){
                grids[i]="Grid_None_Green";
            }
        }
    }

}
