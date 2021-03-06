package com.scit.doujo; 
 
import java.util.ArrayList;


import java.util.Collections;
import java.util.HashMap; 
import java.util.Map; 
 
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.scit.doujo.dao.alermDao;
import com.scit.doujo.dao.friendDao;
import com.scit.doujo.dao.messageDao;
import com.scit.doujo.dao.studyDao;
import com.scit.doujo.util.PageNavigator;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Controller; 
import org.springframework.ui.Model; 
import org.springframework.web.bind.annotation.RequestBody; 
import org.springframework.web.bind.annotation.RequestMapping; 
import org.springframework.web.bind.annotation.RequestMethod; 
import org.springframework.web.bind.annotation.RequestParam; 
import org.springframework.web.bind.annotation.ResponseBody; 
 
@Controller 
public class MessageController { 
 
	@Autowired 
	SqlSession sqlSession; 
	 
	/* 친구 목록을 가져온다.===================================================================*/ 
	@RequestMapping(value = "/getMyFriendList", method = RequestMethod.POST) 
	public @ResponseBody Map<String, Map<String,String>> getMyFriendList(@RequestBody Map<String, String> SFL, HttpSession hs) {
		friendDao fdao = sqlSession.getMapper(friendDao.class);
		String memberID = (String)hs.getAttribute("memberID");
		Map<String, Map<String,String>> friendMap = new HashMap<>();
		ArrayList<Map<String,String>> friendList = new ArrayList<>();
		//친구목록 가져오는 기능 구현된 이후 친구가져오기 구현.
		
		friendList = fdao.selectMyFriendList(memberID);
		for (Map<String, String> map : friendList) { 
			friendMap.put(map.get("USERID"), map);
			//System.out.println(map.toString());
		}
		
		if(friendList.size()<=0) {
			Map<String, String> friend1 = new HashMap<>();
			friend1.put("none", "none");
			friendMap.put("friend1", friend1);
		}
		
		//친구목록 가져오는 기능 구현 전까지 쓸 임시 테스트.
		/*Map<String, String> friend1 = new HashMap<>();
		friend1.put("USERID", "sop2");
		friend1.put("NICKNAME", "sop2");
		friendMap.put(friend1.get("USERID"), friend1);
		Map<String, String> friend2 = new HashMap<>();
		friend2.put("USERID", "IDW");
		friend2.put("NICKNAME", "IDW");
		friendMap.put(friend2.get("USERID"), friend2);*/
		
		return friendMap; 
	} 
	 
	
	
