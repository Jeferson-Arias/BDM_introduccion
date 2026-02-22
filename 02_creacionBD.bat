echo.
echo 0) Baja todos los contenedores activos...
docker compose down -v

echo.
echo 1) Eliminando información de la carpeta data...
rmdir /s /q data
mkdir data

echo.
echo 2) Levantando contenedor...
docker compose up -d

echo.
echo 3) Esperando a que MariaDB inicie...

:waitMariaDB
docker exec mariadb_db mariadb -u root -proot123 -e "USE entidadesTerritorialesColombia; SHOW TABLES;" >nul 2>&1
if errorlevel 1 (
    timeout /t 3 /nobreak >nul
    goto waitMariaDB
)

echo MariaDB lista.

echo.
echo 4) Entrando a la terminal de MySQL...
docker exec -it mariadb_db mariadb -u root -proot123 entidadesTerritorialesColombia