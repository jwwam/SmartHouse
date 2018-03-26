package houses.Base;

public class Custom_account {
	
	private int custom_accountID;
	private String custom_username;
	private String custom_password;
	private int custom_yezhuID;//对应的业主
	
	public int getCustom_yezhuID() {
		return custom_yezhuID;
	}
	public void setCustom_yezhuID(int customYezhuID) {
		custom_yezhuID = customYezhuID;
	}
	public int getCustom_accountID() {
		return custom_accountID;
	}
	public void setCustom_accountID(int customAccountID) {
		custom_accountID = customAccountID;
	}
	public String getCustom_username() {
		return custom_username;
	}
	public void setCustom_username(String customUsrname) {
		custom_username = customUsrname;
	}
	public String getCustom_password() {
		return custom_password;
	}
	public void setCustom_password(String customPassword) {
		custom_password = customPassword;
	}
	
	

}
