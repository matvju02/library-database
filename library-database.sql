/* создание базы данных, таблиц, связей */
create database library;
use library;
create table genres
(
	g_id int unsigned not null auto_increment,
    g_name varchar(150) unique not null,
    constraint PK_genres primary key (g_id)
);
create table books
(
	b_id int unsigned not null auto_increment,
    b_name varchar(150) not null,
    b_year smallint unsigned not null,
    b_quantity smallint unsigned not null,
    constraint PK_books primary key (b_id)
);
create table authors
(
	a_id int unsigned not null auto_increment,
    a_name varchar(150) not null,
    constraint PK_authors primary key (a_id)
);
create table subscribers
(
	s_id int unsigned not null auto_increment,
    s_name varchar(150) not null,
    constraint PK_subscribers primary key (s_id)
);
create table subscriptions
(
	sb_id int unsigned not null auto_increment,
    sb_subscriber int unsigned not null,
    sb_book int unsigned not null,
    sb_start date not null,
    sb_finish date not null,
    sb_is_active enum('Y', 'N') not null,
    constraint PK_subscriptions primary key (sb_id)
);
create table m2m_books_genres
(
	b_id int unsigned not null,
    g_id int unsigned not null
);
create table m2m_books_authors
(
	b_id int unsigned not null,
    a_id int unsigned not null
);
set sql_safe_updates = 0;
alter table subscriptions
	add constraint FK_subscriptions_subscribers foreign key (sb_subscriber)
		references subscribers (s_id) on delete cascade on update cascade;
alter table subscriptions
	add constraint FK_subscriptions_books foreign key (sb_book)
		references books (b_id) on delete cascade on update cascade;
alter table m2m_books_genres
	add constraint FK_m2m_books_genres_books foreign key (b_id)
		references books (b_id) on delete cascade on update cascade;
alter table m2m_books_genres
	add constraint FK_m2m_books_genres_genres foreign key (g_id)
		references genres (g_id) on delete cascade on update cascade;
alter table m2m_books_authors
	add constraint FK_m2m_books_authors_books foreign key (b_id)
		references books (b_id) on delete cascade on update cascade;
alter table m2m_books_authors
	add constraint FK_m2m_books_authors_authors foreign key (a_id)
		references authors (a_id) on delete cascade on update cascade;
        
