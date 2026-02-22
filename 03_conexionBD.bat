@echo off

:waitMariaDB
docker exec mariadb_db mariadb -u root -proot123 -e "USE entidadesTerritorialesColombia; SHOW TABLES;" >nul 2>&1
if errorlevel 1 (
    timeout /t 3 /nobreak >nul
    goto waitMariaDB
)

echo.
echo Comprobando extension MySQL Client...
code --list-extensions | findstr /I "cweijan.vscode-mysql-client2" >nul 2>&1
if errorlevel 1 (
    echo Instalando extension...
    code --install-extension cweijan.vscode-mysql-client2 --force
) else (
    echo Extension ya instalada.
)
echo.
echo La conexion se carga automaticamente desde .vscode/settings.json
endlocal