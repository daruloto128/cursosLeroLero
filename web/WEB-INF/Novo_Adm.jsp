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
                    <li class="nav-item"><a class="nav-link" href="Comentarios.jsp">Coment·rios</a></li>
                    <li class="nav-item"><a class="nav-link" href="Registro.jsp">Registro</a></li>
                    <li class="nav-item"><a class="nav-link"  href="Login.jsp">Login</a></li>
                    <li class="nav-item active"><a class="nav-link disable" href="Tabelas.jsp">Tabelas</a></li>
                </ul>
            </nav>
            <form id="formADM" method="post" onsubmit="return validacaoADM()">
                <h5>REGISTRO DE ADMINISTRADOR</h5>
                <div class="form-group">
                    <label for="nome">Nome:*</label>
                    <input type="text" class="form-control" id="nome" placeholder="Digite seu nome">
                </div>
                <div class="form-group">
                    <label for="login:">Login:*</label>
                    <input type="text" class="form-control" id="login" placeholder="Digite seu login">
                </div>
                <div class="row">
                    <div class="form-group col-sm-6">
                        <label for="senha">Senha:*</label>
                        <input type="password" class="form-control" id="senha" placeholder="Senha">
                    </div>
                    <div class="form-group col-sm-6">
                        <label for="resenha">ConfirmaÁ„o da senha:*</label>
                        <input type="password" class="form-control" id="resenha" placeholder="Reescreva a senha">
                    </div>       
                    <button type="submit" class="btn btn-primary">Enviar</button>
                </div>
            </form>            
            
        </div>
        <jps:include page="template/footer.jsp"/>
        <script type="text/javascript">
                function validacaoADM() {
                    var nome = document.getElementById("nome").value;
                    var login = document.getElementById("login").value;
                    var senha = document.getElementById("senha").value;
                    var resenha = document.getElementById("resenha").value;

                    if (senha != resenha) {
                        alert("As senhas devem ser iguais.");
                        return false;
                    }
                    function validTexto(valor, texto) {
                        if ((valor == null) || (valor == "") || (/^\s+$/.test(valor))) {
                            alert("Campo " + texto + " em branco.");
                            return false;
                        }
                    }
                    function validTamanho(valor, min, max, texto) {
                        if ((valor.length < min) || (valor.length > max)) {
                            if (min == max) {
                                alert("O " + texto + " precisa ter " + min + " letras.")
                            } else {
                                if (valor.length < min) {
                                    alert("O " + texto + " precida ter mais que " + min + " letras.");
                                }
                                if (valor.length > max) {
                                    alert("O " + texto + " precida ter menos que " + max + " letras.");
                                }
                            }
                            return false;
                        }
                    }
                    function validLetra(texto, texto2) {
                        for (letra of texto) {
                            if (!isNaN(texto)) {
                                alert("N„o digite n˙meros no " + texto2 + ".");
                                document.getElementById(texto).value = "";
                                return;
                            }
                            letraspermitidas = "ABCEDFGHIJKLMNOPQRSTUVXWYZ abcdefghijklmnopqrstuvxwyz·‡‚„ÈËÍÌÔÛÙıˆ˙ÁÒ¡¿¬√…»Õœ”‘’÷⁄«—"
                            var ok = false;
                            for (letra2 of letraspermitidas) {
                                if (letra == letra2) {
                                    ok = true;
                                }
                            }
                            if (!ok) {
                                alert("N„o digite caracteres que n„o sejam letras ou espaÁos no " + texto2 + ".");
                                document.getElementById(texto).value = "";
                                return;
                            }
                        }
                    }

                    validTexto(nome, "Nome");
                    validTamanho(nome, 3, 50, "Nome");
                    validLetra(nome, "Nome");
                    validTexto(login, "Login");
                    validTamanho(login, 6, 20, "Login")
                    validTexto(senha, "Senha");
                    validTamanho(senha, 6, 25, "Senha");

                    return true;
                }
        </script>
    </body>
</html>