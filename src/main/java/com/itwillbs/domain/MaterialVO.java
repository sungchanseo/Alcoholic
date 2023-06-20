package com.itwillbs.domain;
import java.util.Date;



public class MaterialVO {

	// 멤버변수
	private String ma_id;
	private String ma_name;
	private int ma_qty;
	private int unit_cost;
	private String whs_num;
	private String shelt_position;
	private String ma_image;
	private Date ma_regdate;
	private int ma_emp;
	private String ma_qtys;

	// getset 메서드
	public String getMa_id() {
		return ma_id;
	}
	public void setMa_id(String ma_id) {
		this.ma_id = ma_id;
	}
	public String getMa_name() {
		return ma_name;
	}
	public void setMa_name(String ma_name) {
		this.ma_name = ma_name;
	}
	public int getMa_qty() {
		return ma_qty;
	}
	public void setMa_qty(int ma_qty) {
		this.ma_qty = ma_qty;
	}
	public int getUnit_cost() {
		return unit_cost;
	}
	public void setUnit_cost(int unit_cost) {
		this.unit_cost = unit_cost;
	}
	public String getWhs_num() {
		return whs_num;
	}
	public void setWhs_num(String whs_num) {
		this.whs_num = whs_num;
	}
	public String getShelt_position() {
		return shelt_position;
	}
	public void setShelt_position(String shelt_position) {
		this.shelt_position = shelt_position;
	}
	public String getMa_image() {
		return ma_image;
	}
	public void setMa_image(String ma_image) {
		this.ma_image = ma_image;
	}
	public Date getMa_regdate() {
		return ma_regdate;
	}
	public void setMa_regdate(Date ma_regdate) {
		this.ma_regdate = ma_regdate;
	}
	public int getMa_emp() {
		return ma_emp;
	}
	public void setMa_emp(int ma_emp) {
		this.ma_emp = ma_emp;
	}
	public String getMa_qtys() {
		return ma_qtys;
	}
	public void setMa_qtys(String ma_qtys) {
		this.ma_qtys = ma_qtys;
	}

	// toString 메서드
	@Override
	public String toString() {
		return "MaterialVO [ma_id=" + ma_id + ", ma_name=" + ma_name + ", ma_qty=" + ma_qty + ", unit_cost=" + unit_cost
				+ ", whs_num=" + whs_num + ", shelt_position=" + shelt_position + ", ma_image=" + ma_image
				+ ", ma_regdate=" + ma_regdate + ", ma_emp=" + ma_emp + ", ma_qtys=" + ma_qtys + "]";
	}
	
	
	
	
	
	
	
}
