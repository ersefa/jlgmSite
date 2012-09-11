---
title: "Responsive web images"
created_at: 2012-09-11 02:17:53 +0200
kind: article
published: false
---
Ejemplo:

Requisitos previos:
Conocimiento intermedio de HTML.
Conocimiento intermedio de CSS y CSS3.
Conocimientos básicos de JavaScript.

Recursos:

I amar prestar aen (El Mundo ha cambiado) 
Han mathon ne nen (Lo siento en el agua) 
Han mathon ne chae (Lo siento en la tierra) 
A han noston ned gwilith (Lo huelo en el aire).

En el caso del desarrollo web, ese anillo que lo cambia todo no son mas que toda esa plaga de dispositivos móviles que tenemos a nuestro alcance. Cada dia un mayor porcentaje de personas acceden a la web a través de dispositivos móviles en lugar de desde su pc como hacían antaño. Es necesario por tanto dirigir nuestros esfuerzos a satisfacer esa demanda.

He de confesar que me considero un defensor del "Responsive/Adaptative web Design", o lo que es lo mismo: "Diseño web adaptativo". Es uno de los diferentes enfoques que existen para satisfacer esa necesidad de "contenido móvil".

Para aquellos que les suene a chino: esta técnica de desarrollo y diseño consiste en crear tu sitio web de tal forma que se adapte a cualquier tamaño de pantalla, resolución, orientación, etc. Es decir, que se pueda adaptar a cualquier dispositivo, ya sea un smartphone, un tablet o el pc de sobremesa. 

La gracia de esta técnica es que no se hacen desarrollos paralelos o específicos para estos dispositivos sino que creamos un sólo diseño adaptativo que mute y varie según esas variables comentadas anteriormente. Para ello se utilizan las llamadas "media queries", una poderosa herramienta introducida en la version 3 de CSS.

El motivo de este post no es para ensalzar sus virtudes sino precisamente para hablar de las técnicas existentes para atajar uno de sus mayores problemas: las imágenes.
Las imágenes en un diseño web adaptativo se cargan una sola vez y posteriormente se juega con porcentajes o anchos relativos para escalarlas o reducirlas según nuestras necesidades, pero en esencia es siempre la misma imagen.

La situación es la siguiente: 
Tenemos una sola página para cualquier dispositivo, es decir, tenemos un conjunto de imagenes que se deben mostrar tanto en una resolución fullHD (o mayor), como en una triste pantalla de un smartphone de primera generación. 
Obviamente si queremos mostrar esas fotos con un mínimo de calidad en una pantalla fullHD debemos tener una foto con una resolución medianamente decente, lo que equivale a un peso medianamente elevado.
Si cargamos la página desde nuestro flamante fullHD con nuestra conexión superVitaminada de fibra óptica, todo genial, pero... y al cargar esa página desde nuestro triste smartphone de madera¿?. En ese caso para una irrisoria resolución estaremos también cargando dichas fotos de alta resolución y que con nuestra triste conexión móvil tardarán un año en cargarse y nos acordaremos del padre del desarrollador por acabar con nuestra tarifa de datos.

Lo ideal sería saber las condiciones del dispositivo previamente a la petición de las fotos. Si se hace desde un móvil mandar una versión de dichas fotos con menor resolución, si se hace desde un fullHD pues resolución a tope. Otro tanto pasaría con las pantallas Retina de los iphone. En este último caso quizás unas imagenes intermedias.

Para solventar este problema existen diversas técnicas. Os proporcionaré enlaces para que decidais cual es la mas apropiada para vuestro caso. Entraré mas en detalle en la solución que yo he adoptado para mi página.
