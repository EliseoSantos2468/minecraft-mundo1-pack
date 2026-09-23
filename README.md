# Mundo 1 — Vanilla+

Modpack del servidor de Minecraft **1.21.1 / NeoForge 21.1.251** (42 mods).

## Instalación

1. Instala [Prism Launcher](https://prismlauncher.org) y crea una instancia de **Minecraft 1.21.1 con NeoForge**.
2. Descarga [packwiz-installer-bootstrap.jar](https://github.com/packwiz/packwiz-installer-bootstrap/releases/latest) y déjalo en la carpeta de la instancia (Editar instancia → Carpeta).
3. En *Editar instancia → Configuración → Comandos personalizados → Comando previo al lanzamiento*, pega:

```
java -jar packwiz-installer-bootstrap.jar https://raw.githubusercontent.com/EliseoSantos2468/minecraft-mundo1-pack/main/pack.toml
```

Cada vez que pulses Jugar, los mods se sincronizan solos: descarga los nuevos, actualiza los cambiados y borra los que se hayan quitado.

## Sin Prism Launcher

Ejecuta esto dentro de la carpeta `.minecraft` de tu instancia cada vez que se avise de cambios:

```
java -jar packwiz-installer-bootstrap.jar -g -s client https://raw.githubusercontent.com/EliseoSantos2468/minecraft-mundo1-pack/main/pack.toml
```
