package com.itwillbs.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.domain.LoginVO;
import com.itwillbs.service.LoginService;

@Controller
@RequestMapping(value = "/main/*")
public class LoginController {
	@Inject
	private LoginService service;
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	//로그인
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGET() throws Exception{
		logger.info("C: 로그인 입력페이지 GET");
		return "/main/loginForm";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPOST(LoginVO vo, HttpSession session, Model model, RedirectAttributes rttr) throws Exception{
		logger.info("C: 로그인 처리페이지 POST");
//		logger.info("C: vo" + vo );
//		logger.info("C: 로그인 처리"+ vo.getEmp_id() +", "+ vo.getEmp_pw());

		LoginVO returnVO = service.loginMember(vo);
//		logger.info("C: 리턴VO : "+returnVO);
		
		if(returnVO != null) {
			session.setAttribute("emp_id", returnVO.getEmp_id());
			session.setAttribute("emp_name", returnVO.getEmp_name());
			session.setAttribute("emp_department", returnVO.getEmp_department());
			session.setAttribute("emp_image", returnVO.getEmp_image());
			rttr.addFlashAttribute("mvo", returnVO);

			logger.info("로그인 성공!");
			 return "redirect:/main";
		}else {
			 // 정보가 없는 경우
		    logger.info("로그인 실패!");
		    model.addAttribute("loginFailed", true);
		    return "main/loginError";
		}
	}
	
	//로그아웃
	@RequestMapping(value = "/logout",method = RequestMethod.GET)
	public String logoutGET(HttpSession session) {
		logger.debug("logoutGET() 호출!");
		
		// 세션정보 초기화
		session.invalidate();
		
		return "redirect:/main/login";
	}

}
