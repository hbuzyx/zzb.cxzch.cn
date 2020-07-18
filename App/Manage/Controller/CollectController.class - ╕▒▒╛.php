<?php

namespace Manage\Controller;
use Common\Lib\Category;

class CollectController extends CommonController
{

    public function index(){
		$keyword = I('keyword', '', 'htmlspecialchars,trim'); //关键字

        $where = array();
        if (!empty($keyword)) {
            $where['title'] = array('LIKE', "%{$keyword}%");
        }

        $count = M('collect')->where($where)->count();

        $page           = new \Common\Lib\Page($count, 10);
        $page->rollPage = 7;
        $page->setConfig('theme', '%HEADER% %FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END%');
        $limit = $page->firstRow . ',' . $page->listRows;
        $list  = M('collect')->where($where)->order('id DESC')->limit($limit)->select();
		//dump($list);
		
        $this->assign('page', $page->show());
        $this->assign('vlist', $list);
        $this->assign('type', '采集规则列表');
        $this->assign('keyword', $keyword);
		$this->display();
	}
	
	//添加
    public function add(){
        //当前控制器名称
        $actionName = strtolower(CONTROLLER_NAME);
        if (IS_POST) {
            $data = I('post.', '');
			$data['title'] = trim($data['title']);
			$data['url']  = trim($data['url']);
			$data['listpreg'] = $_POST['listpreg'];
			$data['listapreg'] = $_POST['listapreg'];
			$data['titlepreg'] = $_POST['titlepreg'];
			$data['keypreg'] = $_POST['keypreg'];
			$data['contentpreg'] = $_POST['contentpreg'];
			$data['picpreg'] = $_POST['picpreg'];
			$data['cid'] = I('cid', 0, 'intval');
			$data['posttime'] = time();
			if (empty($data['title']) || empty($data['url'])) {
				$this->error('网站名称或网址不能为空');
			}
			if ($id = M('collect')->add($data)) {
				$this->success('添加成功', U('index'));
			} else {
				$this->error('添加失败');
			}
            exit();
        }
		$cate = M('category')->order('sort')->select();
        $cate = Category::toLevel($cate, '---', 0);
		$this->assign('cate', $cate);
        $this->display();
    }

    //编辑
    public function edit(){
        //当前控制器名称
        $id = I('id', 0, 'intval');
        $actionName = strtolower(CONTROLLER_NAME);
        if (IS_POST) {
            $data = I('post.');
			$data['title'] = trim($data['title']);
			$data['url']  = trim($data['url']);
			$data['listpreg'] = $_POST['listpreg'];
			$data['listapreg'] = $_POST['listapreg'];
			$data['titlepreg'] = $_POST['titlepreg'];
			$data['keypreg'] = $_POST['keypreg'];
			$data['contentpreg'] = $_POST['contentpreg'];
			$data['picpreg'] = $_POST['picpreg'];
			$data['cid'] = I('cid', 0, 'intval');
			$id = $data['id'] = I('id', 0, 'intval');
			$data['posttime'] = time();
			
			if (empty($data['title']) || empty($data['url'])) {
				$this->error('网站名称或网址不能为空');
			}
	
			if (false !== M('collect')->save($data)) {
				$this->success('修改成功', U('index'));
			} else {
	
				$this->error('修改失败');
			}
            exit();
        }
        $vo = M($actionName)->find($id);
		//dump($vo);
		$cate = M('category')->order('sort')->select();
        $cate = Category::toLevel($cate, '---', 0);
		$this->assign('cate', $cate);
        $this->assign('vo', $vo);
        $this->display();
    }
	
	//单页采集
	public function page(){
		header("Content-Type:text/html; charset=utf-8");
        $config_page = require_once './page.config.php';
        if (IS_POST) {
			if (empty($_POST['url'])) {
				$this->error('网址不能为空');
			}
            $settingstr="<?php \n return array(\n";
			foreach($_POST as $key=>$v){
				$settingstr.= "\t'".$key."'=>'".$v."',\n";
			}
			$settingstr.=");\n?>\n";
			$status = file_put_contents('./page.config.php',$settingstr); //通过file_put_contents保存setting.config.php文件；
			
			if ($status) {
				$this->success('修改成功');
			} else {
				$this->error('修改失败');
			}
            exit();
        }
		//dump($vo);
		$cate = M('category')->order('sort')->select();
        $cate = Category::toLevel($cate, '---', 0);
		$this->assign('cate', $cate);
        $this->assign('vo', $config_page);
        $this->display();
    }

    //彻底删除
    public function del()
    {

        $id        = I('id', 0, 'intval');
        $batchFlag = I('get.batchFlag', 0, 'intval');
        //批量删除
        if ($batchFlag) {
            $this->delBatch();
            return;
        }

        if (M('collect')->delete($id)) {
            $this->success('彻底删除成功', U('Collect/index'));
        } else {
            $this->error('彻底删除失败');
        }
    }

