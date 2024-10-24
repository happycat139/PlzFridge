package Model;

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

public class EmojiDTO {

	private int emoji_id; // 반응 식별자
	private int b_idx; // 게시글 식별자
	private String user_id; // 사용자 ID
	private String emoji_type; // 반응 유형 ('like' 또는 'fun')
	private int like_count;
	private int fun_count;

	public EmojiDTO(int b_idx, String user_id, String emoji_type) {
		this.b_idx = b_idx;
		this.user_id = user_id;
		this.emoji_type = emoji_type;
	}

	public EmojiDTO(int b_idx, String emoji_type) {
		this.b_idx = b_idx;
		this.emoji_type = emoji_type;
	}

}
