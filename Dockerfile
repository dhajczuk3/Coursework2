# Użyj oficjalnego obrazu Node.js jako obrazu bazowego
FROM node:14

# Ustaw katalog roboczy w kontenerze
WORKDIR /usr/src/app

# Kopiuj plik package.json i package-lock.json (jeśli istnieje)
COPY package*.json ./

# Zainstaluj zależności projektu
RUN npm install

# Kopiuj wszystkie pliki źródłowe aplikacji do katalogu roboczego w kontenerze
COPY . .

# Twoja aplikacja wiąże się z portem 3000, więc będziesz używać instrukcji EXPOSE, aby ten port był mapowany przez demon dockera
EXPOSE 3000

# Definiuj polecenie, które uruchamia aplikację
CMD [ "node", "server.js" ]
