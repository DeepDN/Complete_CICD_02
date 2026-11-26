FROM node:22.alpine

WORKDIR /app

COPY package* /app 

RUN npm install --global

COPY . .

EXPOSE 3000

CMD ["npm", "start"]

