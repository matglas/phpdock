<?php

$databases = array (
  'default' => array (
    'default' => array (
      'database' => 'phpdock_test',
      'username' => 'root',
      'password' => getenv('MYSQL_ENV_MYSQL_ROOT_PASSWORD'),
      'host'     => getenv('MYSQL_PORT_3306_TCP_ADDR'),
      'driver'   => 'mysql',
      'prefix'   => '',
    ),
  ),
);

$drupal_hash_salt = 'SOME_REALLY_RANDOM_STRING';
