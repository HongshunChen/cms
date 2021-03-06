<?php
@set_time_limit(0);
error_reporting(E_ALL || ~E_NOTICE);
$ver = ' V3.0.1';
$lang = 'utf-8';
$dfdbname = 'xdcms';
$errmsg = '';
$insLockfile = dirname(__FILE__).'/install_lock.txt';
define('CMS_ROOT',ereg_replace("[\\/]install",'',dirname(__FILE__)));
define('CMS_DATA',CMS_ROOT.'/data/');
header("Content-Type: text/html; charset={$lang}");
foreach(Array('_GET','_POST','_COOKIE') as $_request){
	foreach($$_request as $_k => $_v) ${$_k} = _runmagicquotes($_v);
}
function _runmagicquotes(&$svar){
	if(!get_magic_quotes_gpc()){
		if( is_array($svar) ){
			foreach($svar as $_k => $_v) $svar[$_k] = _runmagicquotes($_v);
		}else{
			$svar = addslashes($svar);
		}
	}
	return $svar;
}
if(file_exists($insLockfile)){
	exit(" 程序已运行安装，如果你确定要重新安装，请先从FTP中删除 install/install_lock.txt！");
}
//
if(empty($step)){$step = 1;}
//第一步：使用协议书
if($step==1){
	include('./templates/step-1.html');
	exit();
}
//第二步：环境测试
else if($step==2){
    $phpv = phpversion();
    $sp_os = @getenv('OS');
    $sp_gd = gdversion();
    $sp_server = $_SERVER['SERVER_SOFTWARE'];
    $sp_host = (empty($_SERVER['REMOTE_ADDR']) ? $_SERVER['REMOTE_HOST'] : $_SERVER['REMOTE_ADDR']);
    $sp_name = $_SERVER['SERVER_NAME'];
    $sp_max_execution_time = ini_get('max_execution_time');
    $sp_allow_reference = (ini_get('allow_call_time_pass_reference') ? '<font color=green>[√]On</font>' : '<font color=red>[×]Off</font>');
    $sp_allow_url_fopen = (ini_get('allow_url_fopen') ? '<font color=green>[√]On</font>' : '<font color=red>[×]Off</font>');
    $sp_safe_mode = (ini_get('safe_mode') ? '<font color=red>[×]On</font>' : '<font color=green>[√]Off</font>');
    $sp_gd = ($sp_gd>0 ? '<font color=green>[√]On</font>' : '<font color=red>[×]Off</font>');
    $sp_mysql = (function_exists('mysql_connect') ? '<font color=green>[√]On</font>' : '<font color=red>[×]Off</font>');

   if($sp_mysql=='<font color=red>[×]Off</font>'){
   		$sp_mysql_err = true;
   }else{
   		$sp_mysql_err = false;
   }
   $sp_testdirs = array(
        '/',
   		'/cache/*',
        '/data/*',
        '/system/*',
        '/uploadfile/*',   
   );
	 include('./templates/step-2.html');
	 exit();
}
//第三步：设置参数
else if($step==3){
  if(!empty($_SERVER['REQUEST_URI'])){
  	$scriptName = $_SERVER['REQUEST_URI'];
  }else{
  	$scriptName = $_SERVER['PHP_SELF'];
  }
  $path = eregi_replace('/install(.*)$','',$scriptName);
  if(!empty($_SERVER['HTTP_HOST'])){
  	$siteurl = 'http://'.$_SERVER['HTTP_HOST'];
  }else{
  	$siteurl = "http://".$_SERVER['SERVER_NAME'];
  }
  $rnd_cookieEncode = chr(mt_rand(ord('A'),ord('Z'))).chr(mt_rand(ord('a'),ord('z'))).chr(mt_rand(ord('A'),ord('Z'))).chr(mt_rand(ord('A'),ord('Z'))).chr(mt_rand(ord('a'),ord('z'))).mt_rand(1000,9999).chr(mt_rand(ord('A'),ord('Z')));
  include('./templates/step-3.html');
	exit();
}
//第四步：安装数据库
else if($step==4){
  $conn = mysql_connect($dbhost,$dbuser,$dbpwd) or die("<script>alert('数据库服务器或登录密码无效，\\n\\n无法连接数据库，请返回重新设定！');history.go(-1);</script>");
  mysql_query("CREATE DATABASE IF NOT EXISTS `".$dbname."`;",$conn);	
  mysql_select_db($dbname) or die("<script>alert('数据库访问失败，可能是你没权限，安装前请预先创建一个数据库，别设置有效的登录密码！');history.go(-1);</script>");
//  获得数据库版本信息
  $rsver = mysql_query("SELECT VERSION();",$conn);
  $row = mysql_fetch_array($rsver);
  $mysql_versions = explode('.',trim($row[0]));
  $mysql_version = $mysql_versions[0].".".$mysql_versions[1];
  mysql_query("SET NAMES '$dblang',character_set_client=binary,sql_mode='';",$conn);
  $configStr = file_get_contents(dirname(__FILE__)."/config.inc.php");

  if($path!=''){
    if(substr($path,-1)!="/") $path=$path.'/';
    if(substr($path,0,1)!="/") $path='/'.$path;
  }else{
    $path="/";
  }
    $configStr = str_replace("#db_host",$dbhost,$configStr);
    $configStr = str_replace("#db_name",$dbname,$configStr);
    $configStr = str_replace("#db_user",$dbuser,$configStr);
    $configStr = str_replace("#db_pass",$dbpwd,$configStr);
    $configStr = str_replace("#tb_pre",$dbpre,$configStr);
    $configStr = str_replace("#db_charset",$dblang,$configStr);

    $fp = fopen(CMS_DATA."/config.inc.php","w") or die("<script>alert('写入配置失败，请检查根目录是否可写入！');history.go(-1);</ script>");
    fwrite($fp,$configStr);
    fclose($fp);
    $sqlfile=dirname(__FILE__).'/data.sql';
    $sql = file_get_contents($sqlfile);
	if($testdata=='yes'){
		$testsqlfile=dirname(__FILE__).'/test.sql';
		$sql .= file_get_contents($testsqlfile);
	}
    if($mysql_version > 4.1 && $dblang) {
        $sql = preg_replace("/(TYPE|ENGINE)=(InnoDB|MyISAM)( DEFAULT CHARSET=[^; ]+)?/", "ENGINE=\\2 DEFAULT CHARSET=".$dblang, $sql);
    }
    if($dbpre != 'c_') $sql = str_replace('c_', $dbpre, $sql);
    $sql = str_replace("\r", "\n", $sql);
    $ret = array();
    $num = 0;
    $queriesarray = explode(";\n", trim($sql));
    unset($sql);
    foreach($queriesarray as $query) {
        $ret[$num] = '';
        $queries = explode("\n", trim($query));
        $queries = array_filter($queries);
        foreach($queries as $query) {
            $str1 = substr($query, 0, 1);
            if($str1 != '#' && $str1 != '-') $ret[$num] .= $query;
        }
        $num++;
    }
    $sqls=$ret;
    if(is_array($sqls)){
        foreach($sqls as $sql) {
            if(trim($sql) != '') $rs=mysql_query($sql,$conn);
        }
    } else {
        $rs=mysql_query($sqls,$conn);
    }
    $adminquery = "INSERT INTO `{$dbpre}admin` (`username`,`password`,`encrypt`,`last_time`,`creat_time`,`groupid`) VALUES ('$adminuser', '".password($adminpwd,'lr24vx2')."','lr24vx2', '".strtotime("now")."', '".strtotime("now")."','1');";
	mysql_query($adminquery,$conn);

//  锁定安装程序
  	$fp = fopen($insLockfile,'w');
  	fwrite($fp,'ok');
  	fclose($fp);
  	include('./templates/step-4.html');
  	exit();
}

function password($password, $encrypt) {
	$pwd = array();
	$password_md5=md5(trim($password));
	$nums=strlen($password_md5) - strlen($encrypt);
	$pwd = md5(substr_replace($password_md5,$encrypt,$nums));
	return $pwd;
}

function gdversion(){
  if(!function_exists('phpinfo')){
  	if(function_exists('imagecreate')) return '2.0';
  	else return 0;
  }else{
    ob_start();
    phpinfo(8);
    $module_info = ob_get_contents();
    ob_end_clean();
    if(preg_match("/\bgd\s+version\b[^\d\n\r]+?([\d\.]+)/i", $module_info,$matches)) {   $gdversion_h = $matches[1];  }
    else {  $gdversion_h = 0; }
    return $gdversion_h;
  }
}
function testwrite($d){
	$tfile = '_test.txt';
	$d = ereg_replace('/$','',$d);
	$fp = @fopen($d.'/'.$tfile,'w');
	if(!$fp) return false;
	else
	{
		fclose($fp);
		$rs = @unlink($d.'/'.$tfile);
		if($rs) return true;
		else return false;
	}
}
?>
