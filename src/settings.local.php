<?php

$databases = array (
  'default' => array (
    'default' => array (
      'database' => 'phpdock_test',
      'username' => 'root',
      'password' => $_ENV['MYSQL_ENV_MYSQL_ROOT_PASSWORD'],
      'host'     => $_ENV['MYSQL_PORT_3306_TCP_ADDR'],
      'port'     => $_ENV['MYSQL_PORT_3306_TCP_PORT'],
      'driver'   => 'mysql',
      'prefix'   => '',
    ),
  ),
);

$drupal_hash_salt = 'SOME_REALLY_RANDOM_STRING';
