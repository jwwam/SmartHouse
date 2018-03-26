package houses.Base;

import java.util.Date;

public class Personnel {
	
	private int personnelID;//人事ID
	private String personnel_name;//姓名
	private int personnel_age;//年龄
	private String personnel_sex;//性别
	private String personnel_idcard;//身份证号
	private String personnel_jiguan;//籍贯
	private String personnel_phone;//电话
	private String personnel_addr;//家庭住址
	private String personnel_xueli;//学历
	private String personnel_gongling;//工龄
	private String personnel_oldwork;//以前从事工作
	private Date personnel_daozhidate;//到职日期
	private Date personnel_lizhidate;//离职日期
	private String personnel_worktype;//工作类型
	private String personnel_daozhimemo;//到职备注
	private String personnel_lizhimemo;//离职备注
	private String personnel_status;//是否在职
	
	private Date personnel_update;//更新日期
	public Date getPersonnel_update() {
		return personnel_update;
	}
	public void setPersonnel_update(Date personnelUpdate) {
		personnel_update = personnelUpdate;
	}
	public String getPersonnel_status() {
		return personnel_status;
	}
	public void setPersonnel_status(String personnelStatus) {
		personnel_status = personnelStatus;
	}
	public int getPersonnelID() {
		return personnelID;
	}
	public void setPersonnelID(int personnelID) {
		this.personnelID = personnelID;
	}
	public String getPersonnel_name() {
		return personnel_name;
	}
	public void setPersonnel_name(String personnelName) {
		personnel_name = personnelName;
	}
	public int getPersonnel_age() {
		return personnel_age;
	}
	public void setPersonnel_age(int personnelAge) {
		personnel_age = personnelAge;
	}
	public String getPersonnel_sex() {
		return personnel_sex;
	}
	public void setPersonnel_sex(String personnelSex) {
		personnel_sex = personnelSex;
	}
	public String getPersonnel_idcard() {
		return personnel_idcard;
	}
	public void setPersonnel_idcard(String personnelIdcard) {
		personnel_idcard = personnelIdcard;
	}
	public String getPersonnel_jiguan() {
		return personnel_jiguan;
	}
	public void setPersonnel_jiguan(String personnelJiguan) {
		personnel_jiguan = personnelJiguan;
	}
	public String getPersonnel_phone() {
		return personnel_phone;
	}
	public void setPersonnel_phone(String personnelPhone) {
		personnel_phone = personnelPhone;
	}
	public String getPersonnel_addr() {
		return personnel_addr;
	}
	public void setPersonnel_addr(String personnelAddr) {
		personnel_addr = personnelAddr;
	}
	public String getPersonnel_xueli() {
		return personnel_xueli;
	}
	public void setPersonnel_xueli(String personnelXueli) {
		personnel_xueli = personnelXueli;
	}
	public String getPersonnel_gongling() {
		return personnel_gongling;
	}
	public void setPersonnel_gongling(String personnelGongling) {
		personnel_gongling = personnelGongling;
	}
	public String getPersonnel_oldwork() {
		return personnel_oldwork;
	}
	public void setPersonnel_oldwork(String personnelOldwork) {
		personnel_oldwork = personnelOldwork;
	}
	public Date getPersonnel_daozhidate() {
		return personnel_daozhidate;
	}
	public void setPersonnel_daozhidate(Date personnelDaozhidate) {
		personnel_daozhidate = personnelDaozhidate;
	}
	public Date getPersonnel_lizhidate() {
		return personnel_lizhidate;
	}
	public void setPersonnel_lizhidate(Date personnelLizhidate) {
		personnel_lizhidate = personnelLizhidate;
	}
	public String getPersonnel_worktype() {
		return personnel_worktype;
	}
	public void setPersonnel_worktype(String personnelWorktype) {
		personnel_worktype = personnelWorktype;
	}
	public String getPersonnel_daozhimemo() {
		return personnel_daozhimemo;
	}
	public void setPersonnel_daozhimemo(String personnelDaozhimemo) {
		personnel_daozhimemo = personnelDaozhimemo;
	}
	public String getPersonnel_lizhimemo() {
		return personnel_lizhimemo;
	}
	public void setPersonnel_lizhimemo(String personnelLizhimemo) {
		personnel_lizhimemo = personnelLizhimemo;
	}
	

}