/* заполнение базы данных*/
insert into books (b_id, b_name, b_year, b_quantity) values (1, 'Евгений Онегин', 1985, 2);
insert into books (b_id, b_name, b_year, b_quantity) values (2, 'Сказка о рыбаке и рыбке', 1990, 3);
insert into books (b_id, b_name, b_year, b_quantity) values (3, 'Основание и империя', 2000, 5);
insert into books (b_id, b_name, b_year, b_quantity) values (4, 'Психология программирования', 1998, 1);
insert into books (b_id, b_name, b_year, b_quantity) values (5, 'Язык программирования C++', 1996, 3);
insert into books (b_id, b_name, b_year, b_quantity) values (6, 'Курс теоретической физики', 1981, 12);
insert into books (b_id, b_name, b_year, b_quantity) values (7, 'Искусство программирования', 1993, 7);
insert into authors (a_id, a_name) values (1, 'Д. Кнут');
insert into authors (a_id, a_name) values (2, 'А. Азимов');
insert into authors (a_id, a_name) values (3, 'Д. Карнеги');
insert into authors (a_id, a_name) values (4, 'Л.Д. Ландау');
insert into authors (a_id, a_name) values (5, 'Е.М. Лифшиц');
insert into authors (a_id, a_name) values (6, 'Б. Страуструп');
insert into authors (a_id, a_name) values (7, 'А.С. Пушкин');
insert into genres (g_id, g_name) values (1, 'Поэзия');
insert into genres (g_id, g_name) values (2, 'Программирование');
insert into genres (g_id, g_name) values (3, 'Психология');
insert into genres (g_id, g_name) values (4, 'Наука');
insert into genres (g_id, g_name) values (5, 'Классика');
insert into genres (g_id, g_name) values (6, 'Фантастика');
insert into subscribers (s_id, s_name) values (1, 'Иванов И.И.');
insert into subscribers (s_id, s_name) values (2, 'Петров П.П.');
insert into subscribers (s_id, s_name) values (3, 'Сидоров С.С.');
insert into subscribers (s_id, s_name) values (4, 'Сидоров С.С.');
insert into m2m_books_authors (b_id, a_id) values (1, 7);
insert into m2m_books_authors (b_id, a_id) values (2, 7);
insert into m2m_books_authors (b_id, a_id) values (3, 2);
insert into m2m_books_authors (b_id, a_id) values (4, 3);
insert into m2m_books_authors (b_id, a_id) values (4, 6);
insert into m2m_books_authors (b_id, a_id) values (5, 6);
insert into m2m_books_authors (b_id, a_id) values (6, 5);
insert into m2m_books_authors (b_id, a_id) values (6, 4);
insert into m2m_books_authors (b_id, a_id) values (7, 1);
insert into m2m_books_genres (b_id, g_id) values (1, 1);
insert into m2m_books_genres (b_id, g_id) values (1, 5);
insert into m2m_books_genres (b_id, g_id) values (2, 1);
insert into m2m_books_genres (b_id, g_id) values (2, 5);
insert into m2m_books_genres (b_id, g_id) values (3, 6);
insert into m2m_books_genres (b_id, g_id) values (4, 2);
insert into m2m_books_genres (b_id, g_id) values (4, 3);
insert into m2m_books_genres (b_id, g_id) values (5, 2);
insert into m2m_books_genres (b_id, g_id) values (6, 5);
insert into m2m_books_genres (b_id, g_id) values (7, 2);
insert into m2m_books_genres (b_id, g_id) values (7, 5);
insert into subscriptions (sb_id, sb_subscriber, sb_book, sb_start, sb_finish, sb_is_active) values (100, 1, 3, '2011-01-12', '2011-02-12', 'N');
insert into subscriptions (sb_id, sb_subscriber, sb_book, sb_start, sb_finish, sb_is_active) values (2, 1, 1, '2011-01-12', '2011-02-12', 'N');
insert into subscriptions (sb_id, sb_subscriber, sb_book, sb_start, sb_finish, sb_is_active) values (3, 3, 3, '2012-05-17', '2012-07-17', 'Y');
insert into subscriptions (sb_id, sb_subscriber, sb_book, sb_start, sb_finish, sb_is_active) values (42, 1, 2, '2012-06-11', '2012-08-11', 'N');
insert into subscriptions (sb_id, sb_subscriber, sb_book, sb_start, sb_finish, sb_is_active) values (57, 4, 5, '2012-06-11', '2012-08-11', 'N');
insert into subscriptions (sb_id, sb_subscriber, sb_book, sb_start, sb_finish, sb_is_active) values (61, 1, 7, '2014-08-03', '2014-10-03', 'N');
insert into subscriptions (sb_id, sb_subscriber, sb_book, sb_start, sb_finish, sb_is_active) values (62, 3, 5, '2014-08-03', '2014-10-03', 'Y');
insert into subscriptions (sb_id, sb_subscriber, sb_book, sb_start, sb_finish, sb_is_active) values (86, 3, 1, '2014-08-03', '2014-09-03', 'Y');
insert into subscriptions (sb_id, sb_subscriber, sb_book, sb_start, sb_finish, sb_is_active) values (91, 4, 1, '2015-03-07', '2015-10-07', 'Y');
insert into subscriptions (sb_id, sb_subscriber, sb_book, sb_start, sb_finish, sb_is_active) values (95, 1, 4, '2015-10-07', '2015-11-07', 'N');
insert into subscriptions (sb_id, sb_subscriber, sb_book, sb_start, sb_finish, sb_is_active) values (99, 4, 4, '2015-10-08', '2025-11-08', 'Y');

/* создание представлений */
create view bibl_fond as select b_name, group_concat(distinct a_name order by a_name separator ', '), group_concat(distinct g_name order by g_name separator ', ') from books -- сводная информация по библиотечному фонду
	join m2m_books_authors using (b_id)
    join authors using (a_id)
    join m2m_books_genres using (b_id)
    join genres using (g_id)
		group by b_name
			order by b_name;
