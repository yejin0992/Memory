package p.memory.dto;

import java.sql.Timestamp;

public class FrReplyDTO {
	
	private int re_seq;
	private String re_writer;
	private String re_contents;
	private Timestamp re_write_date;
	private int fr_seq;
	
	public FrReplyDTO() {
		super(); 
	}

	public FrReplyDTO(int re_seq, String re_writer, String re_contents, Timestamp re_write_date, int fr_seq) {
		super();
		this.re_seq = re_seq;
		this.re_writer = re_writer;
		this.re_contents = re_contents;
		this.re_write_date = re_write_date;
		this.fr_seq = fr_seq;
	}

	public int getRe_seq() {
		return re_seq;
	}

	public void setRe_seq(int re_seq) {
		this.re_seq = re_seq;
	}

	public String getRe_writer() {
		return re_writer;
	}

	public void setRe_writer(String re_writer) {
		this.re_writer = re_writer;
	}

	public String getRe_contents() {
		return re_contents;
	}

	public void setRe_contents(String re_contents) {
		this.re_contents = re_contents;
	}

	public Timestamp getRe_write_date() {
		return re_write_date;
	}

	public void setRe_write_date(Timestamp re_write_date) {
		this.re_write_date = re_write_date;
	}

	public int getFr_seq() {
		return fr_seq;
	}

	public void setFr_seq(int fr_seq) {
		this.fr_seq = fr_seq;
	}
	
	
	
	
	

}
