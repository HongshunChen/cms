<?php
class admin extends Checklogin{

	public function init(){
		template('link_list','admin/link');
	}
	
	public function lock(){
		$id=isset($_GET['id'])?intval($_GET['id']):0;
		$lockid=isset($_GET['lockid'])?intval($_GET['lockid']):0;
		$this->mysql->db_update('link','`is_lock`='.$lockid,'`id`='.$id);
		showmsg(C('update_success'),'-1');
	}
	
	public function edit(){
		$id=isset($_GET['id'])?intval($_GET['id']):0;
		$rs=$this->mysql->get_one('select * from '.DB_PRE.'link where `id`='.$id);
		assign('rs',$rs);
		template('link_edit','admin/link');
	}
	
	public function editsave(){
		$id=isset($_POST['id'])?intval($_POST['id']):0;
		$title=safe_html($_POST['title']);
                $typeid=isset($_POST['typeid'])?intval($_POST['typeid']):0;
		$url=safe_html($_POST['url']);
		if(empty($title)||empty($url)||empty($id)){
			showmsg(C('material_not_complete'),'-1');
		}
		$this->mysql->db_update('link',"`title`='".$title."',`typeid`={$typeid},`url`='".$url."'",'`id`='.$id);
		showmsg(C('update_success'),'-1');
	}
	
	public function add(){
		template('link_add','admin/link');
	}
	
	public function addsave(){
		$title=safe_html($_POST['title']);
                $typeid=isset($_POST['typeid'])?intval($_POST['typeid']):0;
		$url=safe_html($_POST['url']);
             
		if(empty($title)||empty($url)||empty($typeid)){
			showmsg(C('material_not_complete'),'-1');
		}
		$this->mysql->db_insert('link',"`title`='".$title."',`url`='".$url."',`typeid`={$typeid},`inputtime`='".datetime()."',`is_lock`=0");
		showmsg(C('add_success'),'index.php?m=link&c=admin');
	}
	
	public function delete(){
		$id=isset($_GET['id'])?intval($_GET['id']):0;
		$this->mysql->db_delete('link','`id`='.$id);
		showmsg(C('delete_success'),'-1');
	}
}

?>