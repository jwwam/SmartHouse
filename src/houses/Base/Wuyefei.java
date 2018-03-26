package houses.Base;

import java.math.BigDecimal;
import java.util.Date;

import com.sun.org.apache.xerces.internal.impl.dv.xs.DecimalDV;

public class Wuyefei {
	
	private int wuyefeiID;//物业费编号ID
	private String wuyefei_yezhu;//物业费业主
	private String wuyefei_homes_number;//物业费房产门牌号
	private double wuyefei_danjia;//物业费单价
	private String wuyefei_status;//物业费缴纳状态
	private String wuyefei_year;//物业费年份
	private String wuyefei_month;//物业费月份
	private double wuyefei_money;//物业费
	private Date wuyefei_date;//物业费生成日期
	private String wuyefei_uper;//物业费生成者
	private String wuyefei_memo;//物业费生成备注
	public int getWuyefeiID() {
		return wuyefeiID;
	}
	public String getWuyefei_homes_number() {
		return wuyefei_homes_number;
	}
	public void setWuyefei_homes_number(String wuyefeiHomesNumber) {
		wuyefei_homes_number = wuyefeiHomesNumber;
	}
	public void setWuyefeiID(int wuyefeiID) {
		this.wuyefeiID = wuyefeiID;
	}
	
	
	
	public String getWuyefei_yezhu() {
		return wuyefei_yezhu;
	}
	public void setWuyefei_yezhu(String wuyefeiYezhu) {
		wuyefei_yezhu = wuyefeiYezhu;
	}
	public double getWuyefei_danjia() {
		return wuyefei_danjia;
	}
	public void setWuyefei_danjia(double wuyefeiDanjia) {
		wuyefei_danjia = wuyefeiDanjia;
	}
	public String getWuyefei_status() {
		return wuyefei_status;
	}
	public void setWuyefei_status(String wuyefeiStatus) {
		wuyefei_status = wuyefeiStatus;
	}
	public String getWuyefei_year() {
		return wuyefei_year;
	}
	public void setWuyefei_year(String wuyefeiYear) {
		wuyefei_year = wuyefeiYear;
	}
	public String getWuyefei_month() {
		return wuyefei_month;
	}
	public void setWuyefei_month(String wuyefeiMonth) {
		wuyefei_month = wuyefeiMonth;
	}
	
	public double getWuyefei_money() {
		return wuyefei_money;
	}
	public void setWuyefei_money(double wuyefeiMoney) {
		wuyefei_money = wuyefeiMoney;
	}
	public Date getWuyefei_date() {
		return wuyefei_date;
	}
	public void setWuyefei_date(Date wuyefeiDate) {
		wuyefei_date = wuyefeiDate;
	}
	public String getWuyefei_uper() {
		return wuyefei_uper;
	}
	public void setWuyefei_uper(String wuyefeiUper) {
		wuyefei_uper = wuyefeiUper;
	}
	public String getWuyefei_memo() {
		return wuyefei_memo;
	}
	public void setWuyefei_memo(String wuyefeiMemo) {
		wuyefei_memo = wuyefeiMemo;
	}
	
	
}
