/* 시퀀스 번호 추가 */
create sequence seq_board start with 11 increment by 1;
drop sequence seq_board;

create sequence seq_boardgroup start with 8 increment by 1;
drop SEQUENCE seq_boardgroup;

select no, id, pw, position from member;

/* 답글 달았을 경우 상태값 변경 */
update board set accept = '1' where no=2;

/* 시퀀스 조회 */
select * from user_sequences;

/* 문의 리스트, 회원 테이블에서 id 가져옴 */
SELECT b.NO, b.title, m.ID, b.VIEW_COUNT as viewCount, b.POSITION as boardPosition, b.GROUP_NO, m.name as name, m.position as position,
					 to_char(b.reg_date, 'yyyy-mm-dd') as regdate, b.accept
			   FROM board b, member m
			WHERE b.member_no=m.no
			ORDER BY  b.GROUP_NO desc, position asc, no desc;
      
/* 문의 게시판 내용 보기 */
select title, content, group_no as groupNo from board where no=1;

/* 문의 게시판에 글 등록 */
insert into board VALUES (seq_board.nextval, #{title}, #{content}, sysdate, 0, seq_boardgroup.nextval, 1, 1, #{memberNo});

/* 문의 답글 등록 */
insert into board VALUES (seq_board.nextval, '답변입니다.', '문의 하세요.', sysdate, 0, '24', '2', 3, 24);
insert into board VALUES (seq_board.nextval, #{title}, #{content}, sysdate, 0, #{groupNo}, '2', 2, #{memberNo});

SELECT * FROM board;
update board set view_count = (view_count)+1 where no=1;

delete from board where no=69;

commit;