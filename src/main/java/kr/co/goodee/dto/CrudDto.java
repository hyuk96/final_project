package kr.co.goodee.dto;

import java.sql.Date;

public class CrudDto {
	
    private int HRIdx;
    private int MIdx;
    private int HIdx;
    private int SIdx;
    private Date HRDate;
    private String HRContent;
	private String HRNickname;
	
    public int getHRIdx() {
		return HRIdx;
	}
	public void setHRIdx(int hRIdx) {
		HRIdx = hRIdx;
	}
	public int getMIdx() {
		return MIdx;
	}
	public void setMIdx(int mIdx) {
		MIdx = mIdx;
	}
	public int getHIdx() {
		return HIdx;
	}
	public void setHIdx(int hIdx) {
		HIdx = hIdx;
	}
	public int getSIdx() {
		return SIdx;
	}
	public void setSIdx(int sIdx) {
		SIdx = sIdx;
	}
	public Date getHRDate() {
		return HRDate;
	}
	public void setHRDate(Date hRDate) {
		HRDate = hRDate;
	}
	public String getHRContent() {
		return HRContent;
	}
	public void setHRContent(String hRContent) {
		HRContent = hRContent;
	}
	public String getHRNickname() {
		return HRNickname;
	}
	public void setHRNickname(String hRNickname) {
		HRNickname = hRNickname;
	}

}
