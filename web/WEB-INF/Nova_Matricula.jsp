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
            <form id="formMAT" method="post" onsubmit="return validacaoMAT()">
                <h5>REGISTRO DA MATRÍCULA</h5>
                <div class="row">
                    <div class="form-group col-sm-6">
                        <label for="turma">Turma:*</label>
                        <input type="text" class="form-control" id="turma" placeholder="Digite o ID da turma">
                    </div>
                    <div class="form-group col-sm-6">
                        <label for="aluno">Aluno:*</label>
                        <input type="text" class="form-control" id="aluno" placeholder="Digite o ID do aluno">
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-sm-6">
                        <label for="data">Data da matrícula:</label>
                        <input type="date" class="form-control" id="data" pattern="[0-9]{2}\/[0-9]{2}\/[0-9]{4}$" min="2020-02-02" max="2021-02-02">
                    </div>
                    <div class="form-group col-sm-6">
                        <label for="nota">Nota:</label>
                        <input type="text" class="form-control" id="nota" placeholder="Digite a nota do aluno">
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">Enviar</button>
            </form>

        </div>
        <jps:include page="template/footer.jsp"/>
        <script type="text/javascript">
                function validacaoMAT() {
                    var turma = document.getElementById("turma").value;
                    var aluno = document.getElementById("aluno").value;
                    var data = document.getElementById("data").value;
                    var nota = document.getElementById("nota").value;

                    function validTexto(valor, texto) {
                        if ((valor == null) || (valor == "") || (/^\s+$/.test(valor))) {
                            alert("Campo " + texto + " em branco.");
                            return false;
                        }
                    }
                    function validNum(valor, texto) {
                        if (isNaN(valor)) {
                            alert("Digite apenas números no " + texto + ".")
                            return false;
                        }
                    }

                    validTexto(turma, "Turma");
                    validNum(turma, "Turma");
                    validTexto(aluno, "Aluno");
                    validNum(aluno, "Aluno");
                    validNum(nota, "Nota");

                    return true;
                }
        </script>
    </body>
</html>