<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    include 'config.php';

    $rua = $_POST['rua'];
    $bairro = $_POST['bairro'];
    $numero = $_POST['numero'];
    $cep = $_POST['cep'];

    $sql = "INSERT INTO `centro-de-doacao` (rua, bairro, numero, cep) VALUES ('$rua', '$bairro', $numero, '$cep')";

    if ($conn->query($sql) === TRUE) {
        echo "Centro de doação adicionado com sucesso.";
    } else {
        echo "Erro ao adicionar centro de doação: " . $conn->error;
    }

    $conn->close();
}
?>

<html>
    <link rel="stylesheet" href="styles.css">
    <br><br>
    <a href="index.php" class="addCentro">Voltar para a lista</a>
</html>
