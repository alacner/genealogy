<?php

class Default_IndexController extends Tii_Application_Controller_Abstract
{
	public function indexAction() {
		$this->forward("index", "index", "index");
	}
}