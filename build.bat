@echo off

REM Caminhos
SET ROOT=D:\Pessoal\Documentos\GitHub\favpn.github.io
SET BASE=%ROOT%\base

echo =====================
echo LIMPANDO RAIZ
echo =====================

cd /d %ROOT%

REM Remove pastas (exceto base, .git, .github)
for /d %%D in (*) do (
    if /I not "%%D"=="base" (
        if /I not "%%D"==".git" (
            if /I not "%%D"==".github" (
                rmdir /s /q "%%D"
            )
        )
    )
)

REM Remove arquivos (exceto essenciais)
for %%F in (*) do (
    if /I not "%%F"=="base" (
        if /I not "%%F"==".gitignore" (
            if /I not "%%F"==".nojekyll" (
                if /I not "%%F"=="CNAME" (
                    del /q "%%F"
                )
            )
        )
    )
)

echo =====================
echo BUILDANDO JEKYLL
echo =====================

cd /d %BASE%

call jekyll build --incremental

IF %ERRORLEVEL% NEQ 0 (
    echo.
    echo ERRO NO BUILD!
    pause
    exit /b
)

echo =====================
echo COPIANDO SITE
echo =====================

xcopy /E /Y /I "%BASE%\_site\*" "%ROOT%"

echo =====================
echo FINALIZADO!
echo =====================
pause