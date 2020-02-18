<%@page contentType="text/html;charset=UTF-8" language="java" %>
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
                <li class="nav-item active"><a class="nav-link" href="Index.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="Sobre.jsp">Sobre</a></li>
                <li class="nav-item"><a class="nav-link" href="Instrutores.jsp">Instrutores</a></li>
                <li class="nav-item"><a class="nav-link" href="Comentarios.jsp">Comentários</a></li>
                <li class="nav-item"><a class="nav-link" href="Registro.jsp">Registro</a></li>
                <li class="nav-item"><a class="nav-link"  href="Login.jsp">Login</a></li>
                <li class="nav-item"><a class="nav-link disable" href="Tabelas.jsp">Tabelas</a></li>
            </ul>
        </nav>
        <h1>CONHEÇA NOSSOS CURSOS:</h1>
        <hr>
        <div class="row">
            <div class="col-4">
                <div class="card" >
                    <div class="circle">
                        <img class="card-img-top" src="resources/imagens/Hml%205.png"  alt="foto do curso">
                    </div>
                    <div class="card-body">
                        <h1 class="card-title">Curso completo de HTML5</h1>
                        <p class="card-text">HTML é Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris at dolor in mi vehicula laoreet eu et sem. Proin convallis vehicula sem at laoreet. Duis tincidunt laoreet erat sed bibendum</p>
                    </div>
                    <div  class="card-footer">
                        <a href="#" class="btn btn-primary">Adquirir curso</a>
                    </div>
                </div>
            </div>
            <div class="col-4">
                <div class="card" >
                    <div class="circle">
                        <img class="card-img-top" src="resources/imagens/logo-2582747_960_720.png" alt="icone css">
                    </div>
                    <div class="card-body">
                        <h1 class="card-title">Curso completo de CSS</h1>
                        <p class="card-text">CSS é Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris at dolor in mi vehicula laoreet eu et sem. Proin convallis vehicula sem at laoreet. Duis tincidunt laoreet erat sed bibendum.</p>
                    </div>
                    <div  class="card-footer">
                        <a href="#" class="btn btn-primary">Adquirir curso</a>
                    </div>
                </div>
            </div>
            <div class = "col-4">
                <div class="card" >
                    <div class="circle">
                        <img class="card-img-top" src="resources/imagens/javascript.png"  alt="icone javascript">                        
                    </div>
                    <div class="card-body">
                        <h1 class="card-title">Curso completo de JavaScript</h1>
                        <p class="card-text">JavaScript é Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris at dolor in mi vehicula laoreet eu et sem. Proin convallis vehicula sem at laoreet. Duis tincidunt laoreet erat sed bibendum.</p>
                    </div>
                    <div  class="card-footer">
                        <a href="#" class="btn btn-primary">Adquirir curso</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
<jps:include page="template/footer.jsp"/>
</body>
</html>
