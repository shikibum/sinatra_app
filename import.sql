create table memos(
    id integer primary key autoincrement,
    title text not null,
    body text not null 
);
insert into memos(title, body) values
('memo1', 'test1'),
('memo2', 'test2');
