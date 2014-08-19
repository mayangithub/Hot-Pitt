package bean;
import java.util.*;
import bean.*;

//a java bean is used to save all message records
public class BookData {
	private Collection<Record> list;
	
	public void setList(Collection<Record> list){
		this.list=list;
	}
	public Collection<Record> getList(){
		return this.list;
	}
}
