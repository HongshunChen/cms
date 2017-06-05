<?php
class linktype extends Checklogin{

	public function init(){
		template('linktype_list','admin/link');
	}
	
	public function lock(){
		$id=isset($_GET['id'])?intval($_GET['id']):0;
		$lockid=isset($_GET['lockid'])?intval($_GET['lockid']):0;
		$this->mysql->db_update('link_type','`is_lock`='.$lockid,'`id`='.$id);
		showmsg(C('update_success'),'-1');
	}
	
	public function edit(){
		$id=isset($_GET['id'])?intval($_GET['id']):0;
		$rs=$this->mysql->get_one('select * from '.DB_PRE.'link_type where `id`='.$id);
		assign('rs',$rs);
		template('linktype_edit','admin/link');
	}
	
	public function editsave(){
		$id=isset($_POST['id'])?intval($_POST['id']):0;
		$title=safe_html($_POST['title']);
		if(empty($title)||empty($id)){
			showmsg(C('material_not_complete'),'-1');
		}
		$this->mysql->db_update('link_type',"`title`='".$title."'",'`id`='.$id);
		showmsg(C('update_success'),'-1');
	}
	
	public function add(){
		template('linktype_add','admin/link');
	}
	
	public function addsave(){
		$title=safe_html($_POST['title']);
                
		
		if(empty($title)){
			showmsg(C('material_not_complete'),'-1');
		}
		$this->mysql->db_insert('link_type',"`title`='".$title."',`inputtime`='".datetime()."',`is_lock`=0");
		showmsg(C('add_success'),'index.php?m=link&c=linktype');
	}
	
	public function delete(){
		$id=isset($_GET['id'])?intval($_GET['id']):0;
		$this->mysql->db_delete('link_type','`id`='.$id);
		showmsg(C('delete_success'),'-1');
	}
}

?>