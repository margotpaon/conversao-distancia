# Use a imagem base do Python com Alpine para um contêiner leve
FROM python:3.9-alpine

# Defina o diretório de trabalho no contêiner
WORKDIR /app

# Copie o arquivo de dependências
COPY requirements.txt .
COPY templates/ /app/templates/
COPY main.py /app

# Instale as dependências
RUN pip install --no-cache-dir -r requirements.txt

# Copie o restante da aplicação para o contêiner
COPY app/ .

# Exponha a porta 5000 para acessar o serviço
EXPOSE 5000

# Comando para iniciar a aplicação
CMD ["python", "main.py"]
