<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>La cocoteca</title>
    <link rel="stylesheet" href="Style.css">
</head>
<nav>
  <div class="nav">
  <ul>
      <li class="nav-item">
      <a class="nav-link" href="http://10.0.0.2\var\www\webdav\Proyecto-web\index.html">Home</a>
      </li>
      <li class="nav-item">
      <a class="nav-link" href="http://10.0.0.2\var\www\webdav\Proyecto-web\Productos.php">Productos</a>
      </li>
      <li class="nav-item">
      <a class="nav-link" href="http://10.0.0.2\var\www\webdav\Proyecto-web\Ubicacion.html">Ubicacion</a>
      </li>
      <li class="nav-item">
      <a class="nav-link" href="http://10.0.0.2\var\www\webdav\Proyecto-web\Registro.html">Registro</a>
      </li>
      <li class="nav-item">
      <a class="nav-link" href="http://10.0.0.2\var\www\webdav\Proyecto-web\Login.html">Login</a>
      </li>
      <li class="nav-item">
      <a class="nav-link" href="http://10.0.0.2\var\www\webdav\Proyecto-web\Carrito.php">Carrito</a>
      </li>
      <li class="nav-item">
      <a class="nav-link" href="http://10.0.0.2\var\www\webdav\Proyecto-web\Pedidos.php">Pedidos</a>
      </li>
  </ul>
  </div>
</nav>
<body>
<?php
    // Conexión a la base de datos
    include 'conexion.php';

    session_start();

    // Acceder a las variables de sesión
    $email = $_SESSION['email'];
    $id = $_SESSION['id'];

    // Especificar el directorio a buscar
    $directorio = 'pedidos/';

    // Especificar el patrón de búsqueda
    $patron = '*-' . $id . '.pdf';

    // Buscar archivos PDF que coincidan con el patrón
    $pdfs = glob($directorio . $patron);

    $i = 0;

    // Consulta a la base de datos
    $sql = "SELECT idUsuario, fechaPedido, fechaEntrega, estadoPedido, total, costoEnvio FROM pedidos where idUsuario = $id";
    $result = $con->query($sql);

    // Desplegar lista de pedidos
    echo "<table>";
    echo "<tr><th>Fecha de Pedido</th><th>Fecha de Entrega</th><th>Estado del Pedido</th><th>Total</th><th>Costo de Envío</th><th>Pdf</th></tr>";
    while($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" . $row["fechaPedido"] . "</td>";
        echo "<td>" . $row["fechaEntrega"] . "</td>";
        echo "<td>" . $row["estadoPedido"] . "</td>";
        echo "<td>" . $row["total"] . "</td>";
        echo "<td>" . $row["costoEnvio"] . "</td>";
        echo "<td>" .  "<a href='" . $pdfs[$i] . "'>" . $pdfs[$i] . "</a><br>" . "</td>";
        echo "</tr>";
        $i++;
    }
    echo "</table>";
    $con->close();
?>
</body>
</html>