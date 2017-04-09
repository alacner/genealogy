<?php
/**
 * 入口程序
 * 
 * @author Yametei
 * @version $Id: index.php 8260 2016-10-27 03:38:33Z alacner $
 */

$_directories = array(
    dirname(__FILE__) . '/../configs/local/configuration.php',// local first
    dirname(__FILE__) . '/../configs/configuration.php',
);

foreach ($_directories as $_file) {
    if (is_file($_file)) {
        require_once $_file;
        break;
    }
}
unset($_directories, $_file);

if (!class_exists('Tii_Version')) {//check framework has already loaded
    trigger_error("The tii framework not loaded correctly", E_USER_ERROR);
}

//session start
if (Tii_Config::get('tii.application.session.start', false)) {
    Tii_Application_Session::start(Tii_Config::get('tii.application.session.handler', null));
}

Tii_Application::run();