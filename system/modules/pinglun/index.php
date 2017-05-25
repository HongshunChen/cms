<?php
class index extends db{

	
	public function add(){
		$parentid=intval($_GET['contentid']);
		$name=safe_html($_POST['name']);
		$title=$_POST['title'];
		$content=safe_html($_POST['content']);
		$inputtime=datetime();
		$is_lock="1"; // is_lock 值=0已审核 1未审核��
		if(empty($name)||empty($content)){
			showmsg(C('material_not_complete'),'-1');
		}
		
		$sql="insert into ".DB_PRE."pinglun(parentid,name,title,content,inputtime,is_lock) values('$parentid','$name','$title','$content','$inputtime','$is_lock')";
		$this->mysql->query($sql);
		echo "<script type='text/javascript'> alert('评论成功，请等待审核！');history.back();</script>";
				 
	}

} 
?>
