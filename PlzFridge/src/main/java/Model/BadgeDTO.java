package Model;

public class BadgeDTO {


   // 배지 정보
   private int badgeIdx; // 배지 식별자
   private String badgeName; // 배지 이름
   private String badgeInfo; // 배지 설명
   private String badgeImg; // 배지 이미지

   public BadgeDTO() {
   }


   public BadgeDTO(int badgeIdx, String badgeName, String badgeInfo, String badgeImg) {
      this.badgeIdx = badgeIdx;
      this.badgeName = badgeName;
      this.badgeInfo = badgeInfo;
      this.badgeImg = badgeImg;
   }

   public BadgeDTO(int badgeIdx, String badgeName, String badgeImg) {
      this.badgeIdx = badgeIdx;
      this.badgeName = badgeName;
      this.badgeImg = badgeImg;
   }

   public BadgeDTO(String badgeName, String badgeImg) {
      this.badgeName = badgeName;
      this.badgeImg = badgeImg;
   }

   public int getBadgeIdx() {
      return badgeIdx;
   }

   public void setBadgeIdx(int badgeIdx) {
      this.badgeIdx = badgeIdx;
   }

   public String getBadgeName() {
      return badgeName;
   }

   public void setBadgeName(String badgeName) {
      this.badgeName = badgeName;
   }

   public String getBadgeInfo() {
      return badgeInfo;
   }

   public void setBadgeInfo(String badgeInfo) {
      this.badgeInfo = badgeInfo;
   }

   public String getBadgeImg() {
      return badgeImg;
   }

   public void setBadgeImg(String badgeImg) {
      this.badgeImg = badgeImg;
   }

}
