package com.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.board.domain.BoardVo;
import com.board.mapper.BoardMapper;
import com.board.menus.domain.MenuVo;
import com.board.menus.mapper.MenuMapper;
import com.board.user.domain.UserVo;
import com.board.user.mapper.UserMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/Board")
public class BoardController {
	@Autowired
	private BoardMapper boardMapper;
	@Autowired
	private MenuMapper menuMapper;
	@Autowired
	private UserMapper userMapper;
	
	// 게시판 목록
	// /Board/List
	@RequestMapping("/List")
	public ModelAndView list(MenuVo menuVo) {
		log.info("menuVo : {}", menuVo);
		//메뉴 아이디
		String menu_id = menuVo.getMenu_id();		
		
		//메뉴 목록
		List<MenuVo> menuList = menuMapper.getMenuList();
		System.out.println(menuList);
		
		//게시물 목록
		List<BoardVo> boardList = boardMapper.getBoardList(menuVo);
		System.out.println(boardList);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("menu_id", menu_id);
		mv.addObject("menuList", menuList);
		mv.addObject("boardList", boardList);
		mv.setViewName("board/list");
		
		return mv;
	}
	
	// 게시글 등록(내가 한 거)
	// /Board/WriteForm
	@RequestMapping("/WriteForm")
	public ModelAndView writeForm(MenuVo menuVo) {
		//메뉴 목록
		List<MenuVo> menuList = menuMapper.getMenuList();
		//사용자 목록
		List<UserVo> userList = userMapper.getUserList();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("menuList", menuList);
		mv.addObject("userList", userList);
		mv.setViewName("board/write");
		
		return mv;
	}
	
	// /Board/Write
	@RequestMapping("/Write")
	public ModelAndView write(BoardVo boardVo) {
		log.info("boardVo : {}", boardVo);
		boardMapper.insertBoard(boardVo);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Board/List?menu_id=MENU01");
		
		return mv;
	}
	
	// 게시글 등록 2
	// /Board/WriteForm2?menu_id=menu_id
	@RequestMapping("/WriteForm2")
	public ModelAndView writeForm2(MenuVo menuVo) {
		//메뉴 목록
		List<MenuVo> menuList = menuMapper.getMenuList();
		System.out.println("[==MenuLsit==] : " + menuList);
		
		//?menu_id=MENU01 넘어온 menu_id를 처리
		String menu_id = menuVo.getMenu_id();
		
		//사용자 목록
		List<UserVo> userList = userMapper.getUserList();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("menu_id", menu_id);
		mv.addObject("menuList", menuList);
		mv.addObject("userList", userList);
		mv.setViewName("board/write2");
		
		return mv;
	}
	
	// /Board/Write2
	@RequestMapping("/Write2")
	public ModelAndView write2(BoardVo boardVo) {
		log.info("boardVo : {}", boardVo);
		//넘어온 값 Board에 저장
		boardMapper.insertBoard(boardVo);
		
		String menu_id = boardVo.getMenu_id();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("menu_id", menu_id);
		mv.setViewName("redirect:/Board/List?menu_id=MENU01");
		
		return mv;
	}
	
	//게시글 상세 보기
	// /Board/View
	@RequestMapping("/View")
	public ModelAndView view(BoardVo boardVo) {
		log.info("boardVo : {}", boardVo);
		
		//넘어온 bno 설정
		int bno = boardVo.getBno();
		
		//bno로 조회한 BoardVo 객체
		BoardVo vo = boardMapper.getBoard(bno);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("boardVo", vo);
		mv.setViewName("/board/view");
		
		return mv;
	}
	
	//게시글 수정
	@RequestMapping("/UpdateForm")
	public ModelAndView updateForm(BoardVo boardVo) {
		//넘어온 bno 설정
		int bno = boardVo.getBno();
		
		//bno로 조회한 BoardVo 객체
		BoardVo vo = boardMapper.getBoard(bno);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("boardVo", vo);
		mv.setViewName("/board/update");
		
		return mv;
	}
	@RequestMapping("/Update")
	public ModelAndView update(BoardVo boardVo) {
		log.info("boardVo : {}", boardVo);
		boardMapper.updateBoard(boardVo);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Board/List?menu_id=MENU01");
		
		return mv;
	}
	
	//게시글 삭제
	@RequestMapping("/Delete")
	public ModelAndView delete(BoardVo boardVo) {
		boardMapper.deleteBoard(boardVo);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Board/List?menu_id=MENU01");
		
		return mv;
	}
}
