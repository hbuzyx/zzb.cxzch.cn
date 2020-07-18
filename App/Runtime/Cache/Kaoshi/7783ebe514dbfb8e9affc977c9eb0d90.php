<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<!-- saved from url=(0058)http://kaoshi.hbxuwe.cn/index.php?exam-app-exampaper-paper -->
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

    <title>在线考试系统</title>
    <meta
      name="viewport"
      content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no"
    />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <link rel="stylesheet" type="text/css" href="/Public/Kaoshi/static/bootstrap.css" />
    <link
      rel="stylesheet"
      type="text/css"
      href="/Public/Kaoshi/static/datetimepicker.css"
    />
    <link
      rel="stylesheet"
      type="text/css"
      href="/Public/Kaoshi/static/jquery-ui.min.css"
    />
    <link rel="stylesheet" type="text/css" href="/Public/Kaoshi/static/peskin.css" />
    <!--[if lt IE 9]>
      <script src="app/core/styles/js/html5shiv.min.js"></script>
      <script src="app/core/styles/js/respond.min.js"></script>
    <![endif]-->
    <script src="/Public/Kaoshi/static/jquery.min.js"></script>
    <script src="/Public/Kaoshi/static/jquery.json.js"></script>
    <script src="/Public/Kaoshi/static/jquery-ui.min.js"></script>
    <script src="/Public/Kaoshi/static/bootstrap.min.js"></script>
    <script src="/Public/Kaoshi/static/bootstrap-datetimepicker.js"></script>
    <script src="/Public/Kaoshi/static/all.fine-uploader.min.js"></script>
    <script src="/Public/Kaoshi/static/ckeditor.js"></script>
    <style>
      .cke {
        visibility: hidden;
      }
    </style>
    <script src="/Public/Kaoshi/static/plugin.js"></script>
    <script src="/Public/Kaoshi/static/plugin(1).js"></script>
    <style type="text/css"></style>
  </head>
  <body data-spy="scroll" data-target="#myScrollspy">
    <div class="container-fluid" id="questioncontent">
      <div class="row-fluid">
        <div class="main box">
          <form
            id="form1"
            name="form1"
            method="post"
            action=""
            class="split"
            style="padding:0px;"
          >
            <div class="box itembox">
              <h2 class="text-center a b">党建知识测试</h2>
            </div>
            <div
              class="box itembox questionpanel"
              id="questype_1"
              style="display: block;"
            >
              <blockquote class="questype">一、单选题</blockquote>
            </div>
            <?php if(is_array($ti)): $key2 = 0; $__LIST__ = $ti;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($key2 % 2 );++$key2;?><!--<foreach name="ti" item="vo" key="key2">-->
              <div
                      class="box itembox paperexamcontent"
                      id="questions_<?php echo ($vo["id"]); ?>"
                      rel="1"
                      style="display: none;"
              >
                <h4 class="title">
                  第<?php echo ($key2); ?>题
                  <a name="question_<?php echo ($vo["id"]); ?>"> </a>
                </h4>
                <a name="question_<?php echo ($vo["id"]); ?>"> </a>
                <div class="choice">
                  <a name="question_<?php echo ($vo["id"]); ?>"> </a
                  ><?php echo ($vo["name"]); ?>
                </div>
                <div class="choice">
                    <?php if(is_array($vo["item"])): $i = 0; $__LIST__ = $vo["item"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo2): $mod = ($i % 2 );++$i;?><p>
                    <label class="radio-inline glyphicon glyphicon-ok-circle"
                    ><input
                            type="radio"
                            name="question[<?php echo ($vo["id"]); ?>]"
                            rel="<?php echo ($vo["id"]); ?>"
                            value="<?php echo ($key); ?>"
                            autocomplete="off"
                    /><?php echo ($vo2); ?>
                    </label>
                  </p><?php endforeach; endif; else: echo "" ;endif; ?>
                </div>
                <!--<div class="choice">-->
                <div class="choice tips" style="display :none;">
                  <div class="">
                    答案解析：
                  </div>
                  <?php echo ($vo["fenxi"]); ?>
                </div>
                <div class="toolbar">
                  <?php if($key2 > 1): ?><a
                          class="btn btn-default"
                          onclick="javascript:gotoindexquestion(<?php echo ($key2-2); ?>);"
                  ><span class="glyphicon glyphicon-chevron-left"></span
                  >上一题<?php echo ($key2-1); ?></a
                  ><?php endif; ?>
                  <?php if($key2 < $num): ?><a
                          class="pull-right btn btn-primary"
                          onclick="javascript:gotoindexquestion(<?php echo ($key2); ?>);"
                  >下一题<?php echo ($key2); echo ($num); ?><span class="glyphicon glyphicon-chevron-right"></span
                  ></a><?php endif; ?>
                </div>
              </div><?php endforeach; endif; else: echo "" ;endif; ?>

            <h3 class="text-center">
              <input
                type="hidden"
                name="insertscore"
                value="1"
                autocomplete="off"
              />
              <a
                class="btn btn-primary"
                style="font-size:1em;width:270px;"
                href="http://kaoshi.hbxuwe.cn/kaoshi.php/index/exampaper#submodal"
                role="button"
                data-toggle="modal"
                >交 卷</a
              >
            </h3>
          </form>
        </div>
      </div>
    </div>
    <div
      class="modal fade"
      id="submodal"
      tabindex="-1"
      role="dialog"
      aria-labelledby="myModalLabel"
    >
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button
              type="button"
              class="close"
              data-dismiss="modal"
              aria-label="Close"
              autocomplete="off"
            >
              <span aria-hidden="true">×</span>
            </button>
            <h4 class="modal-title" id="myModalLabel">交卷</h4>
          </div>
          <div class="modal-body">
            <p>
              共有试题 <span class="allquestionnumber">85</span> 题，已做
              <span class="yesdonumber">0</span> 题。您确认要交卷吗？
            </p>
          </div>
          <div class="modal-footer">
            <button
              type="button"
              onclick="javascript:submitPaper();"
              class="btn btn-primary"
              autocomplete="off"
            >
              确定交卷
            </button>
            <button
              aria-hidden="true"
              class="btn"
              type="button"
              data-dismiss="modal"
              autocomplete="off"
            >
              再检查一下
            </button>
          </div>
        </div>
      </div>
    </div>
    <script type="text/javascript">
      var qindex = 0;

      function gotoquestion(questid) {
        $(".questionpanel").hide();
        $(".paperexamcontent").hide();
        $("#questions_" + questid).show();
        $("#questype_" + $("#questions_" + questid).attr("rel")).show();
      }

      function gotoindexquestion(index) {
        $(".questionpanel").hide();
        $(".paperexamcontent").hide();
        $(".paperexamcontent")
          .eq(index)
          .show();
        $(
          "#questype_" +
            $(".paperexamcontent")
              .eq(index)
              .attr("rel")
        ).show();
      }
      $(document).ready(function() {
        //检查剩余时间
        $.get(
          "index.php?exam-app-index-ajax-lefttime&rand" + Math.random(),
          function(data) {
            var setting = {
              time: 60,
              hbox: $("#timer_h"),
              mbox: $("#timer_m"),
              sbox: $("#timer_s"),
              finish: function() {
                submitPaper();
              }
            };

            data = 0;
            setting.lefttime = parseInt(data);
            countdown(setting);
          }
        );
        //显示第一题
        (function() {
          $(".questionpanel").hide();
          $(".questionpanel:first").show();
          $(".paperexamcontent").hide();
          $(".paperexamcontent:first").show();
        })();
        //2分钟后保存答案
        setInterval(saveanswer, 10000);
        //本地缓存获取题信息，如果不为空重新获取答题信息
        initData = $.parseJSON(storage.getItem("questions"));
        if (initData) {
          for (var p in initData) {
            if (p != "set") formData[p] = initData[p];
            $("#time_" + $('[name="' + p + '"]').attr("rel")).val(
              initData[p].time
            );
          }
          var textarea = $("#form1 textarea");
          $.each(textarea, function() {
            var _this = $(this);
            if (initData[_this.attr("name")]) {
              _this.val(initData[_this.attr("name")].value);
              CKEDITOR.instances[_this.attr("id")].setData(
                initData[_this.attr("name")].value
              );
              if (
                initData[_this.attr("name")].value &&
                initData[_this.attr("name")].value != ""
              )
                batmark(_this.attr("rel"), initData[_this.attr("name")].value);
            }
          });
          var texts = $("#form1 :input[type=text]");
          $.each(texts, function() {
            var _this = $(this);
            if (initData[_this.attr("name")]) {
              _this.val(
                initData[_this.attr("name")]
                  ? initData[_this.attr("name")].value
                  : ""
              );
              if (
                initData[_this.attr("name")].value &&
                initData[_this.attr("name")].value != ""
              )
                batmark(_this.attr("rel"), initData[_this.attr("name")].value);
            }
          });
          var radios = $("#form1 :input[type=radio]");
          $.each(radios, function() {
            var _ = this,
              v = initData[_.name] ? initData[_.name].value : null;
            var _this = $(this);
            if (v != "" && v == _.value) {
              _.checked = true;
              batmark(_this.attr("rel"), initData[_this.attr("name")].value);
            } else {
              _.checked = false;
            }
          });
          var checkboxs = $("#form1 :input[type=checkbox]");
          $.each(checkboxs, function() {
            var _ = this,
              v = initData[_.name] ? initData[_.name].value : null;
            var _this = $(this);
            if (v != "" && v == _.value) {
              _.checked = true;
              batmark(_this.attr("rel"), initData[_this.attr("name")].value);
            } else {
              _.checked = false;
            }
          });
        }

        //监听答题事件
        $("#form1 :input[type=text]").change(function() {
          var _this = $(this);
          var p = [];
          p.push(_this.attr("name"));
          p.push(_this.val());
          p.push(Date.parse(new Date()) / 1000);
          $("#time_" + _this.attr("rel")).val(Date.parse(new Date()) / 1000);
          set.apply(formData, p);
          //记录答题结果
          markQuestion(_this.attr("rel"), true);
        });

        $("#form1 :input[type=radio]").change(function() {
          var _ = this;
          var _this = $(this);
          var p = [];
          p.push(_.name);
          if (_.checked) {
            p.push(_.value);
            p.push(Date.parse(new Date()) / 1000);
            $("#time_" + _this.attr("rel")).val(Date.parse(new Date()) / 1000);
            set.apply(formData, p);
          } else {
            p.push("");
            p.push(null);
            set.apply(formData, p);
          }
          markQuestion(_this.attr("rel"));
        });

        $("#form1 textarea").change(function() {
          var _ = this;
          var _this = $(this);
          var p = [];
          p.push(_.name);
          p.push(_.value);
          p.push(Date.parse(new Date()) / 1000);
          $("#time_" + _this.attr("rel")).val(Date.parse(new Date()) / 1000);
          set.apply(formData, p);
          markQuestion(_this.attr("rel"), true);
        });
        $("#form1 :input[type=checkbox]").change(function() {
          var _ = this;
          var _this = $(this);
          var p = [];
          p.push(_.name);
          if (_.checked) {
            p.push(_.value);
            p.push(Date.parse(new Date()) / 1000);
            $("#time_" + _this.attr("rel")).val(Date.parse(new Date()) / 1000);
            set.apply(formData, p);
          } else {
            p.push("");
            p.push(null);
            set.apply(formData, p);
          }
          markQuestion(_this.attr("rel"));
        });
        $(".allquestionnumber").html($(".paperexamcontent").length);
        $(".yesdonumber").html($("#questionindex .btn-primary").length);
      });
    </script>
  </body>
</html>