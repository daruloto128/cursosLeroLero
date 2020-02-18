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
                    <li class="nav-item active"><a class="nav-link" href="Instrutores.jsp">Instrutores</a></li>
                    <li class="nav-item"><a class="nav-link" href="Comentarios.jsp">Comentários</a></li>
                    <li class="nav-item"><a class="nav-link" href="Registro.jsp">Registro</a></li>
                    <li class="nav-item"><a class="nav-link"  href="Login.jsp">Login</a></li>
                    <li class="nav-item"><a class="nav-link disable" href="Tabelas.jsp">Tabelas</a></li>
                </ul>
            </nav>
            <h1>CONHEÇA NOSSOS INSTRUTORES:</h1>
            <hr>
            <div class="row">
                <div class="col-4">
                    <div class="card">
                        <div class="circle">
                            <img class="card-img-top" src="webResources/imagens/foto%20do%20danilo.jpg" alt="foto do instrutor 1">
                        </div>
                        <div class="card-body">
                            <h1 class="card-title">Instrutor 1</h1>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris at dolor in mi vehicula laoreet eu et sem. Proin convallis vehicula sem at laoreet. Duis tincidunt laoreet erat sed bibendum.</p>
                        </div>
                    </div>
                
                </div>
                <div class="col-4">
                    <div class="card">
                        <div class="circle">
                            <img class="card-img-top" src="webResources/imagens/instrutor2.png" alt="foto do instrutor 2">
                        </div>
                        <div class="card-body">
                            <h1 class="card-title">Instrutor 2</h1>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris at dolor in mi vehicula laoreet eu et sem. Proin convallis vehicula sem at laoreet. Duis tincidunt laoreet erat sed bibendum.</p>
                        </div>
                    </div>
                
                </div>
                <div class="col-4">
                    <div class="card">
                        <div class="circle">
                            <img class="card-img-top" src="webResources/imagens/instrutor3.jpg" alt="foto do instrutor 3">
                        </div>
                        <div class="card-body">
                            <h1 class="card-title">Instrutor 3</h1>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris at dolor in mi vehicula laoreet eu et sem. Proin convallis vehicula sem at laoreet. Duis tincidunt laoreet erat sed bibendum.</p>
                        </div>
                    </div>
                
                </div>
            </div>
            <hr>
            <div class="row">
                <div class="col-4">
                    <div class="card">
                        <div class="circle">
                            <img class="card-img-top" src="webResources/imagens/instrutor4.jpg" alt="foto do instrutor 4">
                        </div>
                        <div class="card-body">
                            <h1 class="card-title">Instrutor 4</h1>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris at dolor in mi vehicula laoreet eu et sem. Proin convallis vehicula sem at laoreet. Duis tincidunt laoreet erat sed bibendum.</p>
                        </div>
                    </div>
                
                </div>
                <div class="col-4">
                    <div class="card">
                        <div class="circle">
                            <img class="card-img-top" src="webResources/imagens/instrutor5.jpg" alt="foto do instrutor 5">
                        </div>
                        <div class="card-body">
                            <h1 class="card-title">Instrutor 5</h1>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris at dolor in mi vehicula laoreet eu et sem. Proin convallis vehicula sem at laoreet. Duis tincidunt laoreet erat sed bibendum.</p>
                        </div>
                    </div>
                
                </div>
                <div class="col-4">
                    <div class="card">
                        <div class="circle">
                            <img class="card-img-top" src="webResources/imagens/instrutor6.jpg" alt="foto do instrutor 6">
                        </div>
                        <div class="card-body">
                            <h1 class="card-title">Instrutor 6</h1>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris at dolor in mi vehicula laoreet eu et sem. Proin convallis vehicula sem at laoreet. Duis tincidunt laoreet erat sed bibendum.</p>
                        </div>
                    </div>
                
                </div>
            </div>    
        </div>
        <jps:include page="template/footer.jsp"/>
    </body>
</html>