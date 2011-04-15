<?php
if(isset($_POST['submit'])) {

$to = "jay.hanaford@gmail.com";
$subject = "Message from jayhanaford.com";
$name_field = $_POST['name'];
$email_field = $_POST['email'];
$message = $_POST['message'];
 
$body = "From: $name_field\n E-Mail: $email_field\n Message:\n $message";
 
echo "Thank you! Your message has been sent to $to!";
mail($to, $subject, $body);

} else {

echo "blarg!";

}
?> 


