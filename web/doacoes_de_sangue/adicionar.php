<!DOCTYPE html>
<html>
<head>
    <title>Adicionar Centro de Doação</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1>Adicionar Centro de Doação</h1>
    <form action="salvar_adicao.php" method="post">
        <label for="rua">Rua:</label>
        <input type="text" name="rua" required><br>

        <label for="bairro">Bairro:</label>
        <input type="text" name="bairro" required><br>

        <label for="numero">Número:</label>
        <input type="number" name="numero" required><br>

        <label for="cep">CEP:</label>
        <input type="text" name="cep" required><br>

        <input type="submit" value="Adicionar">
    </form>
    <br>
    <a href="index.php">Voltar para a lista</a>
</body>
</html>
