<?php
class lists extends db{

	public function init(){
		$this->check_lang($lang);
		$input=base::load_class('input');
		$formid=isset($_GET['formid'])?intval($_GET['formid']):0;
		$form_arr=base::load_cache("cache_form","_form");
		$form=get_array($form_arr,'id',$formid,0);
		$language=isset($_GET['l'])?(int)$_GET['l']:1;
		$lang_arr=get_lang($language);
		
		$field=base::load_cache("cache_form_".$form[0]['form_table'],"_field");
		$fields="";
		if(is_array($field)){
			foreach($field as $value){
				$fields.="<tr>\n";
				$fields.="<td align=\"right\">".$value['name']."：</td>\n";
				$fields.="<td>".$input->$value['formtype']($value['field'],'',$value['width'],$value['height'],$value['initial'])." ".$value['explain']."</td>\n";
				$fields.="</tr>\n";
			}
			
			//是否显示验证码
			if($form['0']['is_code']==1){
				$fields.="<tr>\n";
				$fields.="<td align=\"right\">验证码：</td>\n";
				$fields.="<td><input type=\"text\" name=\"verifycode\" id=\"verifycode\" class=\"txt\" /><img src=\"admin/verifycode.php\" border=\"0\" alt=\"验证码,看不清楚?请点击刷新验证码\" onClick=\"this.src=this.src+'?'+Math.random();\" class=\"codeimage\"/></td>\n";
				$fields.="</tr>\n";
			}
		}
		
		if($lang_arr['dir']){
			$dir=$lang_arr['dir']."/";
		}

		assign("form",$form[0]);
		assign("fields",$fields);
		assign('menu',get_menu(0,1,$language));
		template($dir."form_list");
	}
	
	public function add_save(){
		$formid=safe_html($_GET['formid']);
		$form_arr=base::load_cache("cache_form","_form");
		$form=get_array($form_arr,'id',$formid,0);
		$fields=$_POST['fields'];
		$verifycode=$_POST['verifycode'];
		
		//验证码
		if($form['0']['is_code']==1 && $verifycode!=$_SESSION['code']){
			showmsg(C('verifycode_error'),'-1');
		}
		
		if(empty($fields['title'])||empty($formid)){
			showmsg(C('material_not_complete'),'-1');
		}

		$form=formtable($formid);
		if(empty($form)){
			showmsg(C('error'),'-1');
		}
		
		$table=$this->mysql->show_table();   //判断数据表是否存在
		if(!in_array(DB_PRE.$form,$table)){
			showmsg(C('table_not_exist'),'-1');
		}
	

		//添加附加表
		$sql_fields='`inputtime`';
		$sql_value=datetime();
		$send_text='留言内容：<br>';
		$send_text2='';
		foreach($fields as $key=>$value){
			if($key=='zhuanmail'){
			$sql_fields.=",`".safe_replace($key)."`";
			$value2='';
			if(is_array($value)){
				$value_arr='';
				foreach($value as $k=>$v){
					$value_arr.=$v.',';
					
				}
				$value=$value_arr;  
				
				
			}
			$b= (strpos($value,":"));
			$value2=substr($value,$b+1); 
			$sql_value.=",\"".safe_replace(safe_html($value2))."\"";
			$send_text2=safe_replace(safe_html($value2));  //正则
			}else{
				$sql_fields.=",`".safe_replace($key)."`";
				if(is_array($value)){
					$value_arr='';
					foreach($value as $k=>$v){
						$value_arr.=$v.',';
						
					}
					$value=$value_arr;
			}
			$sql_value.=",\"".safe_replace(safe_html($value))."\"";
			
			switch ($key){
				case "title":
					$send_text.=safe_replace(safe_html("标题"))."<br>";
					$send_text.=safe_replace(safe_html($value))."<br>";
					break;
				case "truename":
					$send_text.=safe_replace(safe_html("姓名"))."<br>";
					$send_text.=safe_replace(safe_html($value))."<br>";
					break;
				case "age":
					$send_text.=safe_replace(safe_html("年龄"))."<br>";
					$send_text.=safe_replace(safe_html($value))."<br>";
					break;
				case "telephone":
					$send_text.=safe_replace(safe_html("联系电话"))."<br>";
					$send_text.=safe_replace(safe_html($value))."<br>";
					break;
				case "address":
					$send_text.=safe_replace(safe_html("目前所在地"))."<br>";
					$send_text.=safe_replace(safe_html($value))."<br>";
					break;
				case "school":
					$send_text.=safe_replace(safe_html("咨询问题"))."<br>";
					$send_text.=safe_replace(safe_html($value))."<br>";
					break;
				case "work":
					$send_text.=safe_replace(safe_html("过程简述"))."<br>";
					$send_text.=safe_replace(safe_html($value))."<br>";
					break;
				case "question":
					$send_text.=safe_replace(safe_html("咨询问题"))."<br>";
					$send_text.=safe_replace(safe_html($value))."<br>";
					break;
				case "sketch":
					$send_text.=safe_replace(safe_html("过程简述"))."<br>";
					$send_text.=safe_replace(safe_html($value))."<br>";
					break;
			}
			
			//$send_text.=safe_replace(safe_html($key))."<br>";
			//$send_text.=safe_replace(safe_html($value))."<br>";
			
			
			
			}
		}
		
		$this->mysql->query("insert into ".DB_PRE.$form."({$sql_fields}) values ({$sql_value})");
		$rs=$this->mysql->get_one("select * from ".DB_PRE."form where id=".$formid);
		if($rs['is_email']==1){
			sendmail('有人给您留言了！',$send_text,$send_text2);
		}
		showmsg(C('add_success'),'-1');

	}
}
?>