package com.wzh.secondshop.models;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 用户表
 * 
 * @author WEN
 *
 */
public class User {
	private int id;
	private String name;
	private String mobile;
	private String email;
	private String password;
	private String password2;
	private String code;
	private String photoUrl;
	private int roleId;
	private int statusId;
	private String gender;
	private String registerDate;
	private Date endDate;
	private String pwdRireki1;
	private String pwdRireki2;
	private String pwdRireki3;
	private String pwdRireki4;
	private Date updateDate;
	
	public int getStatusId() {
		return statusId;
	}

	public void setStatusId(int statusId) {
		this.statusId = statusId;
	}

	public String getPassword2() {
		return password2;
	}

	public void setPassword2(String password2) {
		this.password2 = password2;
	}

	public String getPhotoUrl() {
		return photoUrl;
	}

	public void setPhotoUrl(String photoUrl) {
		this.photoUrl = photoUrl;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(java.sql.Timestamp registerDate) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		this.registerDate = sdf.format(registerDate);
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public void setRegisterDate(String registerDate) {
		this.registerDate = registerDate;
	}

	public String getPwdRireki1() {
		return pwdRireki1;
	}

	public void setPwdRireki1(String pwdRireki1) {
		this.pwdRireki1 = pwdRireki1;
	}

	public String getPwdRireki2() {
		return pwdRireki2;
	}

	public void setPwdRireki2(String pwdRireki2) {
		this.pwdRireki2 = pwdRireki2;
	}

	public String getPwdRireki3() {
		return pwdRireki3;
	}

	public void setPwdRireki3(String pwdRireki3) {
		this.pwdRireki3 = pwdRireki3;
	}

	public String getPwdRireki4() {
		return pwdRireki4;
	}

	public void setPwdRireki4(String pwdRireki4) {
		this.pwdRireki4 = pwdRireki4;
	}
}
