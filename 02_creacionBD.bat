@echo off

echo.
echo 0) Baja todos los contenedores activos...
docker compose down -v

echo.
echo 1) Eliminando información de la carpeta data...
rmdir /s /q data
mkdir data

echo.
echo 2) Levantando contenedores...
docker compose up -d

echo.
echo 3) Esperando a que el loader termine...
docker wait mariadb_loader

echo.
echo 4) Entrando a la terminal de MySQL...
docker exec -it mariadb_db mariadb -u root -proot123 entidadesTerritorialesColombia