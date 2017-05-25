<?php
class admin extends Checklogin{

	public function init(){
		template('pinglun_list','admin/pinglun');
	}
	
	public function lock(){
		$id=isset($_GET['id'])?intval($_GET['id']):0;
		$lockid=isset($_GET['lockid'])?intval($_GET['lockid']):0;
		$this->mysql->db_update('pinglun','`is_lock`='.$lockid,'`id`='.$id);
		showmsg(C('update_success'),'-1');
	}
	
	public function edit(){
		$id=isset($_GET['id'])?intval($_GET['id']):0;
		$rs=$this->mysql->get_one('select * from '.DB_PRE.'pinglun where `id`='.$id);
		assign('rs',$rs);
		template('pinglun_edit','admin/pinglun');
	}
	
	public function editsave(){
		$id=isset($_POST['id'])?intval($_POST['id']):0;
		$name=safe_html($_POST['name']);
		$content=safe_html($_POST['content']);
		if(empty($name)||empty($id)){
			showmsg(C('material_not_complete'),'-1');
		}
		$this->mysql->db_update('pinglun',"`name`='".$name."',`content`='".$content."'",'`id`='.$id);
		showmsg(C('update_success'),'-1');
	}
	
	
	public function delete(){
		$id=isset($_GET['id'])?intval($_GET['id']):0;
		$this->mysql->db_delete('pinglun','`id`='.$id);
		showmsg(C('delete_success'),'-1');
	}
}

?>