    //批量彻底删除
    public function delBatch()
    {

        $idArr = I('key', 0, 'intval');
        if (!is_array($idArr)) {
            $this->error('请选择要彻底删除的项');
        }
        $where = array('id' => array('in', $idArr));

        if (M('collect')->where($where)->delete()) {
            $this->success('彻底删除成功', U('Collect/index'));
        } else {
            $this->error('彻底删除失败');
        }
    }
	
	public function caiji(){
		set_time_limit(3600);
		$id = I('id', 0, 'intval');
		if(!$id){
			exit('参数错误！');
		}
		$res = M('Collect')->where("id=$id")->find();
		
		//得到最高的页数和现在的页数
		$first_page = !empty($res['firstpage']) ? intval($res['firstpage']) : 1;
		$last_page = !empty($res['lastpage']) ? intval($res['lastpage']) : 1;
		$cid = intval($res['cid']);
		
		//开始采集，获取列表
		for($now_page = $first_page; $now_page <= $last_page; $now_page++){
			if($now_page == 1){
				$now_url = $res['listurl'];
			}else{
				if($res['page']){
					$now_url = $res['listurl'].$res['page'].$now_page;
				}else{
					$now_url = $res['listurl'].$now_page;
				}
				if($res['ext']){
					$now_url = $now_url.$res['ext'];
				}
			}
			
			if(function_exists('curl_init')){
				$ip = $this->get_baiduip();
				$ua = $this->get_ua();
				/*echo $ip.'<br>';
				echo $ua.'<br>';
				exit;*/
				$ch = curl_init($now_url);
				curl_setopt($ch,CURLOPT_HEADER,0);
				curl_setopt($ch,CURLOPT_TIMEOUT,30); //设置超时限制防止死循环
				curl_setopt($ch,CURLOPT_REFERER, 'http://www.baidu.com/');//伪装一个来路
				curl_setopt($ch,CURLOPT_HTTPHEADER, array('X-FORWARDED-FOR: '.$ip.'', 'CLIENT-IP: '.$ip.'')); //伪装百度蜘蛛ip地址
				//curl_setopt($ch,CURLOPT_USERAGENT, "Baiduspider+(+http://www.baidu.com/search/spider.htm)");
				curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);
				//curl_setopt($ch,CURLOPT_FOLLOWLOCATION,1); //抓取转跳
				curl_setopt($ch,CURLOPT_BINARYTRANSFER,true) ;
				curl_setopt($ch,CURLOPT_ENCODING,'gzip,deflate'); //gzip解压
				curl_setopt($ch,CURLOPT_USERAGENT,$ua);
				$list_content = curl_exec($ch);
				$list_content=iconv("GBK", "UTF-8", $list_content);
				
				curl_close($ch);
			}elseif(function_exists('file_get_contents')){
				$list_content = file_get_contents($now_url);
			}else{
				exit('您的服务器同时不支持“Curl组件”和“file_get_contents方法”，无法开始采集！');
			}
			
			if(!empty($list_content)){
				//获取列表页url列表
				preg_match($res['listpreg'],$list_content,$list_url);
				preg_match_all($res['listapreg'],$list_url[1],$urls);
				
				if(!empty($urls[1])){
					foreach($urls[1] as $k=>$url){
						//抓取详情页
						if(!strstr($url,'http://')){
							$url = $res['url'].$url;
						}
						$ip1 = $this->get_baiduip();
						$ua1 = $this->get_ua();
						$curl = curl_init($url);
						curl_setopt($curl,CURLOPT_HEADER,0);
						curl_setopt($curl,CURLOPT_TIMEOUT,30); //设置超时限制防止死循环
						curl_setopt($curl,CURLOPT_REFERER, 'http://www.baidu.com/');//伪装一个来路
						curl_setopt($curl,CURLOPT_HTTPHEADER, array('X-FORWARDED-FOR: '.$ip1.'', 'CLIENT-IP: '.$ip1.'')); //伪装百度蜘蛛ip地址
						//curl_setopt($curl,CURLOPT_USERAGENT, "Baiduspider+(+http://www.baidu.com/search/spider.htm)");
						curl_setopt($curl,CURLOPT_RETURNTRANSFER,1);
						curl_setopt($curl,CURLOPT_BINARYTRANSFER,true) ;
						curl_setopt($curl,CURLOPT_ENCODING,'gzip,deflate'); //gzip解压
						curl_setopt($curl,CURLOPT_USERAGENT,$ua1);
						$content = curl_exec($curl);
						$content=iconv("GBK", "UTF-8", $content);  //把采集到的内容转换为utf-8格式，否则乱码
						curl_close($curl);
						
						if(!empty($content)){
							//提取文章标题
							preg_match($res['titlepreg'],$content,$title);
							$data['title'] = strip_tags($title[1]);
							//dump($content);
							//exit;
							//提取关键词
							if($res['keypreg']){
								preg_match($res['keypreg'],$content,$keywords);
								$data['keywords'] = $keywords[4];
								if($data['keywords']){
									$data['tag'] = $data['keywords'];
								}
							}
							//提取文章正文内容
							preg_match($res['contentpreg'],$content,$info);
							$context = strip_tags($info[4],'<img>');
							if(!$context){
								$context = $data['title'];
							}
							$data['content'] = $context;
							$data['cid'] = $cid;
							//判断是否为重复内容，如果重复就不保存
							$map['title'] = $data['title'];
							$rs = M('temp')->where($map)->find();
							if(!$rs && $data['title']){
								if($res['picpreg']){
									$p = 1; //分页从1开始
									$tmpurl = str_replace($res['ext'],'',$url);
									$picurls = $this->get_picurls($tmpurl, $res['picpage'], $p, $res['ext'], $res['picpreg']);
									/*dump($picurls);
									exit;*/
									$root_path = C('CFG_UPLOAD_ROOTPATH');
									$save_path = 'img1/'.date('Ymd').'/';
									//$path = $root_path . $save_path;
									foreach($picurls as $key=>$purl){
										//下载大图
										$bigpic = $this->download_pic($purl,$root_path,$save_path,1);
										$img = array();
										$img[$k] = $bigpic;
										if(file_exists($bigpic['filepath'])){
											$yun_upload    = new \Common\Lib\YunUpload(1);
											$result = $yun_upload->dopic($img);
											$data['pic'][$key] = $result[0];
											$data['picarry'][$key] = $result[0]['url'].'$$$'.$data['title'];
										}else{
											echo '图片'.$bigpic['filepath'].'不存在！<br/>';
										}
									}
									$data['litpic'] = $data['pic'][0]['turl'];
									$data['pictureurls'] = implode('|||',$data['picarry']);
								}
								if($data['title']){
									$this->add_content($data);
									//清空数组，否则会出现累计情况
									$data = array();
								}
								
							}
						}else{
							/*$interval = 5;
							sleep($interval);
							$this->reget_content($url,$res);*/
							echo $url.' 抓取出错！<br/>';
						}
						
						
					}
				}
				echo $now_url.' 采集完成！<br/>';
			}else{
				echo $now_url.' 未获取到内容！<br/>';
				echo '<a href="'.U('Collect/caiji?id='.$id).'">重新采集</a><br/>';
			}
		
		}
		
