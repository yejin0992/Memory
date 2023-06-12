package p.memory.dto;

import java.sql.Timestamp;

public class PerfumeDTO {
	private int per_seq;
	private String writer;
	private String per_name;
	private String per_brand;
	private int per_volume;
	private String per_kind;
	private int per_price;
	private String per_gender;
	private String top1;
	private String top2;
	private String top3;
	private String middle1;
	private String middle2;
	private String middle3;
	private String base1;
	private String base2;
	private String base3;
	private Timestamp write_date;
	public int getPer_seq() {
		return per_seq;
	}
	public void setPer_seq(int per_seq) {
		this.per_seq = per_seq;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getPer_name() {
		return per_name;
	}
	public void setPer_name(String per_name) {
		this.per_name = per_name;
	}
	public String getPer_brand() {
		return per_brand;
	}
	public void setPer_brand(String per_brand) {
		this.per_brand = per_brand;
	}
	public int getPer_volume() {
		return per_volume;
	}
	public void setPer_volume(int per_volume) {
		this.per_volume = per_volume;
	}
	public String getPer_kind() {
		return per_kind;
	}
	public void setPer_kind(String per_kind) {
		this.per_kind = per_kind;
	}
	public int getPer_price() {
		return per_price;
	}
	public void setPer_price(int per_price) {
		this.per_price = per_price;
	}
	public String getPer_gender() {
		return per_gender;
	}
	public void setPer_gender(String per_gender) {
		this.per_gender = per_gender;
	}
	public String getTop1() {
		return top1;
	}
	public void setTop1(String top1) {
		this.top1 = top1;
	}
	public String getTop2() {
		return top2;
	}
	public void setTop2(String top2) {
		this.top2 = top2;
	}
	public String getTop3() {
		return top3;
	}
	public void setTop3(String top3) {
		this.top3 = top3;
	}
	public String getMiddle1() {
		return middle1;
	}
	public void setMiddle1(String middle1) {
		this.middle1 = middle1;
	}
	public String getMiddle2() {
		return middle2;
	}
	public void setMiddle2(String middle2) {
		this.middle2 = middle2;
	}
	public String getMiddle3() {
		return middle3;
	}
	public void setMiddle3(String middle3) {
		this.middle3 = middle3;
	}
	public String getBase1() {
		return base1;
	}
	public void setBase1(String base1) {
		this.base1 = base1;
	}
	public String getBase2() {
		return base2;
	}
	public void setBase2(String base2) {
		this.base2 = base2;
	}
	public String getBase3() {
		return base3;
	}
	public void setBase3(String base3) {
		this.base3 = base3;
	}
	public Timestamp getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Timestamp write_date) {
		this.write_date = write_date;
	}
	public PerfumeDTO(int per_seq, String writer, String per_name, String per_brand, int per_volume, String per_kind,
			int per_price, String per_gender, String top1, String top2, String top3, String middle1, String middle2,
			String middle3, String base1, String base2, String base3, Timestamp write_date) {
		super();
		this.per_seq = per_seq;
		this.writer = writer;
		this.per_name = per_name;
		this.per_brand = per_brand;
		this.per_volume = per_volume;
		this.per_kind = per_kind;
		this.per_price = per_price;
		this.per_gender = per_gender;
		this.top1 = top1;
		this.top2 = top2;
		this.top3 = top3;
		this.middle1 = middle1;
		this.middle2 = middle2;
		this.middle3 = middle3;
		this.base1 = base1;
		this.base2 = base2;
		this.base3 = base3;
		this.write_date = write_date;
	}
	public PerfumeDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
