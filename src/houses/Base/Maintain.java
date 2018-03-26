package houses.Base;

import java.util.Date;

public class Maintain {
	private int maintainID;
	private String maintain_thing;
	private String maintain_status;
	private String maintain_homesnumber;
	private Date maintain_sdate;
	private Date maintain_rdate;
	private int maintain_tcost;
	private int maintain_scost;
	private String maintainer;
	private String maintain_smemo;
	private String maintain_rmemo;
	public int getMaintainID() {
		return maintainID;
	}
	public void setMaintainID(int maintainID) {
		this.maintainID = maintainID;
	}
	public String getMaintain_thing() {
		return maintain_thing;
	}
	public void setMaintain_thing(String maintainThing) {
		maintain_thing = maintainThing;
	}
	public String getMaintain_status() {
		return maintain_status;
	}
	public void setMaintain_status(String maintainStatus) {
		maintain_status = maintainStatus;
	}

	public String getMaintain_homesnumber() {
		return maintain_homesnumber;
	}
	public void setMaintain_homesnumber(String maintainHomesnumber) {
		maintain_homesnumber = maintainHomesnumber;
	}
	public Date getMaintain_sdate() {
		return maintain_sdate;
	}
	public void setMaintain_sdate(Date maintainSdate) {
		maintain_sdate = maintainSdate;
	}
	public Date getMaintain_rdate() {
		return maintain_rdate;
	}
	public void setMaintain_rdate(Date maintainRdate) {
		maintain_rdate = maintainRdate;
	}
	public int getMaintain_tcost() {
		return maintain_tcost;
	}
	public void setMaintain_tcost(int maintainTcost) {
		maintain_tcost = maintainTcost;
	}
	public int getMaintain_scost() {
		return maintain_scost;
	}
	public void setMaintain_scost(int maintainScost) {
		maintain_scost = maintainScost;
	}
	public String getMaintainer() {
		return maintainer;
	}
	public void setMaintainer(String maintainer) {
		this.maintainer = maintainer;
	}
	public String getMaintain_smemo() {
		return maintain_smemo;
	}
	public void setMaintain_smemo(String maintainSmemo) {
		maintain_smemo = maintainSmemo;
	}
	public String getMaintain_rmemo() {
		return maintain_rmemo;
	}
	public void setMaintain_rmemo(String maintainRmemo) {
		maintain_rmemo = maintainRmemo;
	}
	

}
