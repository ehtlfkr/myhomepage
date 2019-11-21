CREATE TABLE IF NOT EXISTS post(
	postid VARCHAR(100) NOT NULL,
	userid VARCHAR(100),
	username VARCHAR(10),
	notice VARCHAR(50),
	title VARCHAR(2000),
	text VARCHAR(2000),
	image VARCHAR(20),
	day VARCHAR(100),
	PRIMARY KEY (postid)
)default CHARSET=utf8;

CREATE TABLE IF NOT EXISTS gallery(
	galleryid VARCHAR(100) NOT NULL,
	userid VARCHAR(100),
	username VARCHAR(10),
	notice VARCHAR(50),
	text VARCHAR(2000),
	image VARCHAR(20),
	day VARCHAR(100),
	PRIMARY KEY (galleryid)
)default CHARSET=utf8;
