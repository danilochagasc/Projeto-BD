<?php
if (isset($_GET['id'])) {
    include 'config.php';

    $idCentro = $_GET['id'];

    $sql = "DELETE FROM `centro-de-doacao` WHERE idCentro = $idCentro";

    if ($conn->query($sql) === TRUE) {
        echo "Centro de doação removido com sucesso.";
    } else {
        echo "Erro ao remover centro de doação: " . $conn->error;
    }

    $conn->close();
} else {
    echo "ID do centro de doação não fornecido.";
}
?>

<html>
    <link rel="stylesheet" href="styles.css">
    <br><br>
    <a href="index.php" class="addCentro">Voltar para a lista</a>
</html>