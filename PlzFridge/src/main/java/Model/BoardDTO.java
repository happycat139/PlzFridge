package Model;

import java.util.List;

public class BoardDTO {

	private int b_idx;
	private String user_id; // 게시글 작성자
	private String b_file; // 게시물 사진
	private String b_content; // 게시물 텍스트
	private String created_at; // 등록 날짜
	private int b_likes;
	private int b_funs;
	// 댓글 관련 필드 추가
	private List<CommentDTO> comments;
	private String user_profile_img; // 새로 추가한 필드
	private List<EmojiDTO> emojiCount;

	public BoardDTO() {
	}

	public BoardDTO(String b_file) {
		this.b_file = b_file;
	}

	public BoardDTO(int b_idx, String b_file) {
		this.b_idx = b_idx;
		this.b_file = b_file;
	}

	public BoardDTO(int b_idx, String user_id, String b_file, String b_content, String created_at, int b_likes,
			int b_funs, List<CommentDTO> comments) {
		this.b_idx = b_idx;
		this.user_id = user_id;
		this.b_file = b_file;
		this.b_content = b_content;
		this.created_at = created_at;
		this.b_likes = b_likes;
		this.b_funs = b_funs;
		this.comments = comments;
	}

	public BoardDTO(int b_idx, String user_id, String b_file, String b_content, String created_at,
			List<CommentDTO> comments) {
		this.b_idx = b_idx;
		this.user_id = user_id;
		this.b_file = b_file;
		this.b_content = b_content;
		this.created_at = created_at;
		this.comments = comments;
	}

	public BoardDTO(int b_idx, String user_id, String b_file, String b_content, List<CommentDTO> comments) {
		this.b_idx = b_idx;
		this.user_id = user_id;
		this.b_file = b_file;
		this.b_content = b_content;
		this.comments = comments;
	}

	public BoardDTO(String user_id, String b_file, String b_content) {
		this.user_id = user_id;
		this.b_file = b_file;
		this.b_content = b_content;
	}

	public BoardDTO(int b_idx, String user_id, String b_file, String b_content, List<CommentDTO> comments,
			String user_profile_img) {
		this.b_idx = b_idx;
		this.user_id = user_id;
		this.b_file = b_file;
		this.b_content = b_content;
		this.comments = comments;
		this.user_profile_img = user_profile_img;
	}

	public List<EmojiDTO> getEmojiCount() {
		return emojiCount;
	}

	public void setEmojiCount(List<EmojiDTO> emojiCount) {
		this.emojiCount = emojiCount;
	}

	public int getB_idx() {
		return b_idx;
	}

	public String getUser_id() {
		return user_id;
	}

	public String getB_file() {
		return b_file;
	}

	public String getB_content() {
		return b_content;
	}

	public String getCreated_at() {
		return created_at;
	}

	public void setB_idx(int b_idx) {
		this.b_idx = b_idx;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public void setB_file(String b_file) {
		this.b_file = b_file;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}

	public List<CommentDTO> getComments() {
		return comments;
	}

	public void setComments(List<CommentDTO> comments) {
		this.comments = comments;
	}

	public int getB_likes() {
		return b_likes;
	}

	public void setB_likes(int b_likes) {
		this.b_likes = b_likes;
	}

	public int getB_funs() {
		return b_funs;
	}

	public void setB_funs(int b_funs) {
		this.b_funs = b_funs;
	}

	public String getUser_profile_img() {
		return user_profile_img;
	}

	public void setUser_profile_img(String user_profile_img) {
		this.user_profile_img = user_profile_img;
	}

}
