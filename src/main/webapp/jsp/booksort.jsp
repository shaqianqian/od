<%@page import="car.tp4.entity.Book"%>
<%@page import="java.util.Collection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mystyle.css">
<title>Acceuil</title>
</head>
<body>
<div class="button">
	<form method="post" action="search">
		<button type="submit" name="init" value="init">Homepage</button>
	    </form>
	
  </div>
  
	<br>

	 <h2 align="center">Les livres selon l'année de parution</h2>
 <div class="centre1">
		<table border="1" class="dataintable">
		<tr>
		    <th>Id</th>
			<th>Titre</th>
			<th>Auteur</th>
			<th>
			<form method="post" action="booksSort">
			<input type="submit" name="type" value="-->"  /> 
			<input type="submit" name="type" value=" <-- "  /> 
			</form>
			</th>
			<th>Quantite</th>
			<th>BuyBuy</th>
		</tr>
		<%
            Collection<Book> books = (Collection<Book>) request.getAttribute("books");
	     
            for (Book book: books) {
            	if(book.getQuantite() <= 0){
        	
            	}
            	else
            	{
        	%>
		<form method="POST" action="panier">
			<input type="hidden" name="bookId" value=<%=book.getId()%>> 
			<input type="hidden" name="type" value="add">
			<%
			out.print("<tr><td> " + book.getId() + "</td><td><a href=\"/book?id=" + book.getId() + "\">" + book.getTitle() + "</td><td>"
					+ book.getAuthor() + "</td><td> " + book.getYear() + "</td><td> " + book.getQuantite()
					+ "</td><td><input type=\"submit\"  \"name=\"order\" value=\"Ajouter au panier\"></td></tr>");
			%>
		</form>
		<%
            	}
            }
		%>
		</table></div>

</body>

<style>
table {
	border-collapse: collapse;
}

td, th /* Mettre une bordure sur les td ET les th */ {
	border: 1px solid black;
}
</style>
</html>
