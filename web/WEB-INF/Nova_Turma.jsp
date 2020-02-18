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
            <form id="formTUR" method="post" onsubmit="return validacaoTUR()">
                <h5>REGISTRO DA TURMA</h5>
                <div class="row">
                    <div class="form-group col-sm-6">
                        <label for="instrutor">Instrutor:*</label>
                        <input type="text" class="form-control" id="instrutor" placeholder="Digite o ID do instrutor">
                    </div>
                    <div class="form-group col-sm-6">
                        <label for="curso">Curso:*</label>
                        <input type="text" class="form-control" id="curso" placeholder="Digite o ID do curso">
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-sm-4">
                        <label for="dataini">Data de início:</label>
                        <input type="date" class="form-control" id="dataini" pattern="[0-9]{2}\/[0-9]{2}\/[0-9]{4}$" min="2020-02-02" max="2030-02-02">
                    </div>
                    <div class="form-group col-sm-4">
                        <label for="datafim">Data de término:</label>
                        <input type="date" class="form-control" id="datafim" pattern="[0-9]{2}\/[0-9]{2}\/[0-9]{4}$" min="2020-08-02" max="2032-02-02">
                    </div>
                    <div class="form-group col-sm-4">
                        <label for="carga">Carga horária:</label>
                        <input type="text" class="form-control" id="carga2">
                    </div>
                    <button type="submit" class="btn btn-primary">Enviar</button>
                </div>
            </form>
        </div>
        <jps:include page="template/footer.jsp"/>
        <script type="text/javascript">
                function validacaoTUR() {
                    var inst = document.getElementById("instrutor").value;
                    var curso = document.getElementById("curso").value;
                    var dataini = document.getElementById("dataini").value;
                    var datafim = document.getElementById("datafim").value;
                    var carga = document.getElementById("carga2").value;


                    function validTexto(valor, texto) {
                        if ((valor == null) || (valor == "") || (/^\s+$/.test(valor))) {
                            alert("Campo " + texto + " em branco.");
                            return false;
                        }
                    }
                    function validNum(valor, texto) {
                        if (isNaN(valor)) {
                            alert("Digite apenas números no " + texto + ".");
                            return false;
                        }
                    }

                    validTexto(inst, "Instrutor");
                    validNum(inst, "Instrutor");
                    validTexto(curso, "Curso");
                    validNum(curso, "Curso");
                    validNum(carga, "Carga Horária");

                    return true;
                }
        </script>
    </body>
</html>