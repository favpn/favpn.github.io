@echo off
echo Compilando Jekyll...
cd %PROJECT_DIR%
REM Se usar Bundler
bundle exec jekyll build --destination docs
REM Se não usar Bundler, use: jekyll build

echo Concluído!
pause