#!/usr/bin/env bash

#Regex para extrair informações de sites se baseando em padrãos html
curl http://lxer.com | grep blurb | sed 's/<div.*line">'// | sed 's/<\/span.*//'

#OBS.: Quando temos mais de uma expressão regular é posível separar por ; ao invés de |
curl http://lxer.com | grep blurb | sed 's/<div.*line">//;s/<\/span.*//'

#curl http://lxer.com ~> vai pegar o codigo fonte da pátina
#grep blurb vai filtrar pelo padrão blurb