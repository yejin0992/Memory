package p.memory.dto;

public class PerfumeHeartDTO {
	private int per_seq;
	private String id;
	private String per_brand;
	private String per_name;
	private int per_price;
	private String sysName;
	private int heartFlag;
	public PerfumeHeartDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PerfumeHeartDTO(int per_seq, String id, String per_brand, String per_name, int per_price, String sysName,
			int heartFlag) {
		super();
		this.per_seq = per_seq;
		this.id = id;
		this.per_brand = per_brand;
		this.per_name = per_name;
		this.per_price = per_price;
		this.sysName = sysName;
		this.heartFlag = heartFlag;
	}
	public int getPer_seq() {
		return per_seq;
	}
	public void setPer_seq(int per_seq) {
		this.per_seq = per_seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public int getHeartFlag() {
		return heartFlag;
	}
	public void setHeartFlag(int heartFlag) {
		this.heartFlag = heartFlag;
	}
	
	
	
}
