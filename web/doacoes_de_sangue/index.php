<!DOCTYPE html>
<html>
<head>
    <title>Gerenciamento de Centros de Doação</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1>Centros de Doação de Sangue</h1>
    <button><a href="adicionar.php" class="addCentro">Adicionar Centro de Doação</a></button>
    <h2>Lista de Centros de Doação</h2>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Rua</th>
                <th>Número</th>
                <th>Bairro</th>
                <th>CEP</th>
                <th>Editar</th>
                <th>Remover</th>
            </tr>
        </thead>
        <tbody>
            <?php
            include 'config.php';

            $sql = "SELECT * FROM `centro-de-doacao`";
            $result = $conn->query($sql);

            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    echo "<tr>";
                    echo "<td>{$row['idCentro']}</td>";
                    echo "<td>{$row['rua']}</td>";
                    echo "<td>{$row['numero']}</td>";
                    echo "<td>{$row['bairro']}</td>";
                    echo "<td>{$row['cep']}</td>";
                    echo "<td><a href='editar.php?id={$row['idCentro']}'>Editar</a></td>";
                    echo "<td><a href='remover.php?id={$row['idCentro']}'>Remover</a></td>";
                    echo "</tr>";
                }
            } else {
                echo "<tr><td colspan='7' class='empty'>Nenhum centro de doação encontrado.</td></tr>";
            }

            $conn->close();
            ?>
        </tbody>
    </table>
</body>
</html>
