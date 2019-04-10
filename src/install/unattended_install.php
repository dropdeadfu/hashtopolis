<?php

use DBA\AccessGroupUser;
use DBA\Config;
use DBA\QueryFilter;
use DBA\RightGroup;
use DBA\User;


@include(dirname(__FILE__) . "/../inc/conf.php");

      #global $CONN;
      $dsn = 'mysql:host=' . $CONN['server'] . ";port=" . $CONN['port'];
      $user = $CONN['user'];
      $password = $CONN['pass'];

    try {
      $dbh = new PDO($dsn, $user, $password);
      $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
      $dbh->exec('create database htp');

      $dbh->exec('use htp');

      $query = file_get_contents(dirname(__FILE__) . "/hashtopolis.sql");
      $dbh->exec($query);

      $query = file_get_contents(dirname(__FILE__) . "/unattended.sql");
      $dbh->exec($query);
    }
    catch (PDOException $e) {
      if ($test) {
        return null;
      }
      print("Fatal Error ! Database connection failed: " . $e->getMessage());
    }

