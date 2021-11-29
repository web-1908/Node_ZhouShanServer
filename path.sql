USE travel;

CREATE TABLE path(
  id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(50),
  pic  VARCHAR(128)
);
#3:添加六条合法用户
INSERT INTO path VALUES(null,'你猜，你家楼下有哪些颜多活好的咖啡厅','http://localhost:4000/14.jpg');
INSERT INTO path VALUES(null,'晚上的舟山也好耍','http://localhost:4000/15.jpg');
INSERT INTO path VALUES(null,'懂生活的人,都爱逛','http://localhost:4000/16.jpg');
INSERT INTO path VALUES(null,'只有当地人才这样玩的漫游指南','http://localhost:4000/17.jpg');
INSERT INTO path VALUES(null,'如何在舟山吃遍世界','http://localhost:4000/18.jpg');
INSERT INTO path VALUES(null,'逛累了休息一下','http://localhost:4000/19.jpg');