		echo '<a href="'.U('Temp/index').'">查看采集到的文章</a>';
		//$this->success('采集完成！', U('index'));
	}
	
	public function get_picurls($tmpurl, $picpage, $p, $ext, $picpreg){
		set_time_limit(3600);
		$picurls = array();
		$status = 1;
		//循环抓取图片url
		do {
			//拼接图片分页url
			if($p == 1){
				$picurl = $tmpurl.$ext;
			}else{
				$picurl = $tmpurl.$picpage.$p.$ext;
			}
			$ip = $this->get_baiduip();
			$ua = $this->get_ua();
			$curl = curl_init($picurl);
			curl_setopt($curl,CURLOPT_HEADER,0);
			curl_setopt($curl,CURLOPT_TIMEOUT,30); //设置超时限制防止死循环
			curl_setopt($curl,CURLOPT_REFERER, 'http://www.baidu.com/');//伪装一个来路
			curl_setopt($curl,CURLOPT_HTTPHEADER, array('X-FORWARDED-FOR: '.$ip.'', 'CLIENT-IP: '.$ip.'')); //伪装百度蜘蛛ip地址
			//curl_setopt($curl,CURLOPT_USERAGENT, "Baiduspider+(+http://www.baidu.com/search/spider.htm)");
			curl_setopt($curl,CURLOPT_RETURNTRANSFER,1);
			curl_setopt($curl,CURLOPT_BINARYTRANSFER,true) ;
			curl_setopt($curl,CURLOPT_ENCODING,'gzip,deflate'); //gzip解压
			curl_setopt($curl,CURLOPT_USERAGENT,$ua);
			$content = curl_exec($curl);
			$content=iconv("GBK", "UTF-8", $content);  //把采集到的内容转换为utf-8格式，否则乱码
			curl_close($curl);
			if(!empty($content)){
				//提取图片url
				preg_match($picpreg,$content,$pic);
				if($pic){
					$pattern="/<img.*?src=[\'|\"](.*?(?:[\.gif|\.jpg|\.png]))[\'|\"].*?[\/]?>/";
					preg_match($pattern,$pic[1],$match);
					$picurls[] = $match[1];
				}else{
					$status = 0;
				}
			}else{
				$status = 0;
			}
			$p++;
		} while ($status==1);
		return $picurls;
	}
	
	public function get_baiduip(){
		$iplist = array("123.125.68.5","220.181.68.155","220.181.7.3","121.14.89.22","203.208.60.88","210.72.225.56","125.90.88.73","220.181.108.95","220.181.108.92","123.125.71.106");
		$i = array_rand($iplist,1);
		return $iplist[$i];
	}
	
	public function get_ua(){
		$ualist = array("Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322; .NET CLR 2.0.50727)",
						"Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; Trident/4.0)",
						"Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0)",
						"Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0)",
						"Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Win64; x64; Trident/4.0)",
						"Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0)",
						"Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_8; en-us) AppleWebKit/534.50 (KHTML, like Gecko) Version/5.1 Safari/534.50",
						"Mozilla/5.0 (Windows; U; Windows NT 6.1; en-us) AppleWebKit/534.50 (KHTML, like Gecko) Version/5.1 Safari/534.50",
						"Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0",
						"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:2.0.1) Gecko/20100101 Firefox/4.0.1",
						"Baiduspider+(+http://www.baidu.com/search/spider.htm)");
		$i = array_rand($ualist,1);
		return $ualist[$i];
	}
	
	public function get_content(){
		//抓取详情页
		$url = $_POST['url'];
		$ip = $this->get_baiduip();
		$ua = $this->get_ua();
		$curl = curl_init($url);
		curl_setopt($curl,CURLOPT_HEADER,0);
		curl_setopt($curl,CURLOPT_TIMEOUT,30); //设置超时限制防止死循环
		curl_setopt($curl,CURLOPT_REFERER, 'http://www.baidu.com/');//伪装一个来路
		curl_setopt($curl,CURLOPT_HTTPHEADER, array('X-FORWARDED-FOR: '.$ip.'', 'CLIENT-IP: '.$ip.'')); //伪装百度蜘蛛ip地址
		//curl_setopt($curl,CURLOPT_USERAGENT, "Baiduspider+(+http://www.baidu.com/search/spider.htm)");
		curl_setopt($curl,CURLOPT_RETURNTRANSFER,1);
		curl_setopt($curl,CURLOPT_BINARYTRANSFER,true) ;
		curl_setopt($curl,CURLOPT_ENCODING,'gzip,deflate'); //gzip解压
		curl_setopt($curl,CURLOPT_USERAGENT,$ua);
		$content = curl_exec($curl);
		$content=iconv("GBK", "UTF-8", $content);  //把采集到的内容转换为utf-8格式，否则乱码
		curl_close($curl);
		
		if(!empty($content)){
			//提取标题
			preg_match($_POST['titlepreg'],$content,$title);
			$data['title'] = strip_tags($title[1]);
			/*dump($data['title']);
			exit;*/
			//提取关键词
			if($_POST['keypreg']){
				preg_match($_POST['keypreg'],$content,$keywords);
				$data['keywords'] = $keywords[4];
				if($data['keywords']){
					$data['tag'] = $data['keywords'];
				}
			}
			//提取正文内容
			preg_match($_POST['contentpreg'],$content,$info);
			$context = strip_tags($info[4],'<img>');
			if(!$context){
				$context = $data['title'];
			}
			$data['content'] = $context;
			$data['cid'] = $_POST['cid'];
			//判断是否为重复内容，如果重复就不保存
			$map['title'] = $data['title'];
			$rs = M('temp')->where($map)->find();
			if(!$rs && $data['title']){
				if($_POST['picpreg']){
					$p = 1; //分页从1开始
					$tmpurl = str_replace($_POST['ext'],'',$url);
					$picurls = $this->get_picurls($tmpurl, $_POST['picpage'], $p, $_POST['ext'], $_POST['picpreg']);
					
					$root_path = C('CFG_UPLOAD_ROOTPATH');
					$save_path = 'img1/'.date('Ymd').'/';
					//$path = $root_path . $save_path;
					foreach($picurls as $key=>$purl){
						//下载大图
						$bigpic = $this->download_pic($purl,$root_path,$save_path,1);
						$img = array();
						$img[$k] = $bigpic;
						if(file_exists($bigpic['filepath'])){
							$yun_upload    = new \Common\Lib\YunUpload(1);
							$result = $yun_upload->dopic($img);
							$data['pic'][$key] = $result[0];
							$data['picarry'][$key] = $result[0]['url'].'$$$'.$data['title'];
						}else{
							echo '图片'.$bigpic['filepath'].'不存在！<br/>';
						}
					}
					$data['litpic'] = $data['pic'][0]['turl'];
					$data['pictureurls'] = implode('|||',$data['picarry']);
				}
				$this->add_content($data);
				//清空数组，否则会出现累计情况
				$data = array();
				echo $url.' 采集完成！<br/>';
				echo '<a href="'.U('Temp/index').'">查看采集到的文章</a>';
			}
		}else{
			//exit($url.'抓取出错！');
			echo $url.' 抓取出错！<br/>';
		}
		
	}
	
	protected function add_content($data){
		
		$tablename = 'temp';
		//内容
		$data['userid'] = 1;
		$data['publishtime'] = time();
        $data['updatetime']  = time();
		$data['status']      = 1;
		$data['commentflag']      = 1;
		$data['author']      = '管理员';
		$content = trim(strip_tags($data['content']));
		$data['description'] = str2sub($content, 120);
		if($data['litpic']){
			$data['flag'] = 1;
		}
		
		$cid = $data['cid'];
		$actionName = D('CategoryView')->where("category.id=$cid")->getField('tablename');
		$data['tag'] = trim($data['tag']);
		if($data['tag']){
			$tags = explode(',',$data['tag']);
			/*if(count($tags) > 5){
				$this->error('最多5个标签，用空格分隔！');
			}*/
			if(count($tags) > 0){
				foreach($tags as $k=>$val){
					$mp['tag_name'] = $val;
					$mp['tablename'] = $actionName;
					$rs = M('tag')->where($mp)->find();
					if(!$rs){
						$r['tag_name'] = $val;
						$r['typeid'] = $data['cid'];
						$r['tag_sort'] = 1;
						$r['tag_status'] = 1;
						$r['posttime'] = time();
						$r['tag_click'] = 1;
						$r['tablename'] = $actionName;
						M('tag')->add($r);
					}else{
						$r['tag_click'] = $rs['tag_click']+1;
						$r['tablename'] = $actionName;
						M('tag')->where($mp)->save($r);
						//M('tag')->where($mp)->setInc('tag_click');
					}
				}
			}
		}
		
		$id = M($tablename)->add($data);
		return $id;
	}
	
	public function haha_modify(){
		set_time_limit(180);
		//得到最高的页数和现在跑到的页数
		$now_id = !empty($_REQUEST['now_id']) ? intval($_REQUEST['now_id']) : 1;
		$max_id = intval($_REQUEST['max_id']);
		$cid = intval($_REQUEST['cid']);
		if(!$cid){
			exit('请选择栏目！');
		}
		//开始采集
		if($now_id<=$max_id){
			$now_url = 'http://www.haha.mx/good/day/'.$now_id;
			if(function_exists('curl_init')){
				$ch = curl_init($now_url);
				curl_setopt($ch,CURLOPT_HEADER,0);
				curl_setopt($ch,CURLOPT_TIMEOUT,30); //设置超时限制防止死循环
				curl_setopt($ch,CURLOPT_REFERER, 'http://tieba.baidu.com/');//伪装一个来路
				curl_setopt($ch,CURLOPT_HTTPHEADER, array('X-FORWARDED-FOR: 202.108.11.8', 'CLIENT-IP: 202.108.11.8')); //伪装百度蜘蛛ip地址
				curl_setopt($ch,CURLOPT_USERAGENT, "Baiduspider+(+http://www.baidu.com/search/spider.htm)");
				curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);
				//curl_setopt($ch,CURLOPT_FOLLOWLOCATION,1); //抓取转跳
				curl_setopt($ch,CURLOPT_BINARYTRANSFER,true) ;
				curl_setopt($ch,CURLOPT_ENCODING,'gzip,deflate'); //gzip解压
				curl_setopt($ch,CURLOPT_USERAGENT,"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322; .NET CLR 2.0.50727)");
				$content = curl_exec($ch);
				curl_close($ch);
			}elseif(function_exists('file_get_contents')){
				$content = file_get_contents($now_url);
			}else{
				exit('您的服务器同时不支持“Curl组件”和“file_get_contents方法”，无法开始采集！');
			}
			if(!empty($content)){
				preg_match_all('/<div class=\"joke-main-content clearfix\">([\s\S]+)<\/div>/U',$content,$joke);
				
				if(!empty($joke[1])){
					foreach($joke[1] as $value){
						
						if(strrpos($value,'class="joke-main-img"') === false){
							preg_match('|<p class=\"word-wrap joke-main-content-text\">([\s\S]+)</p>|',$value,$content);
							
							if(!empty($content[1])){
								$content = str_replace("\n",'',$content[1]);
								$this->add_article($content,'',$cid);
							}
						}else{
							if(!empty($value)){
								$content = str_replace("\n",'',$value);
								$content = strip_tags($content,'<img>');
								//preg_match('/<img.+src=\"?(.+\.(jpg|gif|bmp|bnp|png))\"?.+>/i',$content,$match);
								$pattern="/<img.*?src=[\'|\"](.*?(?:[\.gif|\.jpg|\.png]))[\'|\"].*?[\/]?>/";
								preg_match_all($pattern,$content,$match);
								$path = './uploads/img1/'.date('Ymd');
								if($match[1]){
									$litpics = array();
									foreach($match[1] as $key=>$url){
										$img_src = str_replace('small','big',$url);
										//下载大图
										$bigpic = $this->download_pic($img_src,$path,'',1);
										$big_path = $bigpic['save_path'];
										$big_path = substr($big_path,1);
										$litpics[$key] = $big_path;
										
										$content = str_replace($url, $big_path, $content);
									}
								}
								$ext=strrchr($litpics[0],'.'); 
								if($ext == '.gif'){ 
									$litpic = $litpics[0];
								}else{
									//生成缩略图
									$imginfo = $this->thumb_img('.'.$litpics[0], 300, $path, false);
									$litpic = substr($imginfo,1);
								}
								$this->add_article($content,$litpic,$cid);
							}
							
						}
					}
					echo 'http://www.haha.mx/good/day/'.$now_id.' 采集完毕！';
					echo '<script>window.location="'.U('Collect/haha_modify?now_id='.($now_id+1).'&max_id='.$max_id.'&cid='.$cid).'"</script>';
				}else{
					echo 'http://www.haha.mx/good/day/'.$now_id.' 未分割出内容！<br/>';
					echo '<a href="'.U('Collect/haha_modify?now_id='.$now_id.'&max_id='.$max_id.'&cid='.$cid).'">重新采集此页面</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
					echo '<a href="'.U('Collect/haha_modify?now_id='.($now_id+1).'&max_id='.$max_id.'&cid='.$cid).'">跳过此页面，采集下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
				}
			}else{
				echo 'http://www.haha.mx/good/day/'.$now_id.' 未获取到内容！<br/>';
				echo '<a href="'.U('Collect/haha_modify?now_id='.$now_id.'&max_id='.$max_id.'&cid='.$cid).'">重新采集此页面</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
				echo '<a href="'.U('Collect/haha_modify?now_id='.($now_id+1).'&max_id='.$max_id.'&cid='.$cid).'">跳过此页面，采集下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
			}
		}else{
			exit('已完成采集。');
		}
	}
	public function qiubai_modify(){
		set_time_limit(180);
		//得到最高的页数和现在跑到的页数
		$now_id = !empty($_REQUEST['now_id']) ? intval($_REQUEST['now_id']) : 1;
		$max_id = intval($_REQUEST['max_id']);
		$cid = intval($_REQUEST['cid']);
		if(!$cid){
			exit('请选择栏目！');
		}
		
		//开始采集
		if($now_id<=$max_id){
			//$now_url = 'http://www.qiushibaike.com/8hr/page/'.$now_id;
			$now_url = 'http://www.qiushibaike.com/';
			if(function_exists('curl_init')){
				$ch = curl_init($now_url);
				curl_setopt($ch,CURLOPT_HEADER,0);
				curl_setopt($ch,CURLOPT_TIMEOUT,30); //设置超时限制防止死循环
				curl_setopt($ch,CURLOPT_REFERER, 'http://tieba.baidu.com/');//伪装一个来路
				curl_setopt($ch,CURLOPT_HTTPHEADER, array('X-FORWARDED-FOR: 202.108.11.8', 'CLIENT-IP: 202.108.11.8')); //伪装百度蜘蛛ip地址
				curl_setopt($ch,CURLOPT_USERAGENT, "Baiduspider+(+http://www.baidu.com/search/spider.htm)");
				curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);
				//curl_setopt($ch,CURLOPT_FOLLOWLOCATION,1); //抓取转跳
				curl_setopt($ch,CURLOPT_BINARYTRANSFER,true) ;
				curl_setopt($ch,CURLOPT_ENCODING,'gzip,deflate'); //gzip解压
				curl_setopt($ch,CURLOPT_USERAGENT,"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322; .NET CLR 2.0.50727)");
				$content = curl_exec($ch);
				curl_close($ch);
			}elseif(function_exists('file_get_contents')){
				$content = file_get_contents($now_url);
			}else{
				exit('您的服务器同时不支持“Curl组件”和“file_get_contents方法”，无法开始采集！');
			}
			
			if(!empty($content)){
				preg_match_all('/class=\"article block untagged mb15\" ([\s\S]+) class=\"stats-buttons bar clearfix\"/U',$content,$joke);
				//preg_match_all('/<div class="article block untagged mb15".+id="(.*?)">([\s\S]+)<\/div>/U',$content,$joke);
				
				if(!empty($joke[1])){
					foreach($joke[1] as $value){
						echo "<pre/>";
						if(strrpos($value,'class="thumb"') === false){
							//preg_match('|title="(.*?)">([\s\S]+)<div class="stats clearfix">|',$value,$content);
							preg_match('|<div class="content">([\s\S]+)<div class="stats">|',$value,$content);
							
							if(!empty($content[1])){
								$content = trim(strip_tags($content[1]));
								$this->add_article($content,'',$cid);
							}
						}
					}
					echo 'http://www.qiushibaike.com/8hr/page/'.$now_id.' 采集完毕！';
					echo '<script>window.location="'.U('Collect/qiubai_modify?now_id='.($now_id+1).'&max_id='.$max_id.'&cid='.$cid).'"</script>';
				}else{
					echo 'http://www.qiushibaike.com/8hr/page/'.$now_id.' 未分割出内容！<br/>';
					echo '<a href="'.U('Collect/qiubai_modify?now_id='.$now_id.'&max_id='.$max_id.'&cid='.$cid).'">重新采集此页面</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
					echo '<a href="'.U('Collect/qiubai_modify?now_id='.($now_id+1).'&max_id='.$max_id.'&cid='.$cid).'">跳过此页面，采集下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
				}
			}else{
				echo 'http://www.qiushibaike.com/8hr/page/'.$now_id.' 未获取到内容！<br/>';
				echo '<a href="'.U('Collect/qiubai_modify?now_id='.$now_id.'&max_id='.$max_id.'&cid='.$cid).'">重新采集此页面</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
				echo '<a href="'.U('Collect/qiubai_modify?now_id='.($now_id+1).'&max_id='.$max_id.'&cid='.$cid).'">跳过此页面，采集下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
			}
		}else{
			exit('已完成采集。');
		}
	}
	public function waamei_modify(){
		set_time_limit(180);
		//得到最高的页数和现在跑到的页数
		$now_id = !empty($_REQUEST['now_id']) ? intval($_REQUEST['now_id']) : 1;
		$max_id = intval($_REQUEST['max_id']);
		//开始采集
		if($now_id<=$max_id){
			$now_url = 'http://www.waamei.com/List/index/cate/gif/p/'.$now_id.'.html';
			if(function_exists('curl_init')){
				$ch = curl_init($now_url);
				curl_setopt($ch,CURLOPT_HEADER,0);
				curl_setopt($ch,CURLOPT_TIMEOUT,30); //设置超时限制防止死循环
				curl_setopt($ch,CURLOPT_REFERER, 'http://tieba.baidu.com/');//伪装一个来路
				curl_setopt($ch,CURLOPT_HTTPHEADER, array('X-FORWARDED-FOR: 202.108.11.8', 'CLIENT-IP: 202.108.11.8')); //伪装百度蜘蛛ip地址
				curl_setopt($ch,CURLOPT_USERAGENT, "Baiduspider+(+http://www.baidu.com/search/spider.htm)");
				curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);
				//curl_setopt($ch,CURLOPT_FOLLOWLOCATION,1); //抓取转跳
				curl_setopt($ch,CURLOPT_BINARYTRANSFER,true) ;
				curl_setopt($ch,CURLOPT_ENCODING,'gzip,deflate'); //gzip解压
				curl_setopt($ch,CURLOPT_USERAGENT,"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322; .NET CLR 2.0.50727)");
				$content = curl_exec($ch);
				curl_close($ch);
			}elseif(function_exists('file_get_contents')){
				$content = file_get_contents($now_url);
			}else{
				exit('您的服务器同时不支持“Curl组件”和“file_get_contents方法”，无法开始采集！');
			}
			
			if(!empty($content)){
				
				preg_match_all('/<ul class\="pageul\"><li>([\s\S]+)<\/li><\/ul>/U',$content,$joke);
				//preg_match_all('/<p class=\"text word-wrap\"([\s\S]+)<div class=\"pos-re\">/U',$content,$joke);
				//preg_match_all('/class=\"article block untagged mb15\" ([\s\S]+) class=\"stats-buttons bar clearfix\"/U',$content,$joke);
				print_r($joke);
				exit;
				if(!empty($joke[1])){
					foreach($joke[1] as $value){
						echo "<pre/>";
						
						if(strrpos($value,'class="thumb"') === false){
							preg_match('|title="(.*?)">([\s\S]+)<div class="stats clearfix">|',$value,$content);
							if(!empty($content[2])){
								$content = trim(strip_tags($content[2]));
								$content = str_replace('@糗事百科','',$content);
								$content = str_replace('糗百','',$content);
								$content = str_replace('糗事百科','',$content);
								
								//$this->add_article($content);
							}
						}
					}
					echo 'http://www.qiushibaike.com/8hr/page/'.$now_id.' 采集完毕！';
					echo '<script>window.location="'.U('Collect/qiubai_modify?now_id='.($now_id+1).'&max_id='.$max_id).'"</script>';
				}else{
					echo 'http://www.qiushibaike.com/8hr/page/'.$now_id.' 未分割出内容！<br/>';
					echo '<a href="'.U('Collect/qiubai_modify?now_id='.$now_id.'&max_id='.$max_id).'">重新采集此页面</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
					echo '<a href="'.U('Collect/qiubai_modify?now_id='.($now_id+1).'&max_id='.$max_id).'">跳过此页面，采集下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
				}
			}else{
				echo 'http://www.qiushibaike.com/8hr/page/'.$now_id.' 未获取到内容！<br/>';
				echo '<a href="'.U('Collect/qiubai_modify?now_id='.$now_id.'&max_id='.$max_id).'">重新采集此页面</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
				echo '<a href="'.U('Collect/qiubai_modify?now_id='.($now_id+1).'&max_id='.$max_id).'">跳过此页面，采集下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
			}
		}else{
			exit('已完成采集。');
		}
	}
	
	protected function add_article($content,$litpic,$cid){
		if($cid){
			$tablename = D('CategoryView')->where("category.id=$cid")->getField('tablename');
		}else{
			exit('请选择栏目！');
		}
		//内容
		$data['content'] = $content;
		$data['userid'] = 1;
		$data['publishtime'] = time();
        $data['updatetime']  = time();
		$data['status']      = 2;
		$data['cid']      = $cid;
		$data['commentflag']      = 1;
		$data['author']      = '管理员';
		
		if($litpic){
			$data['litpic'] = $litpic;
		}
		
		$content = trim(strip_tags($content));
		$data['description'] = str2sub($content, 120);
		
		//正则得到标题
		$content = htmlspecialchars_decode($content);
		$content = str_replace(array('，','！','？','。','；',',','!','?','.',';','&'),',',$content);
		$content = str_replace(array('“','”'),'',$content);
		$content = explode(',',trim($content));
		$i = 0;
		foreach($content as $key=>$value){
			$value = trim(strip_tags($value));
			if(strlen($value) > 6){
				$title[$i] = $value;
				$i++;
			}
		}
		
		$k = mt_rand(0,count($title)-1);
		$data['title'] = array_shift(explode('&',$title[$k]));
		
		$pic   = $data['litpic'];
		$flags = array();
		//图片标志
		if (!empty($pic) && !in_array(B_PIC, $flags)) {
			$flags[] = B_PIC;
		}
		$data['flag'] = 0;
		foreach ($flags as $v) {
			$data['flag'] += $v;
		}
		
		$id = M($tablename)->add($data);
		
	}
	
	/* 
	*功能：php完美实现下载远程图片保存到本地 
	*参数：文件url,保存文件目录,保存文件名称，使用的下载方式 
	*当保存文件名称为空时则使用远程文件原来的名称 
	*/ 
	protected function download_pic($url,$root_path,$save_path,$type=0){ 
		if(trim($url)==''){ 
			return array('savename'=>'','savepath'=>'','filepath'=>'','error'=>1); 
		}
		$save_dir = $root_path . $save_path;
		$ext=strrchr($url,'.'); 
		if($ext == '.gif' || $ext == '.jpg' || $ext == '.png'){ 
			$filename = uniqid().$ext;
		}else{
			return array('savename'=>'','savepath'=>'','filepath'=>'','error'=>3);
		}
		/*if(0!==strrpos($save_dir,'/')){ 
			$save_dir.='/'; 
		} */
		
		//创建保存目录 
		if(!file_exists($save_dir) && !mkdir($save_dir,0777,true)){ 
			return array('savename'=>'','savepath'=>'','filepath'=>'','error'=>5); 
		} 
		//获取远程文件所采用的方法  
		if($type){ 
			$ch=curl_init(); 
			$timeout=15; 
			curl_setopt($ch,CURLOPT_URL,$url); 
			curl_setopt($ch,CURLOPT_RETURNTRANSFER,1); 
			curl_setopt($ch,CURLOPT_CONNECTTIMEOUT,$timeout); 
			$img=curl_exec($ch); 
			curl_close($ch); 
		}else{ 
			ob_start();  
			readfile($url); 
			$img=ob_get_contents();  
			ob_end_clean();  
		} 
		//$size=strlen($img); 
		//文件大小  
		$fp2=@fopen($save_dir.$filename,'a'); 
		fwrite($fp2,$img); 
		fclose($fp2); 
		unset($img,$url);
		return array('savename'=>$filename,'savepath'=>$save_path,'filepath'=>$save_dir.$filename,'error'=>0); 
	}
	
	/*
	* $img_path 被压缩的图片的路径
	* $thumb_w 压缩的宽
	* $save_path 压缩后图片的存储路径
	* $is_del 是否删除原文件，默认删除
	*/
	public function thumb_img($img_path, $thumb_w, $save_path, $is_del = true){
		$image = new \Think\Image(); 
		$image->open($img_path);
		$width = $image->width(); // 返回图片的宽度
		
		if($width > $thumb_w){
			$width = $width/$thumb_w; //取得图片的长宽比
			$height = $image->height();
			$thumb_h = ceil($height/$width);
			
			//如果文件路径不存在则创建
			$save_path_info = pathinfo($save_path);
			if(!is_dir($save_path_info['dirname'])) {
				mkdir ($save_path_info['dirname'], 0777);
			}
			
			$filename = basename($img_path).'!'.$thumb_w.'X'.$thumb_h.'.jpg';
			
			$filepath = $save_path.'/'.$filename;
			
			$image->thumb($thumb_w, $thumb_h)->save($filepath);
			
			if($is_del) {
				@unlink($img_path); //删除源文件
			}
			
		}else{
			$filepath = $img_path;
		}
		
		return $filepath;
	}

}
