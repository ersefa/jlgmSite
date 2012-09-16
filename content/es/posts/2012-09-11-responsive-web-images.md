---
title: "Responsive web images - HiSRC"
created_at: 2012-09-11 02:17:53 +0200
kind: article
ci: "/2012-09-1-responsive-web-images.md/"
published: true
---

#Introducción

Cada dia un mayor porcentaje de personas acceden a la web a través de dispositivos móviles en lugar de desde su pc como hacían antaño. Es necesario por tanto dirigir nuestros esfuerzos a satisfacer esa demanda.

He de confesar que me considero un defensor del ["Responsive/Adaptative web Design".](http://www.alistapart.com/articles/responsive-web-design/) El diseño web adaptativo es uno de los diferentes enfoques que existen para satisfacer esa necesidad de "contenido móvil". 

La gracia de esta técnica es que no se hacen desarrollos paralelos o específicos para cada uno de los dispositibos existentes sino que creamos un sólo diseño adaptativo que mute y varie según la necesidad de disho dispositivo (diferentes tamaños, orientaciones y resoluciones de pantalla). Para ello se utilizan las llamadas "media queries", una poderosa herramienta introducida en la version 3 de CSS.

El motivo de este post no es para ensalzar sus virtudes sino precisamente para hablar de las técnicas existentes para atajar uno de sus mayores problemas: las imágenes.

Las imágenes en un diseño web adaptativo se cargan una sola vez y posteriormente se juega con porcentajes o anchos relativos para escalarlas o reducirlas según nuestras necesidades, pero en esencia es siempre la misma imagen. El problema reside en que tanto para un smartphone con una pantalla reducida, como para nuestra flamante pantalla fullHD del salón de casa se esta sirviendo la misma imagen. Para que la imagen sea mostrada con una calidad decente en nuestro televisor fullHD tiene que tener una calidad y tamaño adecuados, mientras que en nuestro móvil bastaría una mas pequeña y menos pesada. A esto se le une que en casa o la oficina casi siempre disponemos de conexiones de banda ancha mientras que en nuestros móviles cada KB cuenta.

Debemos decidir, por tanto, antes de hacer un request de imagen cual es la mas adecuada para mi dispositivo, bien la versión grande y pesada para mi televisión fullHD o bien la versión reducida y ligera que se cargará rápida y nítidamente en mi smartphone. Actualmente no existe forma directa de conseguirlo, aunque se prevee la incorporación de [nuevas semánticas para las próximas revisiones de HTML5.](http://www.w3.org/community/respimg/) 

Actualmente tenemos [diversas técnicas](http://css-tricks.com/which-responsive-images-solution-should-you-use/) para implementar esta funcionalidad. 

Podemos ver un listado resumido con sus pros y sun contras en [esta tabla](https://docs.google.com/spreadsheet/ccc?key=0Al0lI17fOl9DdDgxTFVoRzFpV3VCdHk2NTBmdVI2OXc#gid=0)

Este post tratará de como implementar esta funcionalidad con el método [HiSRC](https://github.com/teleject/hisrc), un plugin para jQuery.

#Requisitos
* Dificultad: Media
* Conocimientos:
	* HTML, CSS, CSS3: Intermedio
	* JavaScript: Básico

#Ejemplo
[HiSCR en estado puro](/examples/hisrc.html)

#Manos a la obra

##Funcionamiento de HiSRC:
* En un primer momento se carga una imagen de baja resolución que estará asociada al tag img de toda la vida.
* Dependiendo de la velocidad de conexión, del tamaño y resolución de pantalla:
	* Conexión lenta, baja resolución: Imagen para "móvil" cargada inicialmente.
	* Conexión / Resolución medias: Imagen de calidad intermedia que reemplazará a la de baja resolución.
	* Conexión / Resolución alta: Imagen de alta calidad que reemplazará a la de baja resolución.

Por tanto, el primer paso sería contar con una versión de baja, media y alta resolución para cada foto donde queramos aplicar HiSRC

Copiamos en nuestro directorio para JS el plugin descargado de su [página](https://github.com/teleject/hisrc).

Una vez tenemos nuestras fotos y archivos de HiSRC debemos incluirlo en nuestro proyecto. Lo haremos en nuestro default.haml layout. Debemos tener cargada previamente la libreria jQuery.

    %script{:src => "//ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"}
    %script{:src => "/js/hisrc.js"}

Debemos además indicar con jQuery que queremos que nuestras fotos sean tratadas con el método HiSRC, para ello:

	$(document).ready(function(){
	  $(".hisrc img").hisrc();
	  $(".hisrc img+img").hisrc({ useTransparentGif: true });
	})

Por último debemos añadir la clase .hisrc a las imagenes que necesitemos tratar:

	<h1>HiSRC Images</h1>   
    <div class="hisrc">
        <img src="imagen_baja_resolucion" data-1x="imagen_resolucion_media" data-2x="imagen_alta_resolucion">
    </div>

Opcionalmente, y si queremos optimizar la velocidad de procesamiento, podemos añadir:

	$.hisrc.speedTest();

Con esto estamos realizando la prueba de velocidad de conexión antes de cargar el DOM, y por tanto ahorramos tiempo.

##Ventajas:
* Sencillez.
* No necesita tecnologías de servidor.
* Siempre se mostrará una imagen como mínimo aunque el usuario desactive funcionalidades en su explorador.

##Desventajas:
 * Siempre habrá que pedir como mínimo la imagen de baja resolución inicialmente. Con dispositivos móviles no habría problema pues sólo hará esa petición. Con conexiones rápidas apenas se verá incrementado el tiempo de carga al tener que pedir las dos imagenes. Por tanto, es una desventaja no muy importante.
 * Si el usuario tiene JS desactivado sólo se mostrará la imagen inicial de baja resolución asociada al tag img independientemente del dispositivos, conexión, etc.
 * Hay que hacer una pequeña prueba de velocidad, con lo cual añade peso al cargar la página.