create view reader_books as select s_name, s_id, b_name, sb_start, sb_finish from subscribers -- информация о выдаче книг в библиотеке
	join subscriptions on subscriptions.sb_subscriber = subscribers.s_id
    join books on books.b_id = subscriptions.sb_book; 

/* запросы к базе данных */
select sb_subscriber from subscriptions -- идентификаторы читателей бравших книги в библиотеке
	group by sb_subscriber;
select b_name, count(*) from books -- количество выдач книг читателям
	join subscriptions on subscriptions.sb_book = books.b_id
		group by sb_book;
select count(*) as total_books from books; -- число зарегистрированных в библиотеке книг
select count(*) as total_subscribers from subscribers; -- число зарегистрированных в библиотеке читателей
select count(*) as in_use from subscriptions -- число выданных на данный момент экземпляров книг
	where sb_is_active = 'Y';
select b_name, b_year from books -- все книги в библиотеке в порядке возрастания их года издания
	order by b_year;
select b_name, b_year, b_quantity from books -- книги, изданные в период 1990-2000 и представленные в библиотеке не менее, чем в трех экземплярах
	where b_year between 1990 and 2000 and b_quantity >= 3;
select sb_id, sb_start from subscriptions -- идентификаторы и даты выдачи книг за лето 2012-го года
	where month(sb_start) in (6, 7, 8) and year(sb_start) = 2012;
select * from books -- книги, число экземпляров которых меньше среднего по библиотеке
	where b_quantity < (select avg(b_quantity) from books);
select sb_id, sb_start from subscriptions -- идентификаторы и даты выдачи книг за первый год работы библиотеки
	where year(sb_start) = (select year(sb_start) from subscriptions order by sb_start limit 1);
select * from books -- все книги, число экземпляров которых максимально
	where b_quantity = (select max(b_quantity) from books);
select s_id, s_name from subscribers -- все читатели, бравшие в библиотеке книги, без применения join
	where s_id in (select sb_subscriber from subscriptions);
select * from books -- книги из жанров программирование и/или классика, без применения join
	where b_id in (select b_id from m2m_books_genres where g_id in (select g_id from genres where g_name = 'Программирование' or g_name = 'Классика'));
select b_name, g_name from books -- книги из жанров программированние и/или классика
	join m2m_books_genres on m2m_books_genres.b_id = books.b_id
    join genres on genres.g_id = m2m_books_genres.g_id
		where g_name = 'Программирование' or g_name = 'Классика';
select avg(datediff(sb_finish, sb_start)) as period from subscriptions -- на сколько дней в среднем читатели берут книги, учтены только возвращенные
	where sb_is_active = 'N';
select year(sb_start), count(*) as books_taken from subscriptions -- сколько раз в каждый из годов читатели брали книги
	group by year(sb_start);
select s_id, s_name, count(sb_book) from subscribers -- сколько экземпляров книг сейчас на руках у каждого читателя
	join subscriptions on subscriptions.sb_subscriber = subscribers.s_id
		where sb_is_active = 'Y'
			group by sb_subscriber;
select a_name, count(b_name) from authors -- авторы, написавшие более одной книги
	join m2m_books_authors using(a_id)
    join books using(b_id)
		group by a_name having count(b_name) > 1;
select a_name, sum(b_quantity) from authors -- все авторы и число экзмпляров их книг в библиотеке
	join m2m_books_authors using(a_id)
    join books using(b_id)
		group by a_name;
select s_id, s_name, count(sb_book) from subscribers -- все читатели, не вернувшие книги, число книг на руках
	join subscriptions on subscriptions.sb_subscriber = subscribers.s_id
		where sb_is_active = 'Y'
			group by s_id;
select s_id, s_name from subscribers -- читатели, никогда не бравшие книги в библиотеке, без применения join
	where s_id not in (select sb_subscriber from subscriptions);
