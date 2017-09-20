package com.common;

public interface Common {
	// 로그인 결과
	public int NOT_EXIST_USER_ID = 1;
	public int WRONG_USER_PASSWORD = 2;
	public int LOGIN_SUCCESS = 3;
	
	// 한페이지에 보여줄 게시글 개수
	public int BOARD_CNT_ONE_PAGE = 20;
}
