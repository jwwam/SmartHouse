package houses.Base;

public class Admin {
	
	private int adminID;

	private String admin_name;
	
	private String admin_sex;
	
	private int admin_age;
	
	private String admin_tel;
	
	private String admin_phone;
	
	private String admin_addr;
	
	private String admin_memo;
	
	private Admin_account admin_account;
	
	

	public Admin_account getAdmin_account() {
		return admin_account;
	}

	public void setAdmin_account(Admin_account adminAccount) {
		admin_account = adminAccount;
	}

	public int getAdminID() {
		return adminID;
	}

	public void setAdminID(int adminID) {
		this.adminID = adminID;
	}

	public String getAdmin_name() {
		return admin_name;
	}

	public void setAdmin_name(String adminName) {
		admin_name = adminName;
	}

	public String getAdmin_sex() {
		return admin_sex;
	}

	public void setAdmin_sex(String adminSex) {
		admin_sex = adminSex;
	}

	public int getAdmin_age() {
		return admin_age;
	}

	public void setAdmin_age(int adminAge) {
		admin_age = adminAge;
	}

	public String getAdmin_tel() {
		return admin_tel;
	}

	public void setAdmin_tel(String adminTel) {
		admin_tel = adminTel;
	}

	public String getAdmin_phone() {
		return admin_phone;
	}

	public void setAdmin_phone(String adminPhone) {
		admin_phone = adminPhone;
	}

	public String getAdmin_addr() {
		return admin_addr;
	}

	public void setAdmin_addr(String adminAddr) {
		admin_addr = adminAddr;
	}

	public String getAdmin_memo() {
		return admin_memo;
	}

	public void setAdmin_memo(String adminMemo) {
		admin_memo = adminMemo;
	}
	
	

	
	
	

}