select s_id, s_name from subscribers -- читатели, никогда не бравшие книги в бибилиотеке
	left join subscriptions on subscriptions.sb_subscriber = subscribers.s_id
		where sb_subscriber is null;
select b_name from books -- книги, написанные Б. Страуструпом и Д. Карнеги в соавторстве
	join m2m_books_authors using(b_id)
    join authors using(a_id)
		group by b_name having group_concat(a_name order by a_name separator ', ') = 'Б. Страуструп, Д. Карнеги';
select s_name, s_id, b_name, sb_start, sb_finish from subscribers -- вся информация об обращениях в библиотеку
	join subscriptions on subscriptions.sb_subscriber = subscribers.s_id
    join books on books.b_id = subscriptions.sb_book
		order by s_id;
select a_name, count(*) from authors -- авторы, написавшие более одной книги
	join m2m_books_authors using (a_id)
    join books using (b_id)
		group by a_name having count(*) > 1
			order by a_name;
select s_id, s_name from subscribers -- читатель, взявший в библиотеке больше всего книг
	join subscriptions on subscriptions.sb_subscriber = subscribers.s_id
		group by s_id
			order by count(*) desc limit 1;
select s_id, s_name from subscribers -- все читатели, взявшие в библиотеке больше всего книг
	join subscriptions on subscriptions.sb_subscriber = subscribers.s_id
		group by s_id having count(sb_book) in (select max(cnt) from (select count(sb_book) as cnt from subscriptions group by sb_subscriber) as gr_cnt);
select a_name, sum(b_quantity) from authors -- все авторы с суммарным количеством экземпляров книг больше 5
	join m2m_books_authors using (a_id)
    join books using (b_id)
		group by a_name having sum(b_quantity) > 5
			order by sum(b_quantity) desc;
select a_name, count(sb_book) from authors -- читаемость авторов (количество раз, которое книги этих авторов были взяты читателями)
	join m2m_books_authors using (a_id)
    join books using(b_id)
    left join subscriptions on subscriptions.sb_book = books.b_id
		group by a_name
			order by count(sb_book) desc;
select a_name, count(sb_book) from authors -- самые читаемые авторы
	join m2m_books_authors using (a_id)
    join books using(b_id)
    join subscriptions on subscriptions.sb_book = books.b_id
		group by a_name having count(sb_book) in (select max(cnt) from (select count(sb_book) as cnt from authors join m2m_books_authors using (a_id) join books using(b_id) join subscriptions on 		  subscriptions.sb_book = books.b_id group by a_name) as gr_cnt)
			order by a_name;
select avg(cnt) from (select count(sb_book) as cnt from authors join m2m_books_authors using (a_id) join books using (b_id) left join subscriptions on subscriptions.sb_book = books.b_id group by a_name) as gr_cnt; -- средняя читаемость авторов
select g_name, count(sb_book) from genres -- читаемость жанров (количество раз, которое книги этих жанров были взяты читателями)
	join m2m_books_genres using(g_id)
	join books using (b_id)
    left join subscriptions on subscriptions.sb_book = books.b_id
		group by g_name
			order by count(sb_book) desc;
select g_name, count(sb_book) from genres -- самые читаемые жанры
	join m2m_books_genres using (g_id)
    join books using (b_id)
    join subscriptions on subscriptions.sb_book = books.b_id
		group by g_name having count(sb_book) in (select max(cnt) from (select count(sb_book) as cnt from genres join m2m_books_genres using (g_id) join books using (b_id) join subscriptions on subscriptions.sb_book = books.b_id group by g_name) as gr_cnt);
select avg(cnt) from (select count(sb_book) as cnt from genres join m2m_books_genres using(g_id) join books using (b_id) left join subscriptions on subscriptions.sb_book = books.b_id group by g_name) as gr_cnt; -- средняя читаемость жанров
select a_name from authors -- авторы, одновременно работавшие в двух и более жанрах
	join m2m_books_authors using (a_id)
		where b_id in (select b_id from m2m_books_genres group by b_id having count(g_id) > 1)
			group by a_name
				order by a_name;
