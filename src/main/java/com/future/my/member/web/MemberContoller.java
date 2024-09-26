package com.future.my.member.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberContoller {
	
	@RequestMapping("/registView")
	public String registView() {
		return "member/registView";
	}
}
