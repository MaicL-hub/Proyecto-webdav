<?php
include 'conexion.php';
$carritoId = $_GET['id'];
session_start();

$email = $_SESSION['email'];
$id = $_SESSION['id'];

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

require 'PHPMailer/Exception.php';
require 'PHPMailer/PHPMailer.php';
require 'PHPMailer/SMTP.php';
require('fpdf/fpdf.php');

// Obtener los datos del carrito
$sql = "SELECT * FROM carritos WHERE id = $carritoId";
$result = $con->query($sql);

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();

    // Obtener las fechas y los valores del pedido del carrito
    $fechaPedido = $row['fechaPedido'];
    $fechaEntrega = $row['fechaEntrega'];
    $descuentos = $row['descuentos'];
    $subtotal = $row['subtotal'];

    // Calcular el total
    $total = $subtotal - $descuentos;

    // Establecer el estado de envío y el costo de envío
    $estadoEnvio = "enviado";
    $costoEnvio = 0;

    // Insertar el pedido en la tabla "pedidos"
    $sql = "INSERT INTO pedidos (id, idUsuario, fechaPedido, fechaEntrega, estadoPedido, total, costoEnvio) VALUES (0, $id, '$fechaPedido', '$fechaEntrega', '$estadoEnvio', '$total', '$costoEnvio')";
    $resultado = mysqli_query($con, $sql);

    // //
    // // *** To Email ***
    // // $to = 'a20310030@ceti.mx';
    // // $to = 'rsantana@ceti.mx';
    // $to = 'mikylopezesparza@gmail.com';
    // //
    // // *** Subject Email ***
    // $subject = 'Pedido recibido';
    // //
    // // *** Content Email ***
     $content = "Pedido:\nFecha pedido: " . $fechaPedido . "\nFecha entrega: " . $fechaEntrega . "\nEstado pedido: " . $estadoEnvio . "\nTotal: " . $total . "$";
    // //
    // //*** Head Email ***
    // //$headers = "From: mikylopezesparza@gmail.com\r\n";
    // $headers = "a20310030@ceti.mx\r\n";
    // //

    // mail($to, $subject, $content, $headers);


//Load Composer's autoloader
// require 'vendor/autoload.php';

//Create an instance; passing `true` enables exceptions

$nombrepdf = "pedido-" . $carritoId . "-" . $id . ".pdf";

$pdf = new FPDF();
$pdf->AddPage();
$pdf->SetFont('Arial','B',10);
$pdf->Cell(40,10,utf8_decode($content));
try{
    $pdf->Output('C:\xampp\htdocs\Github\pedidos\\' . $nombrepdf,'F');
}catch(e){

}

try{
    //$pdf->Output('\var\www\html\Proyecto-web\pedidos\\' . $nombrepdf . '.pdf','F');
}catch(e){

}


// $pdf->Output($nombrepdf, '/pedidos');

$mail = new PHPMailer(true);

try {
    //Server settings
    $mail->SMTPDebug = 0;                      //Enable verbose debug output
    $mail->isSMTP();                                            //Send using SMTP
    $mail->Host       = 'smtp.gmail.com';                     //Set the SMTP server to send through
    $mail->SMTPAuth   = true;                                   //Enable SMTP authentication
    $mail->Username   = 'a20310030@ceti.mx';                     //SMTP username
    $mail->Password   = 'iauo gjos vqnu ttcn';                               //SMTP password
    $mail->SMTPSecure = 'ssl';            //Enable implicit TLS encryption
    $mail->Port       = 465;                                    //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`

    //Recipients
    $mail->setFrom('a20310030@ceti.mx', 'Miguel Lopez');
    $mail->addAddress('a20310030@ceti.mx');     //Add a recipient
    // $mail->addAddress($email);               //Name is optional
    // $mail->addReplyTo('info@example.com', 'Information');
    // $mail->addCC('cc@example.com');
    // $mail->addBCC('bcc@example.com');

    //Attachments
    // $mail->addAttachment('/var/tmp/file.tar.gz');         //Add attachments
     $mail->addAttachment('C:\xampp\htdocs\Github\pedidos\\' . $nombrepdf . '.pdf', 'Pedido.pfd');    //Optional name
    // $mail->addAttachment('\var\www\html\Proyecto-web\pedidos\\' . $nombrepdf . '.pdf', 'Pedido.pfd');

    //Content
    $mail->isHTML(true);                                  //Set email format to HTML
    $mail->Subject = 'Pedido recibido';
    // $mail->Body    = $content;
    $mail->Body    = 'Pedido:';
    // $mail->AltBody = 'This is the body in plain text for non-HTML mail clients';

    $mail->send();
    echo 'Message has been sent';
    } catch (Exception $e) {
        echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
    }

    $sql = "DELETE FROM carritos WHERE id = $carritoId";
    $resultado = mysqli_query($con, $sql);
    mysqli_close($con);

if ($resultado) {
    header("Location: Carrito.php");
    exit();
} else {
    echo "Error al crear el pedido";
}
} else {
    echo "No se encontró el carrito con el ID proporcionado.";
}
?>