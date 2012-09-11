---
title: "Portfolio estático con nanoc"
created_at: 2012-09-11 12:01:34 +0200
kind: article
published: false
---

Si habeis seguido mi anterior post sobre crear un blog estático con nanoc este tutorial será pan comido.
Hasta el momento mi página de proyectos (portfolio) ha consistido en una única página html, a partir de ahora cada proyecto tendrá su propia página y serán llamados desde una "landing page" para ser mostrados. 
Es decir, seguirá el mismo comportamiento que el blog.

Cuando creabamos nuestro blog podíamos utilizar un helper que viene incluído con nanoc Nanoc::Helpers::Blogging, para nuestro portfolio crearemos un nuevo helper desde cero. 

Los pasos serían muy sencillos:
*Crear un identificador común en las páginas asociadas a proyectos para posteriormente poder recuperarlas y mostrarlas.
*Crear un helper desde cero, igual que utilizabamos Nanoc::Helpers::Blogging para nuestro blog.
*Posteriormente utilizaremos este helper desde nuestra "landing page" para mostrar todos nuestros trabajos.
*Añadiremos en rules.rb las nuevas rutas y reglas de compilación.
*Crearemos un layout específico para nuestras páginas de portfolio.


##Meta tags para nuestras páginas de portfolio

---
title: Proyecto1
url: http://proyecto1.com
created_at: 2012-09-11
kind: portfolio
---

Esta es mi página para el proyecto 1.

El tag clave sería kind: portfolio, identifica nuestra página como un elemento para nuestro porfolio.
Crearemos por tanto un directorio donde almacenar nuestros diferentes páginas de portfolio, por ejemplo en /content/portfolio/ y dentro de él iremos añadiendo nuestras páginas, para empezar crearemos la anteriormente descrita /content/portfolio/2012-09-11-Proyecto1.md


##Creación del helper

module PortfolioHelper

  def portfolios
    @items.select { |item| item[:kind] == 'portfolio' }
  end

  def sorted_portfolios
    portfolios.sort_by { |p| attribute_to_time(p[:created_at]) }.reverse
  end

  def portfolio_image_url(item, type)
    '/images/portfolio/' + item[:image_id] + '_' + type + '.jpg'
  end
end

Crearemos un nuevo helper en /lib/helpers/portfolio.rb con el contenido anterior.
Es importante no olvidarse de incluir dicho helper en nuestro índice de helpers /lib/helpers_.rb 
Para ello basta con escribir include PortfolioHelper 

Las funciones anteriores son muy similares a las que se utilizan para blogging. 
Tenemos una función portfolios donde guardamos un listado con nuestros "items" que se correspondan a páginas de portfolio. Para ello el atributo kind: portfolio.

Sorted_portfolios ordena nuestro listado por fecha ascendente, es decir, los mas nuevos primero.

##Renderizado en nuestra "landing page"
Crearemos nuestra "landing page" en /content/portfolio.haml
En mi caso el codigo HTML está construido con HAML, pero puede ser cualquier tipo de lenguaje de marcado, ya sea ERB, HMTL de toda la vida, etc. Simplemente se debe indicar en nuestro rules.rb que filtro debe ser aplicado.
