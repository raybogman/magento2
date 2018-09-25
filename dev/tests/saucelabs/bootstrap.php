<?php
  // Setup: $ php composer.phar require facebook/webdriver

  require_once __DIR__ . '/../../../app/bootstrap.php';
  restore_error_handler();
  $vendorAutoload = __DIR__ . '/vendor/autoload.php';

  //require_once('vendor/autoload.php');
  use Facebook\WebDriver\Remote\RemoteWebDriver;
  use Facebook\WebDriver\WebDriverBy;

  $web_driver = RemoteWebDriver::create(
    "https://$SAUCE_USERNAME:$SAUCE_ACCESS_KEY@ondemand.saucelabs.com:443/wd/hub",
    array("platform"=>"Windows 7", "browserName"=>"chrome", "version"=>"42")
  );
  $web_driver->get("$MAGENTO_HOST_NAME");

  /*
    Test actions here.........
  */

  $web_driver->quit();
