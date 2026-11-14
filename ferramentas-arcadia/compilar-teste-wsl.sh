#!/bin/bash
# Arcádia — compilação de TESTE do EmulationStation no Ubuntu (WSL), em x86_64 nativo.
# Serve só para pegar erros de compilação rapidamente; a versão do aparelho é compilada
# pelo build da imagem (console-retro-os/ferramentas/wsl/compilar.ps1).
# Uso (no Ubuntu do WSL): bash compilar-teste-wsl.sh
set -e
ORIGEM="/mnt/d/Adube Sistemas/Console de Jogo/arcadia-emulationstation"
AREA="$HOME/arcadia-es-teste"

mkdir -p "$AREA"
rsync -a --delete --exclude .git --exclude build "$ORIGEM/" "$AREA/src/"
cd "$AREA/src"

cmake . -DCMAKE_BUILD_TYPE=Release -DENABLE_EMUELEC=1 -DDISABLE_KODI=1 -DENABLE_FILEMANAGER=1 -DENABLE_TTS=0 >/dev/null
make -j"$(nproc)" 2>&1 | grep -E "error|Error|warning: unused|\[100%\]|Linking" || true
test -x "$AREA/src/emulationstation" && echo "COMPILACAO-OK: $AREA/src/emulationstation"
