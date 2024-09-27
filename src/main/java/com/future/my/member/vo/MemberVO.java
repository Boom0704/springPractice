package com.future.my.member.vo;

public class MemberVO {
    private String memId;     // 아이디
    private String memPw;     // 비밀번호
    private String memNm;     // 이름
    private String memAddr;   // 주소 (추가로 받을 경우를 대비)
    private String profileImg; // 프로필 이미지 (추가로 받을 경우를 대비)

    @Override
    public String toString() {
        return "MemberVO [memId=" + memId + ", memPw=" + memPw + ", memNm=" + memNm + ", memAddr=" + memAddr
                + ", profileImg=" + profileImg + "]";
    }

    // Getter, Setter
    public String getMemId() {
        return memId;
    }

    public void setMemId(String memId) {
        this.memId = memId;
    }

    public String getMemPw() {
        return memPw;
    }

    public void setMemPw(String memPw) {
        this.memPw = memPw;
    }

    public String getMemNm() {
        return memNm;
    }

    public void setMemNm(String memNm) {
        this.memNm = memNm;
    }

    public String getMemAddr() {
        return memAddr;
    }

    public void setMemAddr(String memAddr) {
        this.memAddr = memAddr;
    }

    public String getProfileImg() {
        return profileImg;
    }

    public void setProfileImg(String profileImg) {
        this.profileImg = profileImg;
    }
}
