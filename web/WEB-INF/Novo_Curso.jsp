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
                    <li class="nav-item"><a class="nav-link"  href="Login.jsp">Login</a></li>
                    <li class="nav-item active"><a class="nav-link disable" href="Tabelas.jsp">Tabelas</a></li>
                </ul>
            </nav>

                    
            <form id="formCUR" method="post" onsubmit="return validacaoCUR()">
                <h5>REGISTRO DO CURSO</h5>
                <div class="row">
                    <div class="form-group col-sm-6">
                        <label for="nome3">Nome:*</label>
                        <input type="text" class="form-control" id="nome3" placeholder="Digite seu nome">
                    </div>
                    <div class="form-group col-sm-3">
                        <label for="carga">Carga Horária:</label>
                        <input type="text" class="form-control" id="carga">
                    </div>
                    <div class="form-group clo-sm-3">
                        <label for="preço">Preço:</label>
                        <input type="text" class="form-control" id="preço" placeholder="Valor do curso">
                    </div>
                </div>
                <div class="form-group">
                    <label for="ementa">Ementa:</label>
                    <input type="ementa" class="form-control" id="ementa" placeholder="Ementa do curso">
                </div>
                <div class="form-group">
                    <label for="requisito">Requisito:</label>
                    <input type="requisito" class="form-control" id="requisito" placeholder="Requisitos do curso">
                </div>
                <button type="submit" class="btn btn-primary">Enviar</button>
            </form>
            
        </div>
        <jps:include page="template/footer.jsp"/>
        <script type="text/javascript">
                function validacaoCUR() {
                    var nome = document.getElementById("nome3").value;
                    var requisito = document.getElementById("requisito").value;
                    var ementa = document.getElementById("ementa").value;
                    var carga = document.getElementById("carga").value;
                    var preço = document.getElementById("preço").value;

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
                    function validNum(valor, texto) {
                        if (isNaN(valor)) {
                            alert("Digite apenas números no " + texto + ".")
                            return false;
                        }
                    }
                    function validLetra(texto, texto2) {
                        for (letra of texto) {
                            if (!isNaN(texto)) {
                                alert("Não digite números no " + texto2 + ".");
                                document.getElementById(texto).value = "";
                                return;
                            }
                            letraspermitidas = "ABCEDFGHIJKLMNOPQRSTUVXWYZ abcdefghijklmnopqrstuvxwyzáàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ"
                            var ok = false;
                            for (letra2 of letraspermitidas) {
                                if (letra == letra2) {
                                    ok = true;
                                }
                            }
                            if (!ok) {
                                alert("Não digite caracteres que não sejam letras ou espaços no " + texto2 + ".");
                                document.getElementById(texto).value = "";
                                return;
                            }
                        }
                    }

                    validTexto(nome, "Nome");
                    validTamanho(nome, 3, 50, "Nome");
                    validLetra(nome, "Nome");
                    validNum(carga, "Carga Horária");
                    validNum(preço, "Preço");

                    return true;
                }
        </script>
    </body>
</html>