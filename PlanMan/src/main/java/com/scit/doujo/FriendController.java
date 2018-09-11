package com.scit.doujo;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.scit.doujo.dao.friendDao;
import com.scit.doujo.dao.memberDao;
import com.scit.doujo.dao.workDao;
import com.scit.doujo.util.PageNavigator;
import com.scit.doujo.util.PageNavigator2;
import com.scit.doujo.util.work_PageNavi;
import com.scit.doujo.vo.board;
import com.scit.doujo.vo.friend;
import com.scit.doujo.vo.member;
import com.scit.doujo.vo.schedule;
import com.scit.doujo.vo.work.memo;
import com.scit.doujo.work.PagingContorller.HelloComponent;


@Controller
public class FriendController {
			
	@Autowired
	SqlSession sqlSession;
	
	@Component
	public class HelloComponent {
		private ArrayList<String[]> articles;
		private void setValue(ArrayList<String[]> hello) {
			articles = hello;
		}
		public ArrayList<String[]> getStaticHello() {
			return articles; // spring.profiles.active is default
		}
		public ArrayList<String[]> page(int page) {
			int size = (articles.size() + 3) / 3;
			ArrayList<String[]> result = new ArrayList<String[]>();
			if (page == size) {
				for (int a = (page - 1) * 3; a < articles.size(); a++) {
					result.add(articles.get(a));
				}
			} else {
				for (int a = (page - 1) * 3; a < page * 3; a++) {
					result.add(articles.get(a));
				}
			}
			return result;
		}
	}
	HelloComponent article = new HelloComponent();
	
	@RequestMapping(value = "/goFriendMain", method = RequestMethod.GET)
	public String goFriendMain(HttpSession hs, Model model) {
		return "friendMain";
	}
	@RequestMapping (value="gotoSearchFriend", method=RequestMethod.GET)
	public String friendMain(HttpSession session) {
		memberDao manager2=sqlSession.getMapper(memberDao.class);
		String id=(String) session.getAttribute("memberID");
		schedule result=new schedule();
		String eventtype="friend";
		result.setEventtype(eventtype);
		result.setId(id);
		SimpleDateFormat formatter=new SimpleDateFormat("YYYY-MM-dd");
		Date date=new Date();
		
		String countday=formatter.format(date);
		Calendar cal = Calendar.getInstance();
		String year=countday.split("-")[0];
		String month=countday.split("-")[1];
		String day=countday.split("-")[2];
		cal.set(Calendar.YEAR, Integer.parseInt(year));
		cal.set(Calendar.MONTH-1, Integer.parseInt(month));
		cal.set(Calendar.DATE, Integer.parseInt(day));		
		int weekday=cal.get(cal.DAY_OF_WEEK);
		
		ArrayList<schedule> schList=new ArrayList<>();
		
		switch(weekday) {
		case 1:
			cal.set(Calendar.YEAR, Integer.parseInt(year));
			String weekSunday =formatter.format(cal.getTime());
			System.out.println(weekSunday);
			cal.add(cal.DATE, -6);
			cal.set(Calendar.YEAR, Integer.parseInt(year));
			String weekMonday=formatter.format(cal.getTime());
			System.out.println(weekMonday);
			result.setWeekMonday(weekMonday);
			result.setWeekSunday(weekSunday);
			schList=manager2.selectEventByType(result);
			break;
		case 2:
			System.out.println(cal.getTime());
			cal.add(cal.DATE, 6);
			cal.set(Calendar.YEAR, Integer.parseInt(year));
			weekSunday =formatter.format(cal.getTime());
			System.out.println(weekSunday);
			cal.add(cal.DATE, -6);
			cal.set(Calendar.YEAR, Integer.parseInt(year));
			weekMonday=formatter.format(cal.getTime());
			System.out.println(weekMonday);
			result.setWeekMonday(weekMonday);
			result.setWeekSunday(weekSunday);
			schList=manager2.selectEventByType(result);
			break;
		case 3:
			System.out.println(cal.getTime());
			cal.add(cal.DATE, 5);
			cal.set(Calendar.YEAR, Integer.parseInt(year));
			weekSunday =formatter.format(cal.getTime());
			System.out.println(weekSunday);
			cal.add(cal.DATE, -6);
			cal.set(Calendar.YEAR, Integer.parseInt(year));
			weekMonday=formatter.format(cal.getTime());
			System.out.println(weekMonday);
			result.setWeekMonday(weekMonday);
			result.setWeekSunday(weekSunday);
			schList=manager2.selectEventByType(result);
			break;
		case 4:
			System.out.println(cal.getTime());
			cal.add(cal.DATE, 4);
			cal.set(Calendar.YEAR, Integer.parseInt(year));
			weekSunday =formatter.format(cal.getTime());
			System.out.println(weekSunday);
			cal.add(cal.DATE, -6);
			cal.set(Calendar.YEAR, Integer.parseInt(year));
			weekMonday=formatter.format(cal.getTime());
			System.out.println(weekMonday);
			result.setWeekMonday(weekMonday);
			result.setWeekSunday(weekSunday);
			schList=manager2.selectEventByType(result);
			break;
		case 5:
			System.out.println(cal.getTime());
			cal.add(cal.DATE, 3);
			cal.set(Calendar.YEAR, Integer.parseInt(year));
			weekSunday =formatter.format(cal.getTime());
			System.out.println(weekSunday);
			cal.add(cal.DATE, -6);
			cal.set(Calendar.YEAR, Integer.parseInt(year));
			weekMonday=formatter.format(cal.getTime());
			System.out.println(weekMonday);
			result.setWeekMonday(weekMonday);
			result.setWeekSunday(weekSunday);
			schList=manager2.selectEventByType(result);
			break;
		case 6:
			System.out.println(cal.getTime());
			cal.add(cal.DATE, 2);
			cal.set(Calendar.YEAR, Integer.parseInt(year));
			weekSunday =formatter.format(cal.getTime());
			System.out.println(weekSunday);
			cal.add(cal.DATE, -6);
			cal.set(Calendar.YEAR, Integer.parseInt(year));
			weekMonday=formatter.format(cal.getTime());
			System.out.println(weekMonday);
			result.setWeekMonday(weekMonday);
			result.setWeekSunday(weekSunday);
			schList=manager2.selectEventByType(result);
			break;
		case 7:
			System.out.println(cal.getTime());
			cal.add(cal.DATE, 1);
			cal.set(Calendar.YEAR, Integer.parseInt(year));
			weekSunday =formatter.format(cal.getTime());
			System.out.println(weekSunday);
			cal.add(cal.DATE, -6);
			cal.set(Calendar.YEAR, Integer.parseInt(year));
			weekMonday=formatter.format(cal.getTime());
			System.out.println(weekMonday);
			result.setWeekMonday(weekMonday);
			result.setWeekSunday(weekSunday);
			schList=manager2.selectEventByType(result);
			break;
		default:
			break;
		}
		
		session.setAttribute("schList", schList);
		return "/friend/friendMain";
	}
	
