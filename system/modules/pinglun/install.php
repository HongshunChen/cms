<?php
class install extends Checklogin{

	public function init(){
$this->mysql->query("CREATE TABLE IF NOT EXISTS `".DB_PRE."pinglun` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `parentid` int(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `content` text NOT NULL,
  `inputtime` varchar(35) NOT NULL,
  `is_lock` tinyint(1) unsigned NOT NULL default '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;");


		$this->mysql->db_insert("menu","`parentid`=4,`title`='评论管理',`url`='###',`sort`=0,`is_show`=1");
		$pid=$this->mysql->insert_id();
		$this->mysql->db_insert("menu","`parentid`=".$pid.",`title`='管理评论',`url`='index.php?m=pinglun&c=admin',`sort`=0,`is_show`=1");
		
		$text="ok";
		$file=MOD_PATH."pinglun/install_ok.txt";
		creat_inc($file,$text);
		showmsg(C('success_update_cache'),'-1');
	}
	
	public function uninstall(){
		$this->mysql->del_table("pinglun");  //删除数据
		$this->mysql->db_delete("menu","`title`='评论管理'");
		$this->mysql->db_delete("menu","`title`='管理评论'");
		
		$ok=MOD_PATH."pinglun/install_ok.txt";
		if(file_exists($ok)){   //删除install_ok
			unlink($ok);
		}
		showmsg(C('success_update_cache'),'-1');
	}

}

?>