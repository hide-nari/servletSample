<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
</head>
<body>
<h1><%= "Login Cust" %>
</h1>
<form method="post" action="auth">
    <input type="text" name="j_username" value="taro"/>
    <input type="password" name="j_password" value="pass"/>
    <input type="submit" value="login">
</form>
<br/>
<a href="people">Person Servlet</a>
</body>
</html>