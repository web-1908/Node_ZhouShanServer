-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2019-12-21 06:46:08
-- 服务器版本： 10.1.28-MariaDB
-- PHP Version: 5.6.32
SET NAMES UTF8;
DROP DATABASE IF EXISTS travel;
CREATE DATABASE travel CHARSET=UTF8;
use travel;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `travel`
--

-- --------------------------------------------------------

--
-- 表的结构 `banner`
--

CREATE TABLE `banner` (
  `pid` int(11) NOT NULL,
  `title` varchar(128) DEFAULT NULL,
  `src` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `banner`
--

INSERT INTO `banner` (`pid`, `title`, `src`) VALUES
(1, '舟山国际沙雕艺术节', 'http://www.zsitour.com/upload_resource/artcle/thumb_img/2016/0921/20160921122223OMZBIK0Z1EUI55MTWKVX.jpg'),
(2, '东沙弄堂节暨海岛非遗', 'http://img4.imgtn.bdimg.com/it/u=355742839,1385859639&fm=26&gp=0.jpg'),
(3, '舟山国际沙雕节开园迎客', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1576736754865&di=3e2ec3ece8850f7f1f08a4568371064b&imgtype=jpg&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D3897849407%2C3689234126%26fm%3D214%26gp%3D0.jpg'),
(4, '东海音乐节等你来嗨', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3601085854,3088028539&fm=15&gp=0.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `collect`
--

CREATE TABLE `collect` (
  `id` int(11) NOT NULL,
  `vid` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `selected` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `collect`
--



-- --------------------------------------------------------

--
-- 表的结构 `path`
--

CREATE TABLE `path` (
  `id` int(11) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `pic` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `path`
--

INSERT INTO `path` (`id`, `title`, `pic`) VALUES
(1, '赵', 'http://localhost:4000/14.jpg'),
(2, '钱', 'http://localhost:4000/15.jpg'),
(3, '孙', 'http://localhost:4000/16.jpg'),
(4, '李', 'http://localhost:4000/17.jpg'),
(5, '周', 'http://localhost:4000/18.jpg'),
(6, '吴', 'http://localhost:4000/19.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `tourist`
--

CREATE TABLE `tourist` (
  `tid` int(11) NOT NULL,
  `title` varchar(128) DEFAULT NULL,
  `details` varchar(128) DEFAULT NULL,
  `zan` int(11) DEFAULT NULL,
  `times` varchar(128) DEFAULT NULL,
  `img` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tourist`
--

INSERT INTO `tourist` (`tid`, `title`, `details`, `zan`, `times`, `img`) VALUES
(1, '沙雕艺术广场', '广场很好玩', 3, '2019-12-12', 'http://www.zsitour.com/upload_resource/ueditor/20161009/98561475976825281.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `bid` smallint(6) NOT NULL,
  `uname` varchar(16) DEFAULT NULL,
  `upwd` varchar(16) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `img` varchar(128) DEFAULT NULL,
  `vid` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`bid`, `uname`, `upwd`, `phone`, `img`, `vid`, `count`) VALUES
(1, 'tom', '123456', '13712345678', 'http://localhost:4000/12.jpg', 0, 0),
(2, 'jerry', '123456', '13266666555', 'http://localhost:4000/11.jpg', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `views`
--

CREATE TABLE `views` (
  `vid` int(11) NOT NULL,
  `class` varchar(20) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `img` varchar(128) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  `details` varchar(1000) DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `price` decimal(5,2) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `views`
--

INSERT INTO `views` (`vid`, `class`, `title`, `img`, `address`, `details`, `time`, `price`, `phone`) VALUES
(1, '山', '普陀山风景名胜区', 'http://www.zsitour.com/upload_resource/img/hotspot/2016/0928/20160928084400W4GPMM5XUQRFKGNBYE68.jpg', '舟山普陀山', '陀山风景名胜区位于浙江杭州湾以东约100海里，是舟山群岛中的一个小岛。全岛面积12.5平方公里，呈狭长形，南北最长处为8.6里，东西最宽外3.5公里。普陀山风景名胜区素有海天佛国、南海圣境之称，是首批国家重点风景名胜区。最高处佛顶山，海拔约300米。东达日本，北接登莱，南亘欧闽，西通吴会，是中国的东大门。五代后梁贞明二年(公元916年)，日僧慧锷自五台山请观音像归国，途经普陀山被大风所阻，于紫竹林结茅留居，建不肯去观音院。历朝相继在此兴建寺院，以供奉观音菩萨为主。普陀山也就成为中国四大佛教道场之一。', '', '200.00', '0580-6091431'),
(2, '广场', '朱家尖国际沙雕艺术广场 AAAA', 'http://www.zsitour.com/upload_resource/ueditor/20161009/98561475976825281.jpg', '舟山朱家尖南沙', '南沙景点是朱家尖景区的精华所在，也是“十里金沙”奇观的中心。说起“十里金沙”那可是朱家尖岛的骄傲，朱家尖沙景资源十分丰富，尤其是岛东南沿岸依次排列的东沙、南沙、千沙、里沙和青沙五大沙滩，绵延近5公里，如一条金色的项链镶嵌在青山碧海之间，号称“十里金沙”。各沙滩两尽头，均有岬角相拥，独立成景，滩岸绿林环抱，滩前碧波万顷，滩面金黄开阔，景色蔚为壮观，如此辽阔的大沙滩，加之清一色的细纯沙粒，在全国沿海都是罕见的。', '06:30—18:30', '75.00', '0580-6632545'),
(3, '公园', '朱家尖大青山国家公园 AAAA', 'http://www.zsitour.com/upload_resource/img/hotspot/2016/0913/20160913143821Y187ZC4C13WQIN8GN2QT.jpg', '舟山市朱家尖', '“观千岛海景，看青山醉雾；玩十里金沙，揽海岛峭壁”，朱家尖大青山国家公园是普陀山国家重点风景名胜区、国家AAAA级景区——朱家尖的核心景区。十平方公里的区域面积、30多公里的海岸线、18公里的环岛旅游大道，集聚了阳光、海浪、沙滩、礁石、峭壁、渔村、千岛海景等一系列现代滨海休闲度假的优质资源以及国家公园特有的稀缺元素，大青山国家公园以其特有的“山奇、石怪、滩美”风景资源而闻名。', '07:35—17:15', '100.00', '0580-6031226'),
(4, '公园', '东海大峡谷国家森林公园生态旅游区 AAA', 'http://www.zsitour.com/upload_resource/img/hotspot/2016/1010/20161010141000FWIYM4D9PSO0D5XQ0PEJ.jpg', '舟山市定海区双桥街道紫微社区狭门水库上游', '东海大峡谷国家森林公园之茶人谷生态旅游区位于双桥街道狭门水库之上，境内大潭岗，号东海第四峰，岗上植茶千亩，谷因名之。山高、谷邃、溪长、瀑飞、林幽、岩危，乃茶人谷六奇之景；采果、探花、赏泉、品茗、参禅、访兰，为茶人谷六雅之境；春鸟鸣涧、夏荫滩林、秋枫染霜、冬梅点雪、枕流栖石、随云逍遥，实茶人谷六游之美。', '08:30—16:30', '50.00', '0580-2978855');


CREATE TABLE search(
sid SMALLINT PRIMARY KEY AUTO_INCREMENT,
img VARCHAR(256),
title VARCHAR(32)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- 火锅
INSERT INTO search VALUES(NULL,"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1576926562808&di=da14138296b158fd5617517c38660fe0&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F0160aa5704cfcf32f875a944c2f173.jpg%401280w_1l_2o_100sh.jpg","舟山.李家火锅");
INSERT INTO search VALUES(NULL,"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1576926562798&di=ad14ed674f65f4a4ef2277b9bff2035f&imgtype=0&src=http%3A%2F%2Fpic1.shejiben.com%2Fcase%2Fday_110618%2F20110618_ba2df6046321f541cf03MINQtkFZ3pFf.jpg","舟山.王家火锅");
INSERT INTO search VALUES(NULL,"http://img.zcool.cn/community/014f6758340271a8012060c860af65.jpg","舟山.赵家火锅");
INSERT INTO search VALUES(NULL,"http://img3.333cn.com/img333cn/201904/12/175501941.jpg","舟山.刘家火锅");
-- 公园
INSERT INTO search VALUES(NULL,"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1576926778740&di=79dfeeabdf4d24d60e3c515709f15427&imgtype=0&src=http%3A%2F%2Fimg8.zol.com.cn%2Fbbs%2Fupload%2F18509%2F18508495.jpg","舟山.森林公园");
INSERT INTO search VALUES(NULL,"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1576926778740&di=31f66edc564aeb306f73c9af0ebc87ae&imgtype=0&src=http%3A%2F%2Fk.zol-img.com.cn%2Fdcbbs%2F21028%2Fa21027247_01000.jpg","舟山.人民公园");
-- 美食
INSERT INTO search VALUES(NULL,"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1576926945252&di=b7273454956331e4fc27af5dbbd5b353&imgtype=0&src=http%3A%2F%2Fpic15.nipic.com%2F20110810%2F7984399_111020377120_2.jpg","舟山.赵美食");
INSERT INTO search VALUES(NULL,"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1576927095376&di=3d73e274f90b5d7a513e291ed76d9b5c&imgtype=0&src=http%3A%2F%2Fimg3.redocn.com%2Ftupian%2F20141111%2Fmeiweisuanlamian_3419763.jpg","舟山.钱美食");
INSERT INTO search VALUES(NULL,"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1576927140755&di=4da6b4f5314961c7b706329d480e8db5&imgtype=0&src=http%3A%2F%2Fimg1.juimg.com%2F161129%2F330834-16112Z5224534.jpg","舟山.孙美食");
-- 咖啡
INSERT INTO search VALUES(NULL,"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1576927256460&di=28fe30f77ebddf41b08e0fc1c2a6bfcf&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F01cbe65a13cd2ca80121349084955d.jpeg","星巴克社区咖啡.麓山国际店");
INSERT INTO search VALUES(NULL,"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1576927336517&di=fd1680aea10f4c5db3ac905a1124837f&imgtype=0&src=http%3A%2F%2Fp.yhres.com%2Ffile%2F2017%2F11%2F08%2F1510137842054777.jpg","The Temple Cafe 咖啡厅");
INSERT INTO search VALUES(NULL,"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1576929611174&di=77c759e1c38ba22be5b520a2335facce&imgtype=0&src=http%3A%2F%2Fstatic-xiaoguotu.17house.com%2Fxgt%2Fa%2F10%2F1462587578133.jpg","白纸咖啡");
INSERT INTO search VALUES(NULL,"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1576927336512&di=72dceca93ab3941e7f33c189f0bbd0ee&imgtype=0&src=http%3A%2F%2Fphoto.16pic.com%2F00%2F52%2F27%2F16pic_5227258_b.jpg","Urban Picnic 咖啡");
 INSERT INTO search VALUES(NULL,"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1576927336510&di=d40d87df9ffef563754ee7f123aba861&imgtype=0&src=http%3A%2F%2Fpic132.huitu.com%2Fres%2F20191120%2F2258529_20191120144059419070_1.jpg","The Place party 咖啡");
--  酒店
 INSERT INTO search VALUES(NULL,"http://file05.16sucai.com/2015/0704/295c1c2664d41f45e869d9db202e3385.jpg","rose.酒店");
 INSERT INTO search VALUES(NULL,"http://image.wanda.cn/uploadfile/2016/0924/20160924030408978.jpg","jack 连锁酒店");
 INSERT INTO search VALUES(NULL,"http://img.taopic.com/uploads/allimg/110322/9124-1103221KA974.jpg","Tom & Cat 酒店");
 INSERT INTO search VALUES(NULL,"http://images4.c-ctrip.com/target/hotel/47000/46474/A5792435-78ED-469C-8175-76EDDDA91120_550_412.jpg","King 酒店");
 INSERT INTO search VALUES(NULL,"http://img.zx123.cn/Resources/zx123cn/uploadfile/2015/1201/a1f3924567c99ba56cf20aa2e850ce7b.jpg","jerry 酒店");
 INSERT INTO search VALUES(NULL,"http://images4.c-ctrip.com/target/fd/hotel/g1/M04/74/F9/CghzflUsss-AAhEKAAVKl84wlV8440_550_412.jpg","marry.&  酒店");







--  顾玉萍
/*舟山周边*/
CREATE TABLE travel_serv(
lid SMALLINT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(256),
simg VARCHAR(256)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO travel_serv VALUES(NULL,"睡在峨眉","http://localhost:4000/5.jpg"),
(NULL,"咖啡美酒","http://localhost:4000/12.jpg"),
(NULL,"天冷涮火锅","http://localhost:4000/13.jpg"),
(NULL,"新晋书店","http://localhost:4000/5.jpg"),
(NULL,"艺术空间","http://localhost:4000/5.jpg"),
(NULL,"宝藏街巷","http://localhost:4000/5.jpg"),
(NULL,"一人好去处","http://localhost:4000/5.jpg");

-- 韩广慧

-- 表的结构 `whither`
--

CREATE TABLE `whither` (
  `id` int(11) NOT NULL,
  `img` varchar(126) DEFAULT NULL,
  `titel` varchar(32) DEFAULT NULL,
  `dname` varchar(32) DEFAULT NULL,
  `location` varchar(126) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `whither`
--

INSERT INTO `whither` (`id`, `img`, `titel`, `dname`, `location`) VALUES
(1, 'http://localhost:4000/go/1.jpg', '小岛', '嵊山枸杞岛', '浙江省舟山群岛东北部的一个岛屿'),
(2, 'http://localhost:4000/go/2.jpg', '小岛', '嵊山枸杞岛', '浙江省舟山群岛东北部的一个岛屿'),
(3, 'http://localhost:4000/go/3.jpg', '小岛', '嵊山枸杞岛', '浙江省舟山群岛东北部的一个岛屿'),
(4, 'http://localhost:4000/go/4.jpg', '小岛', '嵊山枸杞岛', '浙江省舟山群岛东北部的一个岛屿'),
(5, 'http://localhost:4000/go/5.jpg', '小岛', '嵊山枸杞岛', '浙江省舟山群岛东北部的一个岛屿'),
(6, 'http://localhost:4000/go/6.jpg', '小岛', '嵊山枸杞岛', '浙江省舟山群岛东北部的一个岛屿');

-- 表的结构 `course`
--

CREATE TABLE `course` (
  `id` int(11) NOT NULL,
  `img` varchar(126) DEFAULT NULL,
  `titel` varchar(32) DEFAULT NULL,
  `lname` varchar(32) DEFAULT NULL,
  `img2` varchar(126) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `course`
--

INSERT INTO `course` (`id`, `img`, `titel`, `lname`, `img2`) VALUES
(1, 'http://localhost:4000/2.jpg', '周末游舟山', '海岛风光秀', 'http://localhost:4000/5.jpg'),
(2, 'http://localhost:4000/3.jpg', '周末游舟山', '海岛风光', 'http://localhost:4000/wz.jpg'),
(3, 'http://localhost:4000/5.jpg', '周末游舟山', '海岛风光秀丽', 'http://localhost:4000/3.jpg'),
(4, 'http://localhost:4000/6.jpg', '周末游舟山', '海岛风光秀丽挺', 'http://localhost:4000/wz.jpg'),
(5, 'http://localhost:4000/3.jpg', '周末游舟山', '海岛风', 'http://localhost:4000/wz.jpg'),
(6, 'http://localhost:4000/4.jpg', '周末游舟山', '海岛风光', 'http://localhost:4000/wz.jpg'),
(7, 'http://localhost:4000/1.jpg', '周末游舟山', '海岛', 'http://localhost:4000/wz.jpg');

-- ----------------------




CREATE TABLE `youke` (
  `bid` int NOT NULL,
  `uname` varchar(16) DEFAULT NULL,
  `upwd` varchar(16) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `img` varchar(128) DEFAULT NULL,
  `vid` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `imgurl` varchar(256) NOT NULL,
  `comment` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `youke`
--

INSERT INTO `youke` (`bid`, `uname`, `upwd`, `phone`, `img`, `vid`, `count`, `imgurl`, `comment`) VALUES
(1, 'tom', '123456', '13712345678', 'http://localhost:4000/12.jpg', 0, 0, 'http://localhost:4000/6.jpg', '真实是不错的，很好玩'),
(2, '神圣魔精', '123456', '13712345678', 'http://localhost:4000/8.jpg', 0, 0, 'http://localhost:4000/4.jpg', '真实是不错的，很好玩'),
(3, '生迷宫', '123456', '13712345678', 'http://localhost:4000/10.jpg', 0, 0, 'http://localhost:4000/1.jpg', '真实是不错的，很好玩'),
(4, '世界第三', '123456', '13712345678', 'http://localhost:4000/12.jpg', 0, 0, 'http://localhost:4000/6.jpg', '真实是不错的，很好玩'),
(5, 'tjsj', '123456', '13712345678', 'http://localhost:4000/12.jpg', 0, 0, 'http://localhost:4000/6.jpg', '真实是不错的，很好玩'),
(6, 'jerry', '123456', '13266666555', 'http://localhost:4000/11.jpg', 0, 0, 'http://localhost:4000/1.jpg', '真的很好的地方');

-- 

CREATE TABLE `chengshi` (
  `id` int(11) NOT NULL,
  `img` varchar(128) DEFAULT NULL,
  `comment` varchar(128) NOT NULL,
  `tiems` varchar(128) NOT NULL,
  `diqu` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `chengshi`
--

INSERT INTO `chengshi` (`id`, `img`, `comment`, `tiems`, `diqu`) VALUES
(1, 'http://localhost:4000/12.jpg', '真实是不错的，很好玩', '还有20天', '舟山区'),
(2, 'http://localhost:4000/10.jpg', '美景不同', '还有5天', '舟山区'),
(3, 'http://localhost:4000/6.jpg', '值得你一玩的', '还有4天', '舟山区'),
(4, 'http://localhost:4000/4.jpg', '真实是不错的，很好玩', '还有8天', '舟山区'),
(5, 'http://localhost:4000/8.jpg', '不同美景事件', '还有45天', '舟山区'),
(6, 'http://localhost:4000/1.jpg', '真实是不错的，很好玩', '还有30天', '舟山区'),
(7, 'http://localhost:4000/5.jpg', '真实是不错的，很好玩', '还有18天', '舟山区'),
(8, 'http://localhost:4000/9.jpg', '真实是不错的，很好玩', '还有2天', '舟山区');






















--
-- Indexes for dumped tables
--

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `collect`
--
ALTER TABLE `collect`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `path`
--
ALTER TABLE `path`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tourist`
--
ALTER TABLE `tourist`
  ADD PRIMARY KEY (`tid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`bid`);

--
-- Indexes for table `views`
--
ALTER TABLE `views`
  ADD PRIMARY KEY (`vid`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `banner`
--
ALTER TABLE `banner`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `collect`
--
ALTER TABLE `collect`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `path`
--
ALTER TABLE `path`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `tourist`
--
ALTER TABLE `tourist`
  MODIFY `tid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `bid` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `views`
--
ALTER TABLE `views`
  MODIFY `vid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
