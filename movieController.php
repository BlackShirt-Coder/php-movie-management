<?php

class movieController
{
    private $movie_id;
    private $movieGenre;

    public function addMovie()
    {
        require_once "crud.php";
        $crud = new crud();
        $movie_data = [
            'movie_title' => $_POST['mv_title'],
            'movie_released' => date("Y-m-d", strtotime($_POST['mv_year_released']))
        ];
        $this->movie_id = $crud->create("movie", $movie_data);
        $this->movieGenre = isset($_POST['genres']) ? $_POST['genres'] : [];
        $this->createMovieGenre($this->movie_id, $this->movieGenre);
    }


    public function createMovieGenre($movie_id, $movieGenre)
    {
        $crud = new crud();
        foreach ($movieGenre as $genre) {
            $movieGenreArr = [
                "mv_movie" => $movie_id,
                "mv_genre" => $genre
            ];
            $crud->create("movie_genre", $movieGenreArr);
        }


    }

    public function getMovie()
    {
        $crud = new crud();
        return $crud->read("SELECT movie_id,movie_title,genre_name,genre_id,movie_released,img_path FROM movie
 LEFT JOIN movie_genre on movie_id=mv_movie 
 LEFT JOIN genre on genre_id=mv_genre
 LEFT JOIN cover_image on img_movie=movie_id
 ;");
    }

    public function coverImageUpload()
    {
        try {
            $files = $_FILES['cover_image'];
            $file_tmp_name = $files['tmp_name'];
            $file_name = rand(100, 10000) * time() . $files['name'];
            $file_name = trim($file_name, $files['name']) . ".jpg";
            if (!$files['name']) {
                mkdir("../images/covers/", 0777, false);
            }
            move_uploaded_file($file_tmp_name, "../images/covers/" . $file_name);
            $crud = new crud();
            $image_arr = [
                "img_path" => "../images/covers/" . $file_name,
                "img_movie" => $this->movie_id
            ];
            $crud->create("cover_image", $image_arr);
        } catch (Exception $e) {
            echo $e->getMessage();
        }
    }
}