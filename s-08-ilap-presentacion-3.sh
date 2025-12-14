#!/bin/bash
# s-08-ilap-presentacion-3.sh
# @Autor        : SCH / SAKCC
# @Fecha        : dd/mm/yyyy
# @Descripción  : Copia archivos binarios de laptops y facturas
#                 al directorio /tmp/bdd/proyecto-final/imagenes

set -e
set -o pipefail

# Copia de imágenes de laptops
if [ ! -d "/tmp/bdd/proyecto-final/imagenes/laptops" ]; then
  echo "Copiando imágenes - laptops de muestra"
  mkdir -p /tmp/bdd/proyecto-final/imagenes
  unzip carga-inicial/laptops.zip -d /tmp/bdd/proyecto-final/imagenes
else
  echo "=> Las imágenes - laptops de muestra ya fueron copiadas."
fi

# Copia de imágenes de facturas
if [ ! -d "/tmp/bdd/proyecto-final/imagenes/facturas" ]; then
  echo "Copiando imágenes - facturas de muestra"
  mkdir -p /tmp/bdd/proyecto-final/imagenes
  unzip carga-inicial/facturas.zip -d /tmp/bdd/proyecto-final/imagenes
else
  echo "=> Las imágenes - facturas de muestra ya fueron copiadas."
fi

# Permisos
chmod -R 755 /tmp/bdd/proyecto-final

echo "=> Copia de imágenes terminada."

