package com.example.redis.session;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import jakarta.servlet.http.HttpSession;

@RestController
public class SessionController {

	// http://localhost:8080/set?q=password
	// session은 스프링부트 내장서버인 톰캣에서 만들어줌
	@GetMapping("/set")
	public String set(@RequestParam("q") String q, HttpSession session) {
		session.setAttribute("q", q);
		return "Saved: " + q;
	}

	// http://localhost:8080/get
	@GetMapping("/get")
	public String get(HttpSession session) {
		return String.valueOf(session.getAttribute("q"));
	}

}
