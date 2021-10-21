# PaPimPum
* Juego estilo [Guitar Hero](https://es.wikipedia.org/wiki/Guitar_Hero) por las mecanicas basicas de este juego, pero el resto no tiene mucho que ver
* Implementacion de un sistema de configuraciones en el cual se pueden modificar los valores de los [SFX](https://nebulargroup.com/knowledgebase/sfx-efectos-de-sonido/)
* Todos los datos se almacenan en un mismo archivo llamado *save.txt*. 
  * Algunos de estos datos son: highscore, volumen de sonido y musica, si esta activo o no el modo ahorrador de recursos, entre otros
  * Este archivo, puede ser eliminado en el menu de configuraciones dando como resultado que se borraran todos estos datos almacenados, es decir, se empezara de 0
* Está adaptado para que sea jugado en dispositivos Android
* Al ser el primer juego utilizando esta mecanica, se pueden experimentar algunos errores

---
<h1 align=center>Demostracion<h1/>
<p align="center">
 <img align= center height=300px widht=300px src=https://github.com/MarcoPaoletta/PaPimPum/blob/master/lobby.png>
 <img align= center height=300px widht=300px src=https://github.com/MarcoPaoletta/PaPimPum/blob/master/settings.png> 
 <img align= center height=300px widht=300px src=https://github.com/MarcoPaoletta/PaPimPum/blob/master/audio_settings.png>
<p/>

---

# Descargar Godot Engine e importar el proyecto
---

## Descargar Godot Engine

* Accedemos al sitio oficial de [Godot Engine](https://godotengine.org/download) en la parte de descargas
* Seleccionamos nuestro sistema operativo
* Descargamos la **Standard version**
* Extraemos el archivo comprimido
* Esto nos dejara el ejecutable de Godot Engine

---

## Importar el proyecto

* Una vez descargado los archivos del proyecto, movemos la carpeta a una ruta de preferencia
* Abrimos Godot Engine y en la parte de la derecha buscamos el boton **Import** o **Importar**
* Escribimos la ruta del proyecto o buscamos manualmente en la carpeta del proyecto el archivo project.godot 
* Nos abrira el projecto y podremos ejecutarlo desde ahi tocando **F5** o en la parte superior derecha con el boton de play
