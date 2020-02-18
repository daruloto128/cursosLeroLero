<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
    <jps:include page="template/cabecalho.jsp"/>
    <link rel="stylesheet" type="text/css" href="resources/css/index.css" media="screen">
    <title>CursosLeroLero</title>
    </head>
    <body>
        <div class="container">
            <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link" href="Index.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="Sobre.jsp">Sobre</a></li>
                    <li class="nav-item"><a class="nav-link" href="Instrutores.jsp">Instrutores</a></li>
                    <li class="nav-item"><a class="nav-link" href="Comentarios.jsp">Comentários</a></li>
                    <li class="nav-item"><a class="nav-link" href="Registro.jsp">Registro</a></li>
                    <li class="nav-item active"><a class="nav-link"  href="Login.jsp">Login</a></li>
                    <li class="nav-item"><a class="nav-link disable" href="Tabelas.jsp">Tabelas</a></li>
                </ul>
            </nav>
            <form id="form" method="post" onsubmit="return validacao()">
                <div class="form-group">
                    <label for="login">Login:</label>
                    <input type="text" class="form-control" id="login" placeholder="Digite seu login">
                </div>
                <div class="form-group">
                    <label for="senha">Senha:</label>
                    <input type="password" class="form-control" id="senha" placeholder="Senha">
                </div>
                <button type="submit" class="btn btn-primary">Enviar</button>
            </form>


        </div>
        <jps:include page="template/footer.jsp"/>
        <script type="text/javascript">
                function validacao() {

                    var login = document.getElementById("login").value;
                    var senha = document.getElementById("senha").value;

                    function validTexto(valor) {
                        if ((valor == null) || (valor == "") || (/^\s+$/.test(valor))) {
                            alert("Campo(s) obrigatório(s) em branco.");
                            return false;
                        }
                    }
                    validTexto(login);
                    validTexto(senha);
                    return true;
                }
        </script>
    </body>
</html>
