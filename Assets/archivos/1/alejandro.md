# Modelo de Entidad-Relacion (ER)
## 1\. Entidad
- **Definicion:** Representa un objeto o concepto del mundo real identificable y almacenable en una base de datos.
- **Ejemplo:** Empleado, Cliente, Producto.
## 2\. Atributo
- **Definicion:** Caracteristica o propiedad que describe una entidad.
- **Ejemplo:** Nombre, Edad, Direccion.
## 3\. Relacion
- **Definicion:** Asociacion entre dos o mas entidades que indica como estan conectadas.
- **Ejemplo:** Trabaja-Para (entre Empleado y Empresa), Compra (entre Cliente y Producto).
## 4\. Cardinalidad
- **Definicion:** Indica la cantidad de instancias en una entidad que pueden estar asociadas con una instancia en la otra entidad.
- **Ejemplo:** 1 a N (uno a muchos), N a M (muchos a muchos).
## 5\. Clave Primaria
- **Definicion:** Atributo o conjunto de atributos que identifica de manera unica a cada instancia de una entidad.
- **Ejemplo:** ID de Empleado, Numero de Cliente.
## 6\. Clave Externa
- **Definicion:** Atributo que establece una relacion entre dos entidades y actua como clave primaria en la entidad relacionada.
- **Ejemplo:** ID de Empleado en una tabla de Proyectos para establecer la relacion Trabaja-En.
## 7\. Modelo Conceptual
- **Definicion:** Representacion abstracta de la estructura y relaciones en una base de datos.
- **Ejemplo:** Diagrama de entidad-relacion que ilustra entidades, atributos y relaciones.
## 8\. Normalizacion
- **Definicion:** Proceso de organizar datos en una base de datos para reducir redundancia y mejorar eficiencia.
- **Ejemplo:** Dividir una tabla grande en tablas mas pequenas y relacionarlas a traves de claves.
## 9\. Diagrama de Entidad-Relacion (DER)
- **Definicion:** Representacion visual de un modelo de entidad-relacion.
- **Ejemplo:** Un diagrama que muestra las entidades, atributos, relaciones y cardinalidades.
