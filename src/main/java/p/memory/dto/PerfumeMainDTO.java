package p.memory.dto;

public class PerfumeMainDTO {
	private int per_seq;
	private String writer;
	private String per_brand;
	private String per_name;
	private int per_price;
	private String sysName;
	private int heart_flag;
	public PerfumeMainDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PerfumeMainDTO(int per_seq, String writer, String per_brand, String per_name, int per_price, String sysName,
			int heart_flag) {
		super();
		this.per_seq = per_seq;
		this.writer = writer;
		this.per_brand = per_brand;
		this.per_name = per_name;
		this.per_price = per_price;
		this.sysName = sysName;
		this.heart_flag = heart_flag;
	}
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
	public String getPer_brand() {
		return per_brand;
	}
	public void setPer_brand(String per_brand) {
		this.per_brand = per_brand;
	}
	public String getPer_name() {
		return per_name;
	}
	public void setPer_name(String per_name) {
		this.per_name = per_name;
	}
	public int getPer_price() {
		return per_price;
	}
	public void setPer_price(int per_price) {
		this.per_price = per_price;
	}
	public String getSysName() {
		return sysName;
	}
	public void setSysName(String sysName) {
		this.sysName = sysName;
	}
	public int getHeart_flag() {
		return heart_flag;
	}
	public void setHeart_flag(int heart_flag) {
		this.heart_flag = heart_flag;
	}
}
