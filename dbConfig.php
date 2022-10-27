<?php

class dbConfig
{
    const DB_HOST = 'localhost';
    const DB_NAME = 'mms';
    const DB_USER = 'root';
    const DB_PASS = '';
    private $db;

    public function getConnection()
    {
       try{
           if($this->db==null){
               $this->db = new PDO("mysql:host=".self::DB_HOST.";"."dbname=".self::DB_NAME,self::DB_USER,self::DB_PASS);
               $this->db->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
           }
           return $this->db;
       }
       catch (Exception $e){
           echo "Connnection Error: ".$e->getMessage();
       }
    }
}