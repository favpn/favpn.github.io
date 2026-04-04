
------------------------
# Ferramentas e Requisitos
_tools/get.js (Necessário Node.js e puppeteer)
Ruby v3.1.7
Jekyll

-----------
## Jekyll Reset
Caso tenha quebrado o runner (Ruby -v 3.1)

1- bundle clean --force
2- Remove-Item Gemfile.lock
3- rm C:\Users\Marcos\.local\share\gem
4- Jekyll serve

------------------------
# Base files e Site renderizado
O projeto consiste em dois repositórios

* favpn.site.source <- Codigo fonte do Site
* favpn.github.io <- Site Fav PORN

## Para documentação do tema Baleon
https://favpn.github.io/Documentation/index.html

------------------------
# Para publicações no site

### PN Embed/Main Pages
**Urls EMBED**
Facilidades para acessar o conteudo e obter dados do video

https://www.xvideos.com/embedframe/
https://xhamster.com/embed/
https://embed.redtube.com/?id=
https://www.pornhub.com/embed/

**Main Url**
https://www.xvideos.com/video.ID/video
https://xhamster.com/videos/ID
https://www.redtube.com.br/ID
https://pt.pornhub.com/view_video.php?viewkey=ID

------------------------
# Comandos Úteis

### Renomear vários de uma vez (VIA POWERSHELL)
```
$i=NUMERO_DO_ARQUIVO
Get-ChildItem -File | Sort-Object { [int]($_.BaseName -replace '\D') } | ForEach-Object {
  Rename-Item $_ -NewName ("AAAA-MM-DD-$i" + $_.Extension)
  $i++
}
```
**Editar o codigo acima antes!**

-----------
### Procurar trechos de texto em arquivos (VIA POWERSHELL)
```
Get-ChildItem -Recurse -Filter *."extensão do arquivo" | Select-String "texto que deve ser procurado"
```
Editar o codigo acima antes!

-----------
### Buildar o codigo fonte e exportar no outro repositório:

`jekyll build --incremental` *(Recomendado)*
ou
`bundle exec jekyll build --incremental`

-----------
#### Opções uteis:
`--incremental` <- *Renderiza apenas o que foi modificado*

`--destination {dir_export}` <- Especifica onde _site será buildado, aponte para o repositorio do site