	/*@RequestMapping (value="gotoSearchFriend", method=RequestMethod.POST)
	public String gotoSearchFriend() {
		
		return "friend/searchnewfriend";
	}*/
	
	@RequestMapping (value="joinfriend", method=RequestMethod.GET)
	public String joinfriend() {
		
		return "friend/joinfriend";
	}
	
	@RequestMapping (value="joinnewfriend", method=RequestMethod.GET)
	public String joinnewfriend() {
		
		return "friend/friendMain";
	}
		
	@RequestMapping (value="finallyjoinin", method=RequestMethod.POST)
	public String joinfriend(member friend, HttpSession session, Model model) {
		friendDao getfriend = sqlSession.getMapper(friendDao.class);
		System.out.println(friend);
		getfriend.updateMember(friend);
		/*getfriend.insertMember(member);*/
		session.setAttribute("member", friend);
		/*String name = (String) session.getAttribute("name");*/
		/*dao.insert(member);*/
		
		return "friend/friendMain";
	}
		
	@RequestMapping(value="/listfriend", method=RequestMethod.GET)
	public String listfriend(
		@RequestParam(value="currentPage", defaultValue="1") int currentPage,
		@RequestParam(value="searchItem", defaultValue="id") String searchItem, 
		@RequestParam(value="searchWord", defaultValue="") String searchWord, 
		Model model, @RequestParam(value="startRecord", defaultValue="1") int startRecord
	)  
	{
		Map<String, String> map = new HashMap<>();
	    System.out.println(searchItem + ", " + searchWord);
	    
	    map.put("searchItem", searchItem);
	    map.put("searchWord", searchWord);
		friendDao getfriend = sqlSession.getMapper(friendDao.class);
		int totalRecordCount = getfriend.getRecommendFriendsCount(map);
		
		int countPerPage = 10;
		int pagePerGroup = 5;
		
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, currentPage, totalRecordCount);
		RowBounds rb = new RowBounds(navi.getStartRecord(), navi.getCountPerPage());
				
