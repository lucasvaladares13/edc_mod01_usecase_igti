#!/usr/bin/env bash

cd infrastructure

# Declara variavel para reutilização nas validações do diretorio
PACKAGE="package"

# Cria o diretorio e instala as dependencias da função lambda
if [ -d $PACKAGE]
then
    echo   "O Diretorio "$PACKAGE" já existe."
else
    echo "====================================="
    echo "Criando o diretorio "$PACKAGE"..."
    mkdir $PACKAGE
    echo "O diretorio "$PACKAGE" foi criado."
    echo "====================================="
fi

# Declara variavel que localiza o requirements com as dependencias do projeto
FILE_REQUIREMENTS=../etl/lambda_requirements.txt

# Verifica se o arquivo lambda_requirements existe
if [ -d $FILE_REQUIREMENTS]
then
    echo "====================================="
    echo "Instalando dependencias localizadas no "$FILE_REQUIREMENTS""
    pip install --target ./package -r $FILE_REQUIREMENTS
    echo "Dependencias intaladas com sucesso."
    echo "====================================="
fi

cd $PACKAGE

# Declara variavel que localiza a função lambda para reutilização no codigo
LAMBDA_FUNCTION=../etl/lambda_function.py

# Verifica se o arquivo lambda_requirements existe
if [ -f $LAMBDA_FUNCTION]
then
    echo "====================================="
    echo "Copiando função Handler..."
    cp $LAMBDA_FUNCTION .
    echo "Compactando arquivo lambda_function_payload.zip"
    zip -r9 ../lambda_function_payload.zip .#Compacta o pacote para o deploy
    pip install --target ./package -r $FILE_REQUIREMENTS
    echo "Arquivo compactado com sucesso."
    echo "====================================="
fi

cd ..



