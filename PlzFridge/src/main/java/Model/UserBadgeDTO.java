package Model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Getter
@Setter

public class UserBadgeDTO {
	
	 private int badgeIdx; // 배지 식별자
	 private String retainType; // 보유 항목
	 private String userId; // 회원 아이디
	 
	 
	 public UserBadgeDTO(String userId) {
	       this.userId = userId;
	    }
	    
	    public UserBadgeDTO(String userId, int badgeIdx) {
	       this.userId = userId;
	       this.badgeIdx = badgeIdx;
	    }


}
