<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    include 'config.php';

    $idCentro = $_POST['idCentro'];
    $rua = $_POST['rua'];
    $bairro = $_POST['bairro'];
    $numero = $_POST['numero'];
    $cep = $_POST['cep'];

    $sql = "UPDATE `centro-de-doacao` SET rua='$rua', bairro='$bairro', numero=$numero, cep='$cep' WHERE idCentro = $idCentro";

    if ($conn->query($sql) === TRUE) {
        echo "Centro de doação atualizado com sucesso.";
    } else {
        echo "Erro ao atualizar centro de doação: " . $conn->error;
    }

    $conn->close();
}
?>

<html>
    <link rel="stylesheet" href="styles.css">
    <br><br>
    <a href="index.php" class="addCentro">Voltar para a lista</a>
</html>