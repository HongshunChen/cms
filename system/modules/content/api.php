<?php
class api extends db{	
	
	public function init($lang=''){
		$dir=$this->check_lang($lang);
		template($dir."index");
	}
        public function getWiningInfo(){
               $phone=isset($_GET['phone']) ? safe_html($_GET['phone']):'';
               $couponsn= isset($_GET['couponsn']) ? safe_html($_GET['couponsn']) :'';
               $where='where couponstatus=1 ';
              if(!empty($phone) && empty($couponsn)) {
                  $where .="and user_phone='{$phone}'  ";
                  
                }elseif (empty ($phone) && !empty($couponsn)) {
                      $where .="and couponsn='{$couponsn}'";
                }elseif (!empty ($phone) && !empty($couponsn)){
                     $where .="and user_phone='{$phone}' and couponsn='{$couponsn}'";
                }
               $sql="select pwd_phone,couponsn,c_jiang_name,use_time from c_coupon  {$where}";
              
               $res=$this->mysql->fetch_asc_deal($sql);
              //$res= $this->mysql->get_one($sql);
               echo json_encode($res);
        }
	
}
?>