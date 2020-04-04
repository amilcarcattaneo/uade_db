# UADE 2020 - Base de Datos
## Entregas
- Viernes 3 de Abril
	- [X] **Modelo físico de la Base de Datos**

---

## Clonar el Proyecto
`git clone https://github.com/amilcarcattaneo/uade_db`

## Subir cambios a Github
* Ahora, antes de modificar cualquier archivo, queremos hacer un pull, es decir, traer todos los cambios que estén en el repositorio remoto y que en nuestra versión local no estén. Para poder empezar a modificar teniendo la última versión y evitar posibles conflictos en los archivos.

```
git fetch
git pull origin master
```

## Agregar o Modificar Scripts
Para agregar un script, la idea es crear un archivo **db.X.X.X.sql** dentro de la carpeta **db/** (siempre sumándole uno a la versión anterior). O si estás modificando un script actual, hacelo sin problema dentro del mismo archivo.

* Una vez que ya tenemos nuestro cambios y estamos listos para subirlos a Github tenemos que hacer un commit con una descripción corta del por qué del cambio.

```
git add .
git commit -m “Descripcion del cambio”  
```

* Ahora sí estamos en condiciones de subir los cambios al repositorio remoto para que todos puedan tener tus cambios.

`git push origin master`

