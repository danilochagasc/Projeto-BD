<!DOCTYPE html>
<html>
<head>
    <title>Editar Centro de Doação</title>
    <link rel="stylesheet" href="styles.css">

</head>
<body>
    <?php
    include 'config.php';

    if (isset($_GET['id'])) {
        $idCentro = $_GET['id'];

        $sql = "SELECT * FROM `centro-de-doacao` WHERE idCentro = $idCentro";
        $result = $conn->query($sql);

        if ($result->num_rows == 1) {
            $centro = $result->fetch_assoc();
        } else {
            echo "Centro de doação não encontrado.";
            exit;
        }
    } else {
        echo "ID do centro de doação não fornecido.";
        exit;
    }
    ?>
    <h1>Editar Centro de Doação</h1>
    <form action="salvar_edicao.php" method="post">
        <input type="hidden" name="idCentro" value="<?php echo $centro['idCentro']; ?>">

        <label for="rua">Rua:</label>
        <input type="text" name="rua" value="<?php echo $centro['rua']; ?>" required><br>

        <label for="bairro">Bairro:</label>
        <input type="text" name="bairro" value="<?php echo $centro['bairro']; ?>" required><br>

        <label for="numero">Número:</label>
        <input type="number" name="numero" value="<?php echo $centro['numero']; ?>" required><br>

        <label for="cep">CEP:</label>
        <input type="text" name="cep" value="<?php echo $centro['cep']; ?>" required><br>

        <input type="submit" value="Salvar">
    </form>
    <br>
    <a href="index.php">Voltar para a lista</a>
</body>
</html>
