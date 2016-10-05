package kr.ac.readingbetter.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.readingbetter.service.AdminAccusationService;
import kr.ac.readingbetter.vo.AccusationVo;

@Controller
@RequestMapping("/admin")
public class AdminAccusationController {
	
	@Autowired
	private AdminAccusationService adminAccusationService;

	// 신고 관리
	@RequestMapping("/accusationlist")
	public String accusationList(Model model) {
		List<AccusationVo> list = adminAccusationService.getList();
		model.addAttribute("accusationlist", list);
		return "admin/accusationlist";
	}

	@RequestMapping(value = "/accusationview/{no}", method = RequestMethod.GET)
	public String accusationView(@PathVariable("no") Long no, Model model) {
		AccusationVo vo = adminAccusationService.getAccuView(no);
		
		model.addAttribute("vo", vo);
		
		return "admin/accusationview";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public void modify(@RequestBody AccusationVo vo) {
		adminAccusationService.updateAccept(vo);
	}
}