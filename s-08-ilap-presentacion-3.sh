#!/bin/bash
#@Autor: Jorge A. Rodríguez C
#@Fecha creación: dd/mm/yyyy
#@Descripción: Copia archivos binarios
#Si ocurre un error, el programa termina.
set -e
set -o pipefail
#En caso de no encontrar el directorio, extrae el contenido del archivo zip
if [ ! -d "/tmp/bdd/proyecto-final/imagenes/laptops" ]; then
echo "Copiando imágenes - laptops de muestra "
mkdir -p /tmp/bdd/proyecto-final/imagenes
unzip carga-inicial/laptops.zip -d /tmp/bdd/proyecto-final/imagenes
else
echo "=> Las imágenes - laptops de muestra ya fueron copiadas"
fi
if [ ! -d "/tmp/bdd/proyecto-final/imagenes/facturas" ]; then
echo "Copiando imágenes - facturas de muestra"
mkdir -p /tmp/bdd/proyecto-final/imagenes
unzip carga-inicial/facturas.zip -d /tmp/bdd/proyecto-final/imagenes
else
echo "=> Las imágenes - facturas de muestra ya fueron copiadas."
fi
#actualiza permisos
chmod -R 755 /tmp/bdd/proyecto-final