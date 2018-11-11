create table users (
	userid int NOT NULL,
	name text,
	primary key (userid)
);

create table movies (
	movieid int NOT NULL,
	title text,
	primary key (movieid)
);

create table taginfo (
	tagid int NOT NULL,
	content text,
	primary key (tagid)
);

create table genres (
	genreid int NOT NULL,
	name text,
	primary key (genreid)
);

create table ratings (
	userid int,
	movieid int,
	rating numeric CHECK (rating <=5),
	timestamp bigint,
	primary key (userid, movieid),
	foreign key (userid) references users (userid),
	foreign key (movieid) references movies (movieid)
);

create table tags (
	userid int,
	movieid int,
	tagid int, 
	timestamp bigint,
	primary key (userid, movieid, tagid),
	foreign key (userid) references users (userid),
	foreign key (movieid) references movies (movieid),
	foreign key (tagid) references taginfo (tagid)
);

create table hasagenre (
	movieid int,
	genreid int,
	primary key (movieid, genreid),
	foreign key (movieid) references movies (movieid),
	foreign key (genreid) references genres (genreid)
);