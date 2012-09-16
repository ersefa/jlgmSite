---
title: "Google code prettify"
created_at: 2012-09-15 19:27:30 +0200
kind: article
ci: "/2012-09-15-google-code-prettify.md/"
published: true
---


#Introducción
Una de las primeras necesidades con las que me he encontrado al crear mi blog es la de mostrar código fuente formateado adecuadamente.
Si para vuestro blog utilizáis alguna herramienta de terceros, gestor de contenidos, etc. probablemente ya disponga de un modulo, plugin o similar para facilitaros la vida. Si por el contrario habéis creado vuestro blog desde 0, entonces os habréis encontrado con mi mismo problema.

En mi caso y tras una breve búsqueda me he decidido por utilizar "Google Code Prettify". 
Si conocéis otras herramientas o métodos vuestras aportaciones serán mas que bienvenidas.

#Requisitos
* Dificultad: Sencilla
* Conocimientos: 
	* JS: Básico
	* HTML, CSS: Básico
	* Haml, Markdown: Básico

Vamos a ensuciarnos las manos con un poco de código:

#Ejemplo

	void Quicksort(int* v, int b, int t){
    	int pivote;
     	if(b < t){
        		pivote=colocar(v, b, t);
        		Quicksort(v, b, pivote-1);
        		Quicksort(v, pivote+1, t);
     	}  
	}

#Manos a la obra

Para empezar accedemos al [repositorio](http://code.google.com/p/google-code-prettify/).
En él podremos encontrar los links de descarga, documentación, FAQ, los siempre útiles google groups, etc.

[Descargamos](http://code.google.com/p/google-code-prettify/downloads/detail?name=prettify-1-Jun-2011.tar.bz2&can=2&q=) su versión no minimizada que incluye documentación y tests (recordad que en producción siempre debemos utilizar las versiones minimizadas).

Una vez descomprimido podremos acceder a su README.html donde tenemos las instrucciones de instalación.

El primer paso es añadir la hoja de estilos y el JavaScript necesarios:


	<link href="prettify.css" type="text/css" rel="stylesheet"/>
	<script src="prettify.js" type="text/javascript"></script>

En nuestro caso lo debemos añadir a nuestro layout general (default.haml), para que dispongan de él todas nuestras páginas.
Como se trata de haml, debemos transformar la sintaxis. Quedarían de la siguiente forma:


	%link{:href => "/css/prettify.css", :rel => "stylesheet", :type => "text/css"}
	%script{:src =>"/js/prettify.js", :type => "text/javascript"}

Obviamente deberemos copiar los archivos en nuestro servidor e indicar la localización correcta.

Para activar y utilizar nuestro "prettyfier" vamos a seguir un camino ligeramente diferente al que nos proponen desde google.
Como utilizamos Markdown, vamos a integrarlo de tal forma que nos desentendamos de la sintaxis del propio prettify, sino que simplemente seguiremos añadiendo nuestro código en Markdown utilizando su sintaxis. 
Para ello crearemos este pequeño script que utiliza jQuery:


	%script{:type => "text/javascript"}
  		$(function() { 
  			$('code').addClass('prettyprint'); 
  			prettyPrint();
  		});

Con estas 4 lineas de código estamos indicando que a cada tag "code" generado por nuestro filtro Markdown le añadamos la clase "prettyprint" que es la que se utilizará para el coloreado y formateo de código.

Ya sólo nos queda introducir el código que nos apetezca, para ello recordar brevemente que para Markdown basta con identar nuestro código. La primera línea tendrá una identación de 4 espacios o un TAB. Las siguientes lineas seguirán siendo identadas según necesitemos.

Para mas información visitad la [página de sintaxis para Markdown](http://daringfireball.net/projects/markdown/syntax#code)

E voilá! ¿Sencillo verdad?.