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
		
		//메뉴 목록
		List<MenuVo> menuList = menuMapper.getMenuList();
		
		//게시물 목록
		List<BoardVo> boardList = boardMapper.getBoardList(menuVo);
		System.out.println(boardList);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("menuList", menuList);
		mv.addObject("boardList", boardList);
		mv.setViewName("board/list");
		
		return mv;
	}
	
	// 게시글 등록
	// /Board/WriteForm
	@RequestMapping("/WriteForm")
	public ModelAndView wirteForm(MenuVo menuVo) {
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
		public ModelAndView wirte(BoardVo boardVo) {
			log.info("boardVo : {}", boardVo);
			boardMapper.insertBoard(boardVo);
			
			ModelAndView mv = new ModelAndView();
			mv.setViewName("redirect:/Board/List?menu_id=MENU01");
			
			return mv;
		}
}
