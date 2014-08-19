package bean;

//a java bean is used to save Record object and its data.

import java.sql.Timestamp;

public class Record {
    
        public int eid;
        public String title;
        public String type;
        public Timestamp startTime;
        public Timestamp endTime;
        public String loc;
        public String info;
        public int cntCome;
        public int cntMayCome;
        public int score;
        public String contact;
        public String dpt;
        public double aRate;
        public int cntRate;
	
	public Record(int eid, String title, String type, Timestamp startTime, Timestamp endTime, String loc, String info, int cntCome, int cntMayCome, int score, String contact, String dpt, double aRate, int cntRate){
                this.eid = eid;
                this.title = title;
                this.type = type;
                this.startTime = startTime;
                this.endTime = endTime;
                this.loc = loc;
                this.info = info;
                this.cntCome = cntCome;
                this.cntMayCome = cntMayCome;
                this.score = score;
                this.contact = contact;
                this.dpt = dpt;
                this.aRate = aRate;
                this.cntRate = cntRate;        
	}
}
