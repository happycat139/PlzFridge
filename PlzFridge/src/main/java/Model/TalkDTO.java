package Model;

public class TalkDTO {

	

	private String tk_idx;
	private String tk_title;
	private String tk_content;

	public TalkDTO() {
	}

	public String getTk_idx() {
		return tk_idx;
	}
	
	public void setTk_idx(String tk_idx) {
		this.tk_idx = tk_idx;
	}
	
	public TalkDTO(String tk_idx, String tk_title, String tk_content) {
		this.tk_idx = tk_idx;
		this.tk_title = tk_title;
		this.tk_content = tk_content;
	}
	public TalkDTO(String tk_title, String tk_content) {
		this.tk_title = tk_title;
		this.tk_content = tk_content;
	}

	public String getTk_title() {
		return tk_title;
	}

	public void setTk_title(String tk_title) {
		this.tk_title = tk_title;
	}

	public String getTk_content() {
		return tk_content;
	}

	public void setTk_content(String tk_content) {
		this.tk_content = tk_content;
	}

}
