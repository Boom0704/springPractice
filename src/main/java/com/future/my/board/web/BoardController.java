package com.future.my.board.web;

import java.net.http.HttpRequest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.future.my.board.service.BoardService;
import com.future.my.board.vo.BoardVO;
import com.future.my.board.vo.ReplyVO;

@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	@RequestMapping("/boardView")
	public String boardView(Model model) {
		
		ArrayList<BoardVO> boardList = boardService.getBoardList();
		// Model은 spring에서 컨트롤러와 뷰 사이의 데이터를 전달히기 위한 인터페이스
		// Model객체에 추가하면 뷰에서는 데이터를 사용할 수 있음
		model.addAttribute("boardList", boardList);
		
		return "board/boardView";
	}
	
	@RequestMapping("/getBoard")
	public String boardDetailView(Model model, int boardNo) throws Exception{
		//System.out.println(boardNo);
		BoardVO vo = boardService.getBoard(boardNo);
		// 같은 게시글 번호의 댓글 리스트 조회하려고 여기다 작성
		ArrayList<ReplyVO> replyList = boardService.getReplyList(boardNo);
		
		model.addAttribute("board", vo);
		model.addAttribute("replyList", replyList);  // 댓글 리스트
		
		return "board/boardDetailView";
	}
	
	@RequestMapping("/boardWriteView")
	public String boardWriteView(HttpSession session) {
		
		if(session.getAttribute("login") == null ) {
			return "redirect:/loginView";
		}
		
		return "board/boardWriteView";
	}
	
	@PostMapping("/boardWriteDo")
	public String boardWriteDo(BoardVO board) throws Exception {
		
		boardService.writeBoard(board);
		
		return "redirect:/boardView";
	}
	
	@PostMapping("/boardEditView")
	public String boardEditView(Model model, int boardNo) throws Exception{
		//System.out.println(boardNo);
		BoardVO vo = boardService.getBoard(boardNo);
		model.addAttribute("board", vo);
		
		return "board/boardEditView";
	}
	
	@RequestMapping("/boardEditDo")
	public String boardUpdateView(BoardVO vo) throws Exception{
		
		//System.out.println("======"+vo);
		boardService.updateBoard(vo);
		
		return "redirect:/boardView";
	}
	
	@PostMapping("/boardDeleteView")
	public String boardDeleteView(Model model, int boardNo) throws Exception{
		//System.out.println(boardNo);
		BoardVO vo = boardService.getBoard(boardNo);
		model.addAttribute("board", vo);
		
		return "board/boardDeleteView";
	}
	
	@RequestMapping("/boardDelDo")
	public String boardDeleteView(BoardVO vo) throws Exception{
		
		System.out.println(vo);
		boardService.deleteBoard(vo);
		
		return "redirect:/boardView";
	}
	

	// @@ResponseBody 객체를 json 데이터 형태로 리턴
	// 기존이랑 다르데 비동기 형식으로 하기위해 사용
	@ResponseBody
	@PostMapping("/writeReplyDo") // @@RequestBody 문자열 json데이터를 객체로 받음
	public ReplyVO writeReplyDo(@RequestBody ReplyVO vo) throws Exception {
		System.out.println(vo);
		Date date = new Date();
		SimpleDateFormat fdr = new SimpleDateFormat("yyMMddHHmmssSSS");
		String uniquId = fdr.format(date);
		System.out.println(uniquId);
		vo.setReplyNo(uniquId);
		// 댓글 저장             저장 후 조회는 비동기하기 위해 . 등록된 내용만 추가로 보여주기 위해
		boardService.writeReply(vo);
		// 저장된 댓글 조회
		ReplyVO result = boardService.getReply(uniquId);
		return result;
	}
	
	@ResponseBody
	@PostMapping("/delReplyDo")
	public String delReplyDo(@RequestBody ReplyVO vo) {
		
		String result ="success";
		try {
			boardService.delReply(vo.getReplyNo());
		} catch (Exception e) {
			e.printStackTrace();
			result ="fail";
		}
		
		return result;
	}
	
	@ExceptionHandler(Exception.class)
	public String errorView(Exception e) {
		e.printStackTrace();
		return "errorView";
	}

}
