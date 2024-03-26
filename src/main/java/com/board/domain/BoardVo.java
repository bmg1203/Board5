package com.board.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardVo {
	//field
	@NonNull
	private int bno;
	@NonNull
	private String menu_id;
	@NonNull
	private String title;
	private String content;
	@NonNull
	private String writer;
	private String regdate;
	private int hit;
}
