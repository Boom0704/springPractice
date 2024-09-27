package com.future.my.member.web;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.future.my.member.service.MemberService;
import com.future.my.member.vo.MemberVO;

@Controller
public class MemberController {

    @Autowired
    private MemberService memberService;

    @RequestMapping("/registView")
    public String registView() {
        return "member/registView";
    }

    @RequestMapping("/registDo")
    public String registDo(MemberVO vo) {
        System.out.println("regist");
        System.out.println(vo);
        try {
            memberService.registMember(vo);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/";
    }

    @RequestMapping("/loginView")
    public String loginView() {
        return "member/loginView";
    }

    @RequestMapping("/loginDo")
    public String loginDo(MemberVO vo, HttpSession session, HttpServletResponse response, 
                          @RequestParam(value = "remember", required = false) String remember) throws Exception {
        System.out.println("login");
        System.out.println(vo);
        MemberVO login = memberService.loginMember(vo);

        if (login != null) {
            // 로그인 성공 시 세션에 로그인 정보 저장
            session.setAttribute("login", login);

            // remember 체크박스가 체크된 경우 쿠키 생성
            if (remember != null && remember.equals("on")) {
                Cookie rememberId = new Cookie("rememberId", vo.getMemId());
                Cookie rememberPw = new Cookie("rememberPw", vo.getMemPw());

                // 쿠키 유효기간 설정 (7일 동안 유지)
                rememberId.setMaxAge(7 * 24 * 60 * 60);  // 7일
                rememberPw.setMaxAge(7 * 24 * 60 * 60);  // 7일

                // 쿠키 경로 설정
                rememberId.setPath("/");
                rememberPw.setPath("/");

                // 쿠키 추가
                response.addCookie(rememberId);
                response.addCookie(rememberPw);
            } else {
                // remember 체크박스가 체크되지 않은 경우 기존 쿠키 삭제
                Cookie rememberId = new Cookie("rememberId", null);
                Cookie rememberPw = new Cookie("rememberPw", null);

                // 쿠키 유효기간 0으로 설정하여 삭제
                rememberId.setMaxAge(0);
                rememberPw.setMaxAge(0);

                // 쿠키 경로 설정
                rememberId.setPath("/");
                rememberPw.setPath("/");

                // 쿠키 추가 (삭제용)
                response.addCookie(rememberId);
                response.addCookie(rememberPw);
            }

            return "redirect:/";  // 로그인 후 메인 페이지로 리다이렉트
        } else {
            // 로그인 실패 시 로그인 페이지로 리다이렉트
            return "redirect:/loginView?error=true";
        }
    }

    // 로그아웃 처리
    @RequestMapping("/logout")
    public String logout(HttpSession session, HttpServletResponse response) {
        // 세션 무효화 (로그아웃 처리)
        session.invalidate();
        return "redirect:/";  // 로그아웃 후 메인 페이지로 리다이렉트
    }
}
