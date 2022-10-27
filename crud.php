<?php
require_once "dbConfig.php";

class crud
{
    private $conn;

    public function __construct()
    {
        $db = new dbConfig();
        $this->conn = $db->getConnection();

    }

    /*    public function create($id,$title,$date){
            $stmt=$this->conn->prepare('insert into movie values(:id,:title,:movie_released)');
            $stmt->bindParam(":id",$id);
            $stmt->bindParam(":title",$title);
            $stmt->bindParam(":movie_released",$date);
            $stmt->execute();

    [
      "movie_id"=>1,
      "movie_title" => "titanic",
      "movie_released" => "2022-02-03"
    :movie_id
    ]
        }*/
    public function create($table, $data_array)
    {
        $colums = implode(",", array_keys($data_array));
        $placeholders = ":" . implode(",:", array_keys($data_array));
        $sql = "insert into $table ($colums) values ($placeholders);";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute($data_array);
        return $this->conn->lastInsertId();
    }
   public function read($query){
        $stmt=$this->conn->prepare($query);
        $stmt->execute();
       while($row=$stmt->fetchAll(PDO::FETCH_OBJ)){
           return $row;
       }
   }
   public function update($query){
        $stmt=$this->conn->prepare($query);
        $stmt->execute();
   }
   public function delete($query){
        $stmt=$this->conn->prepare($query);
        $stmt->execute();
   }

}

