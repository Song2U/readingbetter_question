select * from accusation order by no asc;
select * from comments order by no asc;
select * from review order by no asc;
select * from member order by no asc;

-- delete
delete from accusation where no=41;

-- select
select a.key_no as keyNo, a.no, a.reason, to_char(a.reg_date, 'yyyy-mm-dd') as regDate, a.accept, a.identity, b.content, b.accuTarget, c.ID
  from accusation a, (select c.no, c.content, m.ID as accuTarget 
                        from comments c, member m 
                        where c.MEMBER_NO = m.NO) b, member c  
  where a.KEY_NO = b.no and a.MEMBER_NO = c.NO and a.no=1;
  
select identity from accusation where no=1;

select a.no, a.reason, to_char(a.reg_date, 'yyyy-mm-dd') as regDate, a.accept, a.identity, b.review as content, b.accuTarget, c.ID 
  from accusation a, (select r.NO, r.REVIEW, m.ID as accuTarget from review r, member m where r.MEMBER_NO = m.NO) b, member c 
  where a.KEY_NO = b.NO and a.MEMBER_NO = c.NO and a.NO=1;

-- update
update accusation set accept = 1 where no=2;
update member set penalty=penalty+1 where id='yury07';
update review set state=0 where no=1;
update comments set state=0 where no=1;
rollback;