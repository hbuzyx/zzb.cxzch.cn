<?php

namespace Manage\Controller;
use Common\Lib\Category;

class ImportimgsController extends CommonController
{

    public function index()
    {
		$flist = array();
		$vlist = $this->getSubDirs("./tmp");
		
		$cate          = M('category')->order('sort')->select();
        $cate          = Category::toLevel($cate, '---', 0);
		$this->assign('cate', $cate);
		
        $this->assign('type', '目录列表');
        $this->assign('vlist', $vlist);
        $this->display();
    }
	
	public function upimgs(){
		header("Content-Type:text/html; charset=utf-8"); //不然返回中文乱码
		$dirs = I('key', 0, '');
		$cid = I('cid', 0, 'intval');
		if (!is_array($dirs)) {
            $this->error('请选择要导入的目录');
        }
		if ($cid == 0) {
            $this->error('请选择栏目');
        }
		foreach($dirs as $key=>$list){
			/*$title = substr(strrchr($list,'/'),1);
			$list = iconv("utf-8","gbk//IGNORE",$list);*/
			if(is_dir($list)){
				$flist = $this->getFile($list);
				if($flist && is_array($flist)){
					$data = array();
					foreach($flist as $k=>$file){
						if(file_exists($file)){
							$ext = ''; //原文件后缀
							$strtemp = explode('.', $file);
							$ext     = end($strtemp);
							//dump($file);
							if($ext == 'jpg' || $ext == 'png' || $ext == 'gif' || $ext == 'jpeg'){
								//$rs = $this->madeImgs($file,$ext);
								//$imginfo = $this->thumb_img('.'.$litpics[0], 300, $path, false);
								$root_path = C('CFG_UPLOAD_ROOTPATH');
								$save_path = 'img1/'.date('Ymd').'/';
								$path = $root_path.$save_path;
								//如果文件路径不存在则创建
								if(!is_dir($path)) {
									mkdir ($path, 0777);
								}
								$img = array();
								$img[$k]['savename'] = uniqid().'.'.$ext;
								$img[$k]['savepath'] = $save_path;
								$img[$k]['name'] = str_replace('/','',strrchr(iconv("GB2312","UTF-8",$file),'/'));
								$alt = explode('.',$img[$k]['name']);
								$img[$k]['alt'] = $alt[0];
								//$img[$k]['name'] = basename(iconv("GB2312","UTF-8",$file));
								$filepath = $path.$img[$k]['savename'];
								$rs = copy($file,$filepath);
								//dump($rs);
								if($rs){
									$yun_upload    = new \Common\Lib\YunUpload(1);
									$result = $yun_upload->dopic($img);
									$data['pic'][] = $result[0];
									$data['picarry'][] = $result[0]['url'].'$$$'.$result[0]['alt'];
									//dump($result);
								}
							}
							if($ext == 'txt'){
								//$filename = str_replace('/','',strrchr($file,'/'));
								$filename = basename($file,".txt");
								$data[$filename] = trim(iconv("GB2312","UTF-8",file_get_contents($file)));
							}
							
						}else{
							continue;
						}
					}
					
					$data['content'] = str_replace("\n", '<br />', $data['content']);
					$data['litpic'] = $data['pic'][0]['turl'];
					$data['pictureurls'] = implode('|||',$data['picarry']);
					$data['description'] = str2sub(strip_tags($data['content']), 120);
					$data['cid'] = $cid;
					$data['flag'] = 1;
					$data['status'] = 2;
					$data['commentflag'] = 1;
					$data['publishtime'] = I('publishtime', time(), 'strtotime');
					$data['updatetime']  = time();
					
					$actionName = 'picture';
					if($data['tag']){
						$tags = explode(',',$data['tag']);
						if(count($tags) > 5){
							$this->error('最多5个标签，用“,”分隔！');
						}
						if(count($tags) > 0){
							foreach($tags as $k=>$val){
								$mp['tag_name'] = $val;
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
					$id = M($actionName)->add($data);
					if (!$id) {
						$this->error('添加失败');
					}
					//dump($data);
				}
				
			}
			$this->deldir($list);
			
		}
		
		$this->success('导入成功！', U('index'));
	}
	
	//获取目录列表
	public function getSubDirs($dir) 
	{
		$subdirs = array();
		
		if(!$dh = opendir($dir)) {
			return $subdirs;
		}
		$i = 0;
		while ($f = readdir($dh)) 
		{
			if($f =='.' || $f =='..' ) {
				continue;
			}
			
			//如果只要子目录名, path = $f;
			$path = $dir.'/'.$f;
			if(!is_dir($path)){
				continue;
			}
			$name = $f;
			//$path = $f;
			//$subdirs[$i] = iconv("GB2312","UTF-8",$path);
			$subdirs[$i]['path'] = $path;
			$subdirs[$i]['name'] = $name;
			$i++;
		}
		closedir($dh);
		return $subdirs;
	}
	
	//获取文件列表
	public function getFile($fdir) {
		$filelist = array();
		$dir = opendir($fdir);
		//列出目录中的文件
		$i = 0;
		while (($file = readdir($dir)) !== false){
			if($file =='.' || $file =='..') {
				continue;
			}
			$path = $fdir.'/'.$file;
			if(is_dir($path)){
				continue;
			}
			//$path = $f;
			//$filelist[$i] = iconv("GB2312","UTF-8",$path);
			$filelist[$i] = $path;
			$i++;
		}
		closedir($dh);
		return $filelist;
	}
	
	public function deldir($dir) { 
		//先删除目录下的文件： 
		$dh=opendir($dir); 
		while ($file=readdir($dh)) { 
			if($file!="." && $file!="..") { 
				$fullpath=$dir."/".$file; 
				if(!is_dir($fullpath)) { 
					unlink($fullpath); 
				} else { 
					deldir($fullpath); 
				} 
			} 
		} 
		closedir($dh); 
		//删除当前文件夹： 
		if(rmdir($dir)) { 
			return true; 
		} else { 
			return false; 
		} 
	} 
	
}
?>