package p.memory.dto;

import java.sql.Timestamp;

public class QnABoardDTO {

	private int qa_seq;
	private String qa_writer;
	private String qa_title;
	private String qa_contents;
	private String qa_view_count;
	private Timestamp qa_write_date;
	
	public QnABoardDTO() {
		super();
	}
	public QnABoardDTO(int qa_seq, String qa_writer, String qa_title, String qa_contents, String qa_view_count,
			Timestamp qa_write_date) {
		super();
		this.qa_seq = qa_seq;
		this.qa_writer = qa_writer;
		this.qa_title = qa_title;
		this.qa_contents = qa_contents;
		this.qa_view_count = qa_view_count;
		this.qa_write_date = qa_write_date;
	}
	public int getQa_seq() {
		return qa_seq;
	}
	public void setQa_seq(int qa_seq) {
		this.qa_seq = qa_seq;
	}
	public String getQa_writer() {
		return qa_writer;
	}
	public void setQa_writer(String qa_writer) {
		this.qa_writer = qa_writer;
	}
	public String getQa_title() {
		return qa_title;
	}
	public void setQa_title(String qa_title) {
		this.qa_title = qa_title;
	}
	public String getQa_contents() {
		return qa_contents;
	}
	public void setQa_contents(String qa_contents) {
		this.qa_contents = qa_contents;
	}
	public String getQa_view_count() {
		return qa_view_count;
	}
	public void setQa_view_count(String qa_view_count) {
		this.qa_view_count = qa_view_count;
	}
	public Timestamp getQa_write_date() {
		return qa_write_date;
	}
	public void setQa_write_date(Timestamp qa_write_date) {
		this.qa_write_date = qa_write_date;
	}

	
	
}
