<?php

namespace Manage\Controller;

use Think\Controller;

class SitemapController extends CommonController
{
	public function index(){
		$sitemap_baidu = $this->sitemap_baidu();
		$file = fopen("./sitemap_baidu.xml","w");
		fwrite($file,$sitemap_baidu);
		fclose($file);
		echo '<html><head></head><body style="background-color:white;margin:0;padding:50px;">';
		echo '百度搜索引擎的网站地图生成成功！./sitemap_baidu.xml<br/>';
		
		$sitemap = $this->sitemap();
		$file = fopen("./sitemap.xml","w");
		fwrite($file,$sitemap);
		fclose($file);
		echo '其他搜索引擎 的网站地图生成成功！./sitemap.xml<br/>';
		
		$rss = $this->rss();
		$file = fopen("./rss.xml","w");
		fwrite($file,$rss);
		fclose($file);
		echo 'RSS订阅源生成成功！./rss.xml';
		
		echo '</body></html>';
		//$this->success('地图生成成功！');
	}
	
    public function sitemap_baidu(){
		/*$artlist = array();
		$piclist = array();
		$soflist = array();
		$spelist = array();
		$topic = array();
		$map['status'] = 1;
		$artlist = D2('ArcView', 'article')->where($map)->nofield('content')->order('id desc')->limit(1000)->select();
		$piclist = D2('ArcView', 'picture')->where($map)->nofield('content')->order('id desc')->limit(1000)->select();
		$soflist = D2('ArcView', 'soft')->where($map)->nofield('content')->order('id desc')->limit(1000)->select();
		$spelist = D2('ArcView', 'special')->where($map)->nofield('content')->order('id desc')->limit(1000)->select();
		$topic = D2('ArcView', 'topic')->where($map)->nofield('content')->order('id desc')->limit(1000)->select();*/
		
		$limit = 10000;
		$where = "status=1";
		$fields = 'id,title,keywords,litpic,publishtime,click,cid';
		$prefix = C('DB_PREFIX');
		$ModelView = M('')->field($fields)->table($prefix.'article')->where($where)
		->union("SELECT $fields FROM ".$prefix."picture WHERE $where",true)
		->union("SELECT $fields FROM ".$prefix."soft WHERE $where",true)
		->union("SELECT $fields FROM ".$prefix."special WHERE $where ORDER BY id desc LIMIT $limit",true);
		$vlist = $ModelView->select();
		
		$sitemap = '<?xml version="1.0" encoding="UTF-8" ?><document xmlns:bbs="http://www.baidu.com/search/bbs_sitemap.xsd">
				<webSite>'.C('CFG_WEBURL').'</webSite><webMaster>'.C('CFG_EMAIL_LOGINNAME').'</webMaster><updatePeri>24</updatePeri>
				<updatetime>'.date("Y-m-d H:i:s",time()).'<item><link>'.C('CFG_WEBURL').'</link><title>'.C('CFG_WEBNAME').'</title><pubDate>'.date("Y-m-d H:i:s",time()).'</pubDate></item></updatetime>'."\n";
				if($vlist){
					foreach ($vlist as $k => $v) {
						$type = \Common\Lib\Category::getSelf(get_category(0), $v['cid']);
						$url = C('CFG_WEBURL').'/'.$type['ename'].'-'.$v['id'].'.html';
						$sitemap .= "\t\t\t".'<item><link>'.$url.'</link><title>'.$v['title'].'</title><pubDate>'.date("Y-m-d H:i:s",$v['publishtime']).'</pubDate></item>'."\n";
					}
				}
				/*if($piclist){
					foreach ($piclist as $k => $v) {
						$v['url'] = C('CFG_WEBURL').'/'.$v['ename'].'-'.$v['id'].'.html';
						$sitemap .= '<item><link>'.$v['url'].'</link><title>'.$v['title'].'</title><pubDate>'.date("Y-m-d H:i:s",$v['publishtime']).'</pubDate></item>';
					}
				}*/
					
		$sitemap .= '</document>';
		
		return $sitemap;
	}
	public function sitemap(){
		$limit = 10000;
		$where = "status=1";
		$fields = 'id,title,keywords,litpic,publishtime,click,cid';
		$prefix = C('DB_PREFIX');
		$ModelView = M('')->field($fields)->table($prefix.'article')->where($where)
		->union("SELECT $fields FROM ".$prefix."picture WHERE $where",true)
		->union("SELECT $fields FROM ".$prefix."soft WHERE $where",true)
		->union("SELECT $fields FROM ".$prefix."special WHERE $where ORDER BY id desc LIMIT $limit",true);
		$vlist = $ModelView->select();
		
		$sitemap = '<?xml version="1.0" encoding="UTF-8" ?>
            <urlset xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd" xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">	
                <url>
                    <loc>'.C('CFG_WEBURL').'</loc>
                    <lastmod>'.date("c",time()).'</lastmod>
                    <changefreq>Always</changefreq>
                    <priority>1.0</priority>
                </url>';
				
				if($vlist){
					foreach ($vlist as $k => $v) {
						$type = \Common\Lib\Category::getSelf(get_category(0), $v['cid']);
						$url = C('CFG_WEBURL').'/'.$type['ename'].'-'.$v['id'].'.html';
						$sitemap .= "\t\t\t".'<url><loc>'.$url.'</loc>
							<lastmod>'.date("c",$v['publishtime']).'</lastmod><changefreq>Always</changefreq><priority>0.6</priority></url>'."\n";
					}
				}
				
    	$sitemap .= '</urlset>';
		return $sitemap;
	}
	public function rss(){
		$limit = 10000;
		$where = "status=1";
		$fields = 'id,title,keywords,litpic,publishtime,click,cid';
		$prefix = C('DB_PREFIX');
		$ModelView = M('')->field($fields)->table($prefix.'article')->where($where)
		->union("SELECT $fields FROM ".$prefix."picture WHERE $where",true)
		->union("SELECT $fields FROM ".$prefix."soft WHERE $where",true)
		->union("SELECT $fields FROM ".$prefix."special WHERE $where ORDER BY id desc LIMIT $limit",true);
		$vlist = $ModelView->select();
		
		$rss = '<?xml version="1.0" encoding="UTF-8"?>
			<rss version="2.0">
			<channel>
				<title>'.C('CFG_WEBNAME').'</title>
				<description>'.C('CFG_DESCRIPTION').'</description>
				<link>'.C('CFG_WEBURL').'</link>
				<lastBuildDate>'.date("r",time()).'</lastBuildDate>
				<ttl>720</ttl>
				<image>
					<url>'.C('CFG_WEBURL').'/Public/Home/'.C('CFG_THEMESTYLE').'/Images/logo.png</url>
					<title>'.C('CFG_WEBNAME').'</title>
					<link>'.C('CFG_WEBURL').'</link>
					<description>'.C('CFG_DESCRIPTION').'</description>
				</image>';
				
				if($vlist){
					foreach ($vlist as $k => $v) {
						$type = \Common\Lib\Category::getSelf(get_category(0), $v['cid']);
						$url = C('CFG_WEBURL').'/'.$type['ename'].'-'.$v['id'].'.html';
						$rss .= "\t\t\t".'<item><title><![CDATA['.$v['title'].']]></title><link>'.$url.'</link><description><![CDATA['.$v['description'];
						if($v['litpic']){
							$rss .= '<br/><img src="'.C('CFG_WEBURL').$v['litpic'].'"/>';
						}
						$rss .= ']]></description>';
						$rss .= '<comments>'.$v['url'].'#comments</comments>
						<pubDate>'.date("Y-m-d H:i:s",time()).'</pubDate>
					</item>'."\n";
					}
				}
				
    	$rss .= '</channel></rss>';
		return $rss;
	}

}
