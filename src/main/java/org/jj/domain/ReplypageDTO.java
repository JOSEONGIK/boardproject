package org.jj.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ReplypageDTO {

	
	private int replyCnt;
	private List<ReplyVO> list;
}
