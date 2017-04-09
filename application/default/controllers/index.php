<?php

class Default_IndexController extends Tii_Application_Controller_Abstract
{
	public function init() {
		//$this->setLayout('frontend');
	}
	
	public function indexAction() {
		$this->noRender();
	}
}