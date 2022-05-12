package add;

import java.io.Serializable;
import java.util.ArrayList;

public class SumBean implements Serializable {
	
	private static final long serialVersionUID = 1L;
	private int num1;
	private int num2;
	private ArrayList<Integer> result;
	//private StringBuilder error; //used to display error message for invalid inputs
	
	public SumBean(){
		//error = new StringBuilder(0);
		result = new ArrayList<Integer>(0);
		result.clear();
	}
	
	/*public StringBuilder getStringBuilder() {
		return error;
	}
	
	public void clearStringBuilder() {
		error.setLength(0);
	}*/
	
	
	public void add() {
		result.add(num1+num2);
	}

	public int getNum1() {
		return num1;
	}

	public void setNum1(String num1) {
		try {
			this.num1 = Integer.parseInt(num1); //try and parse in the JavaBean
		}
		catch(Exception e) {
			//error.append("Invalid value for input 1. Please only enter numbers." + "<br/>");
			this.num1 = 0; //sets num1 to 0 if invalid input is found (temp fix)
		}
	}

	public int getNum2() {
		return num2;
	}

	public void setNum2(String num2) {
		try {
			this.num2 = Integer.parseInt(num2); //try and parse in the JavaBean
		}
		catch(Exception e) {
			//error.append("Invalid value for input 2. Please only enter numbers." + "<br/>");
			this.num1 = 0; //sets num2 to 0 if invalid input is found (temp fix)

		}	
	}
	
	public ArrayList<Integer> getResult() {
		return result;
	}
	
	public void resetList() {
		result.clear();
	}
		
}
