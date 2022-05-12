package add;

import java.io.Serializable;

//used to validate input from the Register form. 
//If not valid, then prompt exRegister to redirect back to Register.jsp w/ the correct error messages.
public class AddressBean implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String firstName;
	private String surName;
	private int telephone;
	private int mobile;
	private String email;
	private String address;
	private int postalNumber;
	private String town;
	private String country;
	StringBuilder error; //used to send error messages back to webpage
	
	public AddressBean(){
		error = new StringBuilder(); 
		firstName = null;
		surName = null;
		email = null;
		address = null;
		town = null;
		country = null;
	}
	
	public String getStringBuilder() {
		return error.toString();
	}
	
	public void clearStringBuilder() {
		error.setLength(0);
	}
	
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	
	public String getSurName() {
		return surName;
	}
	public void setSurName(String surName) {
		this.surName = surName;
	}
	
	public int getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		try {
			int phoneNum = Integer.parseInt(telephone); //try and parse string into integer
			if(telephone.length() != 10) { //if length is not 10 digits
				error.append("Invalid telephone number. Please only enter 10 digits for the telephone number." + "<br/>");		
			}
			else {
				this.telephone = phoneNum; 
			}
		}
		catch(Exception e) { //if NumberFormatException
			error.append("Invalid telephone number. Please only enter numbers for the telephone number." + "<br/>");		

		}
	}
	
	public int getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		try {
			int mobileNum = Integer.parseInt(mobile); //try and parse string into integer
			if(mobile.length() != 10) { //if mobile # length is not 10 digits
				error.append("Invalid mobile number. Please only enter 10 digits for the mobile number." + "<br/>");		
			}
			else {
				this.mobile = mobileNum;
			}
		}
		catch(Exception e) { //if NumberFormatException
			error.append("Invalid mobile number. Please only enter numbers for the mobile number." + "<br/>");		

		}	
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	public int getPostalNumber() {
		return postalNumber;
	}
	public void setPostalNumber(String postalNumber) {
		try {
			int postal = Integer.parseInt(postalNumber);
			if(postalNumber.length() != 5) { //if zip code is not 5 digits
				error.append("Invalid postal number. Please only enter 5 digits for the postal number." + "<br/>");		
			}
			else {
				this.postalNumber = postal;
			}
		}
		catch(Exception e) {
			error.append("Invalid postal number. Please only enter numbers for the postal number." + "<br/>");		

		}		
	}
	
	public String getTown() {
		return town;
	}
	public void setTown(String town) {
		this.town = town;
	}
	
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}

}
