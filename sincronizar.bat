@echo off
setlocal
REM Sincroniza los mods del servidor Mundo 1.
REM Coloca este archivo en la carpeta .minecraft de tu instancia y haz doble clic.

REM Trabajar siempre en la carpeta donde esta este .bat, no desde donde se lanzo
cd /d "%~dp0"

set "URL=https://raw.githubusercontent.com/EliseoSantos2468/minecraft-mundo1-pack/main/pack.toml"
set "JAR=%~dp0packwiz-installer-bootstrap.jar"
set "JARURL=https://github.com/packwiz/packwiz-installer-bootstrap/releases/download/v0.0.3/packwiz-installer-bootstrap.jar"

where java >nul 2>&1
if errorlevel 1 (
  echo.
  echo [ERROR] No se encontro Java en el sistema.
  echo Instala Java 21 desde https://adoptium.net y vuelve a intentarlo.
  echo.
  pause
  exit /b 1
)

if not exist "%JAR%" (
  echo Descargando el instalador de packwiz...
  curl -L --fail -o "%JAR%" "%JARURL%" 2>nul
)

if not exist "%JAR%" (
  echo Reintentando la descarga con PowerShell...
  powershell -NoProfile -Command "try { Invoke-WebRequest -Uri '%JARURL%' -OutFile '%JAR%' } catch { exit 1 }"
)

if not exist "%JAR%" (
  echo.
  echo [ERROR] No se pudo descargar el instalador.
  echo Bajalo a mano desde:
  echo   %JARURL%
  echo y guardalo en esta misma carpeta:
  echo   %~dp0
  echo.
  pause
  exit /b 1
)

echo.
echo Sincronizando mods en: %~dp0
echo.
java -jar "%JAR%" -g -s client "%URL%"

echo.
if errorlevel 1 (
  echo [ERROR] La sincronizacion fallo. Revisa los mensajes de arriba.
) else (
  echo Listo. Los mods estan sincronizados.
)
pause
