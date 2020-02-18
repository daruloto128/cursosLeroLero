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
                <li class="nav-item active"><a class="nav-link" href="Comentarios.jsp">Comentários</a></li>
                <li class="nav-item"><a class="nav-link" href="Registro.jsp">Registro</a></li>
                <li class="nav-item"><a class="nav-link"  href="Login.jsp">Login</a></li>
                <li class="nav-item"><a class="nav-link disable" href="Tabelas.jsp">Tabelas</a></li>
            </ul>
        </nav>
        <h1>CESSÃO DE COMENTÁRIOS:</h1>
        <hr>
        <div class="row">
            <div class="col-3">
                <div class="card">
                    <div class="circle">
                        <img class="card-img-top" src="webResources/imagens/comentario%201.jpg" alt="foto do curso">
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Cliente insatisfeito</h5>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam nec ligula venenatis, mollis felis id, scelerisque eros.</p>
                    </div>
                </div>  
            </div>  
            <div class="col-3">
                <div class="card">
                    <div class="circle">
                        <img class="card-img-top" src="webResources/imagens/comentario2.jpg" alt="foto do curso">
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Cliente curioso</h5>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam nec ligula venenatis, mollis felis id, scelerisque eros.</p>
                    </div>
                </div>  
            </div> 
            <div class="col-3">
                <div class="card">
                    <div class="circle">
                        <img class="card-img-top" src="webResources/imagens/comentario3.jpeg" alt="foto do curso">
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Cliente desesperado</h5>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam nec ligula venenatis, mollis felis id, scelerisque eros.</p>
                    </div>
                </div>  
            </div> 
            <div class="col-3">
                <div class="card">
                    <div class="circle">
                        <img class="card-img-top" src="webResources/imagens/comentario4.jpg" alt="foto do curso">
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Cliente Putasso</h5>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam nec ligula venenatis, mollis felis id, scelerisque eros.</p>
                    </div>
                </div>  
            </div> 

        </div>
    </div>
<jps:include page="template/footer.jsp"/>
</body>
</html>