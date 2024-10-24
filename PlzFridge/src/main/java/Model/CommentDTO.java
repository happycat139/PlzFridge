package Model;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter




public class CommentDTO {

	private int cmt_idx;
	private int b_idx;
	private String cmt_content;	
	private String created_at;
	private String user_id;
	
	
	public CommentDTO(int b_idx, String cmt_content, String user_id) {
		this.b_idx = b_idx;
		this.cmt_content = cmt_content;
		this.user_id = user_id;
	}
}




