<?php
$servername = "127.0.0.1";
$username = "root"; // Substitua pelo usuário do seu banco de dados
$password = ""; // Substitua pela senha do seu banco de dados
$dbname = "doacao_de_sangue";

// Cria a conexão
$conn = new mysqli($servername, $username, $password, $dbname);

// Verifica a conexão
if ($conn->connect_error) {
    die("Conexão falhou: " . $conn->connect_error);
}
?>
