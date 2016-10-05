-- select
select no, name from member where id='ysi1246' and pw='abcd1234';
select title from school order by title asc;
select title from school where title like '%' || '테스트' || '%' order by title asc;

select id from member where id='kmg878';
select email from member where email='kmg878@naver.com';

select no from school where title='성결초등학교';

select m.name, m.email, m.tel, m.grade, m.class_no as classNo, s.TITLE as schoolName 
  from member m, school s 
  where m.SCHOOL_NO = s.NO and m.no=25;
  
-- 출석체크 쿼리
select no, to_char(att_date, 'yyyy-mm-dd pm hh24:mi:ss'), member_no from attend;
select to_char(att_date, 'yyyy-mm-dd') from attend where no=(select max(no) from attend where member_no=203);

select no from attend where member_no=203 and to_char(att_date, 'yyyy-mm-dd') = to_char(sysdate, 'yyyy-mm-dd');

insert into attend values(seq_attend.nextval, to_date('2016-10-03 12:14:11', 'yyyy-mm-dd hh24:mi:ss'), 1);
delete from attend where member_no = 21;

update member set att_count=att_count+1 where no=1;
select att_count as attCount from member where no=1;
update scores set point=point+1 where member_no=1;
select * from scores;

select * from history order by no asc;
insert into history values(seq_history.nextval, '출석체크', 0, 10, sysdate, 1, 3, 0);
commit;

-- insert
insert into member values(seq_member.nextval, 'kg00003', 'aaaa', 'GM숙', 'kg00003@naver.com', '01000001111', sysdate, 1, 0, '', '', (select no from school where title='성결초등학교'));
insert into member values(seq_member.nextval, 'test7', 'aaaa', '테스트7', 'test07@naver.com', '0100000000', sysdate, 1, 0, null, null, null);
insert into attend values(seq_attend.nextval, sysdate, 203);
select * from member;
commit;

-- update
update member set name='GM숙', email='kg00003@hanmail.net', tel='0100001111', school_no=(select no from school where title='성결초등학교'), grade=5, class_no=1 where no=25;
update member set pw='aaaa', name='GM숙', email='kg00003@hanmail.net', tel='0100001111', school_no=(select no from school where title='성결초등학교'), grade=5, class_no=1 where no=25;
update member set att_count=6 where no=21;
update member set position=0 where no=25;

rollback;