		List<member> list = getfriend.getRecommendFriends(map,rb);	
			System.out.println(list.get(0).toString());
		model.addAttribute("list", list);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("searchItem", searchItem);
		model.addAttribute("navi", navi);
		model.addAttribute("currentPage", currentPage);
				
		return "friend/friendMain";

	}
	
	@RequestMapping(value="/listMyfriend", method=RequestMethod.GET)
	public String listoldfriends(
			@RequestParam(value="currentPage2", defaultValue="1") int currentPage2,
			@RequestParam(value="searchItem2", defaultValue="id") String searchItem2, 
			@RequestParam(value="searchWord2", defaultValue="") String searchWord2, 
			Model model, 
			@RequestParam(value="startRecord2", defaultValue="1") int startRecord2
	)  
	{
		Map<String, String> map = new HashMap<>();
	    System.out.println(searchItem2 + ", " + searchWord2);
	    
	    map.put("searchItem2", searchItem2);
	    map.put("searchWord2", searchWord2);
		friendDao getfriend = sqlSession.getMapper(friendDao.class);
		int totalRecordCount2 = getfriend.getMyFriendsCount(map);
		
		int countPerPage2 = 10;
		int pagePerGroup2 = 5;
		
		PageNavigator2 navi = new PageNavigator2(countPerPage2, pagePerGroup2, currentPage2, totalRecordCount2);
		RowBounds rb = new RowBounds(navi.getstartRecord2(), navi.getCountPerPage());
				
		List<friend> newlist = getfriend.getMyFriends(map,rb);	
			System.out.println(newlist.get(0).toString());
		model.addAttribute("newlist", newlist);
		model.addAttribute("searchWord2", searchWord2);
		model.addAttribute("searchItem2", searchItem2);
		model.addAttribute("navi", navi);
		model.addAttribute("currentPage2", currentPage2);
				
		return "friend/friendList";

	}
	
	@RequestMapping(value="/searchMyfriend", method=RequestMethod.GET)
	public String searchMyfriend(
			@RequestParam(value="currentPage2", defaultValue="1") int currentPage2,
			@RequestParam(value="searchItem2", defaultValue="id") String searchItem2, 
			@RequestParam(value="searchWord2", defaultValue="") String searchWord2, 
			Model model, 
			@RequestParam(value="startRecord2", defaultValue="1") int startRecord2
	)  
	{
		Map<String, String> map = new HashMap<>();
	    System.out.println(searchItem2 + ", " + searchWord2);
	    
	    map.put("searchItem2", searchItem2);
	    map.put("searchWord2", searchWord2);
		friendDao getfriend = sqlSession.getMapper(friendDao.class);
		int totalRecordCount2 = getfriend.getRecommendFriendsCount(map);
		
		int countPerPage2 = 10;
		int pagePerGroup2 = 5;
		
		PageNavigator2 navi = new PageNavigator2(countPerPage2, pagePerGroup2, currentPage2, totalRecordCount2);
		RowBounds rb = new RowBounds(navi.getstartRecord2(), navi.getCountPerPage());
				
		List<member> oldlist = getfriend.getRecommendFriends(map,rb);	
			System.out.println(oldlist.get(0).toString());
		model.addAttribute("oldlist", oldlist);
		model.addAttribute("searchWord2", searchWord2);
		model.addAttribute("searchItem2", searchItem2);
		model.addAttribute("navi", navi);
		model.addAttribute("currentPage2", currentPage2);
				
		return "friend/friendList";

	}
	
	//프렌드 리스트로 가기
	@RequestMapping (value="tooldFriend", method=RequestMethod.GET)
	public String tooldFriend(HttpSession session, Model model) {
		String id = (String)session.getAttribute("memberID");
		friendDao getfriend = sqlSession.getMapper(friendDao.class);
		List<member> friendsInfo = getfriend.selectFriendList(id);
		model.addAttribute("friendsInfo", friendsInfo);
		return "friend/friendList";
	}
	
	@RequestMapping (value="tonewFriend", method=RequestMethod.GET)
	public String tonewFriend() {
		
		return "friend/friendMain";
	}
	@RequestMapping (value="friend3", method=RequestMethod.GET)
	public String friend() {
		
		return "friend/friendMain3";
	}
	@RequestMapping(value="/searchRecommendFriends", method=RequestMethod.GET)
	public String listoldfriend(
		@RequestParam(value="currentPage", defaultValue="1") int currentPage,
		@RequestParam(value="searchItem", defaultValue="id") String searchItem, 
		@RequestParam(value="searchWord", defaultValue="") String searchWord, 
		Model model, @RequestParam(value="startRecord", defaultValue="1") int startRecord,HttpSession hs
	)  
	{
		Map<String, String> map = new HashMap<>();
	    map.put("searchItem", searchItem);
	    map.put("searchWord", searchWord);
	    member a = (member)hs.getAttribute("member");
	    String userid =a.getId();
	    map.put("userid",userid);
	    
		friendDao getfriend = sqlSession.getMapper(friendDao.class);
		int totalRecordCount = getfriend.getRecommendFriendsCount(map);
		
		int countPerPage = 10;
		int pagePerGroup = 5;
		
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, currentPage, totalRecordCount);
		RowBounds rb = new RowBounds(navi.getStartRecord(), navi.getCountPerPage());
				
		List<member> list = getfriend.getRecommendFriends(map,rb);	
				
		System.out.println(list);
		System.out.println(list.get(0).toString());
		model.addAttribute("list", list);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("searchItem", searchItem);
		model.addAttribute("navi", navi);
		model.addAttribute("currentPage", currentPage);
				
		return "friend/friendMain";
	}
		
		
		@RequestMapping(value = "/searchMeeting", method = RequestMethod.POST)
		public @ResponseBody Map<String,Object> searchMeeting(String search) {
			String USER_AGENT = "Mozilla/5.0";

			String request = "http://search.onoffmix.com/event?s=%23" + search;
			System.out.println(request);
			Connection conn = Jsoup.connect(request).header("Content-Type", "application/json;charset=UTF-8")
					.userAgent(USER_AGENT).method(Connection.Method.GET).ignoreContentType(true);

			Document doc = null;
			try {
				doc = conn.get();
			} catch (IOException e) {
				e.printStackTrace();
			}

			List<Element> a = doc.select("ul.todayEvent");
			System.out.println(a.size());
			ArrayList<String[]> result = new ArrayList<String[]>();
			for (int i = 0; i < a.size(); i++) {
				String[] ds = new String[3];
				String link = a.get(i).select("li.eventThumbnail a").attr("href");
				String image = a.get(i).select("li.eventThumbnail img").attr("src");
				String title = a.get(i).select("li.eventThumbnail img").attr("alt");
				ds[0] = link;
				ds[1] = image;
				ds[2] = title;

				result.add(ds);
			}
			article.setValue(result);
			work_PageNavi pn = new work_PageNavi(3,1,result.size());
			Map<String ,Object> data = new HashMap<String,Object>();
			ArrayList<String[]> ab = article.page(1);
			data.put("meeting", ab);
			data.put("navi",pn);

			return data;

		}
	@RequestMapping(value = "/goMPage", method = RequestMethod.POST)
	public @ResponseBody Map<String ,Object> goMPage( int value) {
		ArrayList<String[]> ab = article.page(value);
		work_PageNavi pn = new work_PageNavi(3,value,article.getStaticHello().size());
		Map<String ,Object> data = new HashMap<String,Object>();
		data.put("meeting", ab);
		data.put("navi",pn);

		return data;
	}
	
	@RequestMapping (value="chooseOnefriend", method=RequestMethod.POST)
	public @ResponseBody String chooseOnefriend (String id,HttpSession hs) {
		friendDao chooseone = sqlSession.getMapper(friendDao.class);
		member a = (member) hs.getAttribute("member");
		String userid = a.getId();
		
		int result = chooseone.insert(userid, id);
		System.out.println("result : "+result);
		
		return "";
	}
	
	@RequestMapping (value="friend2", method=RequestMethod.GET)
	public String friend2() {
		
		return "friend/friendMain2";
	}
	
	@RequestMapping (value="friend3", method=RequestMethod.GET)
	   public String friend3() {
	      
	      return "friend/friendMain3";
	   }
	   
	   @RequestMapping(value="/saveboard", method=RequestMethod.POST)
	   public String writeboard(board board, MultipartFile upload, HttpSession session) {
	      System.out.println("업로드 파일 :" + upload);
	      
	      String originalfile = upload.getOriginalFilename();
	      String savedfile = FileService.saveFile(upload, uploadPath);
	      board.setOriginalfile(originalfile);
	      board.setSavedfile(savedfile);
	      
	      boardDao mapper = sqlSession.getMapper(boardDao.class);
	      int result = mapper.insert(board);
	   
	      return "friend/friendMain3";
	   }
	
	
}