	/* 새로운 메세지 목록을 가져온다.===================================================================*/ 
	@RequestMapping(value = "/getMyNewMessageList", method = RequestMethod.POST) 
	public @ResponseBody Map<String, Map<String,String>> getMyNewMessageList(@RequestBody Map<String, String> SNML, HttpSession hs) {
		messageDao dao = sqlSession.getMapper(messageDao.class);
		String memberID = (String)hs.getAttribute("memberID");
		Map<String, Map<String,String>> friendMap = new HashMap<>();
		int count = 0;
		//새로운 메세지를 전부 가져온다.
		Map<String,String> selectKeyWord = new HashMap<>();
		selectKeyWord.put("memberID", memberID);
		ArrayList<Map<String, String>> messageList = dao.selectNewMessage(selectKeyWord);
		//System.out.println(messageList.size());
		//날짜순으로 불러오기 때문에 최신의 메세지가 먼저 불러와 져서 들어간다.
		for (Map<String, String> map : messageList) { 
			if(friendMap.containsKey(map.get("GIVEID"))) {//포함되어 있을 경우 pass
				Map<String,String> dummy = friendMap.get(map.get("GIVEID"));
				dummy.put("CT", ""+(Integer.parseInt(dummy.get("CT"))+1) );
				friendMap.put(dummy.get("GIVEID"), dummy);
				count++;
			} else {//포함되어 있지 않다면 넣는다.
				map.put("count", "ok");
				map.put("CT", "1");
				map.toString();
				friendMap.put(map.get("GIVEID"), map);
				count++;
			}
		}
		//count를 사용해서 새로운 메세지의 총 수를 map에 넣는다.
		Map<String,String> countMessageMap = new HashMap<>();
		countMessageMap.put("count", ""+count);
		friendMap.put("countMessageMap", countMessageMap);
		friendMap.get("countMessageMap").get("count");
		//System.out.println("what"+friendMap.size());
		
		
		return friendMap; 
	} 
	
	
	/* new메세지를 nor메세지로 바꾸고 nor 메세지를 가져온다.===================================================================*/ 
	@RequestMapping(value = "/messageTypeNewToNor", method = RequestMethod.POST) 
	public @ResponseBody Map<String, Map<String,String>> messageTypeNewToNor(@RequestBody Map<String, String> idSet, HttpSession hs) {
		messageDao dao = sqlSession.getMapper(messageDao.class);
		String memberID = (String)hs.getAttribute("memberID");
		idSet.put("memberID", memberID);
		
		ArrayList<String> seqDummy = new ArrayList<>();
		seqDummy.add(memberID);
		seqDummy.add(idSet.get("friendID"));
		Collections.sort(seqDummy);
		String keyword = seqDummy.get(0) + seqDummy.get(1);
		//System.out.println(keyword);
		idSet.put("keyword", keyword);
		
		Map<String, Map<String,String>> friendMap = new HashMap<>();
		dao.updateTypeNewToNor(idSet);
		
		//System.out.println(idSet.get("friendID"));
		ArrayList<Map<String, String>> messageList = dao.selectNewNorMessage(idSet);
		//System.out.println(messageList.size());
		
		int count = 1;
		for (Map<String, String> map : messageList) { 
			friendMap.put(""+count, map);
			count++;
		}
		
		
		
		
		
		
		String friendID = idSet.get("friendID");
		String[] dummyAry;
		
		/*ArrayList<String> messOpenFriendList = new ArrayList<>();
		ArrayList<String> messOpenFriendListBefore  = new ArrayList<>();
		if(hs.getAttribute("messOpenFriendListBefore")!=null) {
			messOpenFriendListBefore  = (ArrayList)hs.getAttribute("messOpenFriendListBefore");
		} else {
			
		}
		System.out.println("friendID:"+friendID);
		messOpenFriendListBefore.add(friendID);
		for (int i = 0; i < messOpenFriendListBefore.size(); i++) {
            if (!messOpenFriendList.contains(messOpenFriendListBefore.get(i))) {
            	messOpenFriendList.add(messOpenFriendListBefore.get(i));
            }
        }
		hs.setAttribute("messOpenFriendList", messOpenFriendList);*/
		
		
		String dummy = (String)hs.getAttribute("friendID");
		if(hs.getAttribute("friendID") != null) { //섹션에 friendID가 없다면
			
			//#이 있다면 split로 쪼개고 없다면 하나라는 소리니 걍 [0]에 집어넣는다.
			if(dummy.contains("#")) {	
				dummyAry = dummy.split("#");
			} else {
				dummyAry = new String[1];
				dummyAry[0] = dummy;
			}
			
			
			int dmck = 0;
			//System.out.println("friendID"+friendID);
			//System.out.println("hsFriendID"+hsFriendID);
			for(String fs : dummyAry) {
				//System.out.println("fs"+fs);
				if(fs.equals(friendID)) {
					dmck = 1;
				}
			}
			//System.out.println("dmck"+dmck);
			if(dmck == 0) {
				dummy += "#" + friendID;
				hs.removeAttribute("friendID");
				hs.setAttribute("friendID", dummy);
			}
		} else {
			hs.setAttribute("friendID", friendID);
		}
		
		
		//System.out.println("최종적인 friendID"+(String)hs.getAttribute("friendID"));
		return friendMap; 
	}
	
	
	/* 메세지를 DB에 넣는다.===================================================================*/ 
	@RequestMapping(value = "/insertMessageIntoDB", method = RequestMethod.POST) 
	public @ResponseBody Map<String, Map<String,String>> insertMessageIntoDB(@RequestBody Map<String, String> message, HttpSession hs) {
		messageDao dao = sqlSession.getMapper(messageDao.class);
		String memberID = (String)hs.getAttribute("memberID");
		Map<String, Map<String,String>> friendMap = new HashMap<>();
		//System.out.println(message.toString());
		
		ArrayList<String> seqDummy = new ArrayList<>();
		seqDummy.add(message.get("giveid"));
		seqDummy.add(message.get("takeid"));
		Collections.sort(seqDummy);
		String keyword = seqDummy.get(0) + seqDummy.get(1);
		message.put("keyword", keyword);
		//System.out.println(message.toString());
		
		dao.insertMessage(message);
		Map<String,String> dummy01 = new HashMap<>();
		dummy01.put("success", "success");
		friendMap.put("dummy01", dummy01);
		return friendMap; 
	}
	
	
	/* nor를 old로 전환한다.===================================================================*/ 
	@RequestMapping(value = "/messageTypeNorToOld", method = RequestMethod.POST) 
	public @ResponseBody Map<String, Map<String,String>> messageTypeNorToOld(@RequestBody Map<String, String> MTNTO, HttpSession hs) {
		messageDao dao = sqlSession.getMapper(messageDao.class);
		String memberID = (String)hs.getAttribute("memberID");
		Map<String, Map<String,String>> friendMap = new HashMap<>();
		//System.out.println("끄엉");
		
		
		String friendID = MTNTO.get("friendID");
		String hsFriendID = (String)hs.getAttribute("friendID");
		
		String dummy = hsFriendID;
		String[] dummyAry;
		String[] dummyAry2 = new String[200];
		String change = "";
		
		
		if(dummy.contains("#")) {
			dummyAry = dummy.split("#");
		} else {
			dummyAry = new String[1];
			dummyAry[0] = dummy;
		}
		//System.out.println("dummyAry의 길이"+dummyAry.toString());
		
		int dmck = 0;
		//System.out.println("friendID"+friendID);
		//System.out.println("hsFriendID"+hsFriendID);
		for(String fs : dummyAry) {
			if(fs.equals(friendID)) {
			} else {
				dummyAry2[dmck] = fs;
				dmck++;
			}
		}
		for(int i=0; i<dmck; i++) {
			if(i==0) {
				change += dummyAry2[i];
			}else {
				change += "#";
				change += dummyAry2[i];
			}
		}
		//System.out.println("change"+change);
		
		hs.removeAttribute("friendID");
		hs.setAttribute("friendID", change);
		
		System.out.println("최종적인 friendID"+(String)hs.getAttribute("friendID"));
		return friendMap;
	}
	
	
} 
