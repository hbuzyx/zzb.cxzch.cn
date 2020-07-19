<?php

if (version_compare(PHP_VERSION, '5.3.0', '<')) {
    die('require PHP > 5.3.0 !');
}

define('BIND_MODULE', 'Shipin');
define('APP_DEBUG', true);
define('APP_PATH', "./App/");
define('THINK_PATH', "./Include/");
require THINK_PATH . 'ThinkPHP.php';
