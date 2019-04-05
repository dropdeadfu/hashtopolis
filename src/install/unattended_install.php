<?php

use DBA\AccessGroupUser;
use DBA\Config;
use DBA\QueryFilter;
use DBA\RightGroup;
use DBA\User;

require_once(dirname(__FILE__) . "/../inc/load.php");



      $query = file_get_contents(dirname(__FILE__) . "/hashtopolis.sql");
      $FACTORIES::getAgentFactory()->getDB()->query($query);
      #$FACTORIES::getConfigFactory()->save($urlConfig);