select avg(cnt) from (select count(sb_book) as cnt from subscriptions where sb_is_active = 'Y' group by sb_subscriber) as gr_cnt; -- среднее число книг на руках
select avg(cnt) from (select count(distinct sb_book) as cnt from subscriptions where sb_is_active = 'Y' group by sb_subscriber) as gr_cnt; -- среднее число различных книг на руках
select s_id, s_name from subscribers -- читатели, бравшие самые разножанровые книги
	join subscriptions on subscriptions.sb_subscriber = subscribers.s_id
		where sb_book in (select books.b_id from books join m2m_books_genres using(b_id) group by b_name having count(distinct g_id) in (select max(cnt) from (select books.b_id, count(distinct g_id) as cnt from books join m2m_books_genres using(b_id) group by b_name) as gr_cnt))
			group by s_id;
select s_id, s_name, sb_start from subscribers -- читатель, первый взявший в библиотеке книгу
	join subscriptions on subscriptions.sb_subscriber = subscribers.s_id
		order by sb_start limit 1;
select s_id, s_name, datediff(sb_finish, sb_start) from subscribers -- читатели, быстрее всего прочитавшие книгу
	join subscriptions on subscriptions.sb_subscriber = subscribers.s_id
		where datediff(sb_finish, sb_start) in (select min(datediff(sb_finish, sb_start)) from subscriptions);
select sb_subscriber, b_name from subscriptions -- книги, которые ни разу не были взяты читателями
	right join books on books.b_id = subscriptions.sb_book
		where sb_subscriber is null;
select s_id, s_name, b_name from subscribers -- информация о том, какие книги в принципе в библиотеке может взять каждый из читателей (декартово произведение)
	cross join books
			order by s_id;
select s_id, s_name, b_name from subscribers -- какие книги каждый из читателей еще не брал в библиотеке
	cross join books 
		where (s_id, s_name, b_name) not in (select s_id, s_name, b_name from subscriptions left join subscribers on subscribers.s_id = subscriptions.sb_subscriber left join books on books.b_id = subscriptions.sb_book)
			order by s_id, b_name;
select s_id, s_name, g_name from subscribers -- книги каких жанров каждый из читателей брал в библиотеке
	cross join genres
		where (s_id, s_name, g_name) in (select s_id, s_name, g_name from subscriptions left join subscribers on subscribers.s_id = subscriptions.sb_subscriber left join books on books.b_id = subscriptions.sb_book left join m2m_books_genres using (b_id) left join genres using (g_id))
			order by s_id, g_name;
select b_name, b_quantity from books as ext -- книга, число экземпляров которой больше всего
	where b_quantity > all (select b_quantity from books as inter where ext.b_id != inter.b_id);
select sb_subscriber, count(sb_book) from subscriptions as ext -- читатель, взявший в библиотеке больше всего книг
	group by sb_subscriber having count(sb_book) > all (select count(sb_book) from subscriptions as inter group by sb_subscriber having ext.sb_subscriber != inter.sb_subscriber);
select if (sb_is_active = 'Y', 'Not returned', 'Returned') as `status`, count(sb_id) from subscriptions -- число возвращенных и невозвращенных книг
	group by `status` order by `status` desc;
select b_name, group_concat(a_name order by a_name separator ', ') from books -- все книги с их авторами
	join m2m_books_authors using (b_id)
    join authors using (a_id)
		group by b_name;
select b_name, group_concat(distinct a_name order by a_name separator ', '), group_concat(distinct g_name order by g_name separator ', ') from books -- все книги с их авторами и жанрами
	join m2m_books_authors using (b_id)
    join authors using (a_id)
	join m2m_books_genres using (b_id)
    join genres using (g_id)
		group by b_name;
select s_id, s_name, group_concat(b_name order by b_name separator ', ') from subscriptions -- книги, взятые читателями в их первый день работы с библиотекой
	join subscribers on subscribers.s_id = subscriptions.sb_subscriber
    join books on books.b_id = subscriptions.sb_book
    where (s_id, sb_start) in (select sb_subscriber, min(sb_start) from subscriptions group by sb_subscriber)
		group by s_id;