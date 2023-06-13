package p.memory.dto;

import java.sql.Timestamp;

public class FreeBoardDTO {

	private int fr_seq;
	private String fr_category;
	private String fr_title;
	private String fr_writer;
	private String fr_contents;
	private int fr_view_count;
	private Timestamp fr_write_date;

	public FreeBoardDTO() {
		super();
	}

	public FreeBoardDTO(int fr_seq, String fr_category, String fr_title, String fr_writer, String fr_contents,
			int fr_view_count, Timestamp fr_write_date) {
		super();
		this.fr_seq = fr_seq;
		this.fr_category = fr_category;
		this.fr_title = fr_title;
		this.fr_writer = fr_writer;
		this.fr_contents = fr_contents;
		this.fr_view_count = fr_view_count;
		this.fr_write_date = fr_write_date;
	}

	public int getFr_seq() {
		return fr_seq;
	}

	public void setFr_seq(int fr_seq) {
		this.fr_seq = fr_seq;
	}

	public String getFr_category() {
		return fr_category;
	}

	public void setFr_category(String fr_category) {
		this.fr_category = fr_category;
	}

	public String getFr_title() {
		return fr_title;
	}

	public void setFr_title(String fr_title) {
		this.fr_title = fr_title;
	}

	public String getFr_writer() {
		return fr_writer;
	}

	public void setFr_writer(String fr_writer) {
		this.fr_writer = fr_writer;
	}

	public String getFr_contents() {
		return fr_contents;
	}

	public void setFr_contents(String fr_contents) {
		this.fr_contents = fr_contents;
	}

	public int getFr_view_count() {
		return fr_view_count;
	}

	public void setFr_view_count(int fr_view_count) {
		this.fr_view_count = fr_view_count;
	}

	public Timestamp getFr_write_date() {
		return fr_write_date;
	}

	public void setFr_write_date(Timestamp fr_write_date) {
		this.fr_write_date = fr_write_date;
	}

	

}
