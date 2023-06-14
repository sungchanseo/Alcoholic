package com.itwillbs.domain;

import java.sql.Timestamp;

public class ProductionVO {
	
	// production
	private String production_id;
	private String cont_id;
	private int production_emp;
	private Timestamp production_date;
	private String op_id;
	private String production_line;
	private int plan_qty;
	private int production_qty;
	private String production_state;
//	private String product_id;
	
	// product
	private String product_id;
	private String product_name;
	private int product_emp;
	private Timestamp product_date;
//	private int def_qty;
//	private String def_code;
	
	// qc
	private String qc_num;
	private int qc_emp;
	private Timestamp qc_date;
	private int qc_qty;
	
	// defective
	private String def_code;
	private int def_qty;
	
	// empty_bottle
	private String bt_id;
	private int bt_qty;
	private int bt_status;
	
	
	// getter / setter
	public String getProduction_id() {
		return production_id;
	}
	public String getCont_id() {
		return cont_id;
	}
	public int getProduction_emp() {
		return production_emp;
	}
	public Timestamp getProduction_date() {
		return production_date;
	}
	public String getOp_id() {
		return op_id;
	}
	public String getProduction_line() {
		return production_line;
	}
	public int getPlan_qty() {
		return plan_qty;
	}
	public int getProduction_qty() {
		return production_qty;
	}
	public String getProduction_state() {
		return production_state;
	}
	public String getProduct_id() {
		return product_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public int getProduct_emp() {
		return product_emp;
	}
	public Timestamp getProduct_date() {
		return product_date;
	}
	public String getQc_num() {
		return qc_num;
	}
	public int getQc_emp() {
		return qc_emp;
	}
	public Timestamp getQc_date() {
		return qc_date;
	}
	public int getQc_qty() {
		return qc_qty;
	}
	public String getDef_code() {
		return def_code;
	}
	public int getDef_qty() {
		return def_qty;
	}
	public String getBt_id() {
		return bt_id;
	}
	public int getBt_qty() {
		return bt_qty;
	}
	public int isBt_status() {
		return bt_status;
	}
	public void setProduction_id(String production_id) {
		this.production_id = production_id;
	}
	public void setCont_id(String cont_id) {
		this.cont_id = cont_id;
	}
	public void setProduction_emp(int production_emp) {
		this.production_emp = production_emp;
	}
	public void setProduction_date(Timestamp production_date) {
		this.production_date = production_date;
	}
	public void setOp_id(String op_id) {
		this.op_id = op_id;
	}
	public void setProduction_line(String production_line) {
		this.production_line = production_line;
	}
	public void setPlan_qty(int plan_qty) {
		this.plan_qty = plan_qty;
	}
	public void setProduction_qty(int production_qty) {
		this.production_qty = production_qty;
	}
	public void setProduction_state(String production_state) {
		this.production_state = production_state;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public void setProduct_emp(int product_emp) {
		this.product_emp = product_emp;
	}
	public void setProduct_date(Timestamp product_date) {
		this.product_date = product_date;
	}
	public void setQc_num(String qc_num) {
		this.qc_num = qc_num;
	}
	public void setQc_emp(int qc_emp) {
		this.qc_emp = qc_emp;
	}
	public void setQc_date(Timestamp qc_date) {
		this.qc_date = qc_date;
	}
	public void setQc_qty(int qc_qty) {
		this.qc_qty = qc_qty;
	}
	public void setDef_code(String def_code) {
		this.def_code = def_code;
	}
	public void setDef_qty(int def_qty) {
		this.def_qty = def_qty;
	}
	public void setBt_id(String bt_id) {
		this.bt_id = bt_id;
	}
	public void setBt_qty(int bt_qty) {
		this.bt_qty = bt_qty;
	}
	public void setBt_status(int bt_status) {
		this.bt_status = bt_status;
	}
	
	// toString()
	@Override
	public String toString() {
		return "ProductionVO [production_id=" + production_id + ", cont_id=" + cont_id + ", production_emp="
				+ production_emp + ", production_date=" + production_date + ", op_id=" + op_id + ", production_line="
				+ production_line + ", plan_qty=" + plan_qty + ", production_qty=" + production_qty
				+ ", production_state=" + production_state + ", product_id=" + product_id + ", product_name="
				+ product_name + ", product_emp=" + product_emp + ", product_date=" + product_date + ", qc_num="
				+ qc_num + ", qc_emp=" + qc_emp + ", qc_date=" + qc_date + ", qc_qty=" + qc_qty + ", def_code="
				+ def_code + ", def_qty=" + def_qty + ", bt_id=" + bt_id + ", bt_qty=" + bt_qty + ", bt_status="
				+ bt_status + "]";
	}
	
	
	
}