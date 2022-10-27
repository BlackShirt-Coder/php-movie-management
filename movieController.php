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
        $this->movieGenre = isset($_POST['genres']) ? $_POST['genres'] : "";
        $this->createMovieGenre($this->movie_id, $this->movieGenre);
    }


    public function createMovieGenre($movie_id, $movieGenre)
    {
        $crud = new crud();
        foreach ($movieGenre as $key => $genre) {
            $movieGenreArr = [
                "mv_movie" => $movie_id,
                "mv_genre" => $genre
            ];
            $crud->create("movie_genre", $movieGenreArr);
        }


    }
}