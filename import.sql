create table memos(
    id integer primary key,
    title not null,
    body text not null 
);
insert into memos(id, title, body) values
(1 ,'memo1', 'test1'),
(2, 'memo2', 'test2');
