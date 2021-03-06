package com.scit.doujo.work;


import java.util.ArrayList;
import java.util.List;


import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.scit.doujo.dao.workDao;
import com.scit.doujo.util.Selenium;
import com.scit.doujo.util.work_PageNavi;
import com.scit.doujo.vo.member;
import com.scit.doujo.vo.work.favorites;
import com.scit.doujo.vo.work.memo;


@Controller
public class CrawlingController {
	
	@Autowired
	SqlSession session;
	
	@Component
	public class HelloComponent {

	private ArrayList<String[]> articles;
	private void setValue(ArrayList<String[]> hello){
	    articles = hello;  
	}
	public ArrayList<String[]> getStaticHello(){
	    return articles; // spring.profiles.active is default
	}
	public ArrayList<String[]> page(  int page) {
		int size = (articles.size()+10)/10;
		
		ArrayList<String[]> result=new ArrayList<String[]>();
		if(page==size) {
			for(int a=(page-1)*10; a<articles.size(); a++) {
				result.add(articles.get(a));
			}
		}
		else {
		for(int a=(page-1)*10; a<page*10; a++) {
			result.add(articles.get(a));
		}
		}
		return result;	
	}
	}

	HelloComponent article = new HelloComponent();

	  
	@RequestMapping(value = "/crawling", method = RequestMethod.GET)
	public String crawling( HttpSession hs,Model model,String search, String type) {
		Selenium sel = new Selenium();
		ArrayList<String[]> result = sel.Search(search,type);
		System.out.println(result.size());
		article.setValue(result);
		work_PageNavi pn = new work_PageNavi(10,1,result.size());
		model.addAttribute("navi",pn);
		ArrayList<String[]> ab = article.page(1);
		model.addAttribute("result",ab);
		workDao um= session.getMapper(workDao.class);
		member m = (member)hs.getAttribute("member");
		String userid=m.getId();		
		List<memo> result2 = um.allMemo(userid);
		model.addAttribute("mlist", result2);
		List<favorites> fa = um.allFavorites(userid);
	      model.addAttribute("fcheck",fa);
		return "work/news";
	}
	
	@RequestMapping(value = "/goPaging", method = RequestMethod.GET)
	public String goPage( Model model,int value,HttpSession hs) {
		ArrayList<String[]> result = article.page(value);
		model.addAttribute("result",result);
		workDao um= session.getMapper(workDao.class);
		member m = (member)hs.getAttribute("member");
		String userid=m.getId();		
		List<memo> result2 = um.allMemo(userid);
		model.addAttribute("mlist", result2);
		work_PageNavi pn = new work_PageNavi(10,value,article.getStaticHello().size());
		model.addAttribute("navi",pn);
		List<favorites> fa = um.allFavorites(userid);
	      model.addAttribute("fcheck",fa);
		return "work/news";
	}
	 
}
