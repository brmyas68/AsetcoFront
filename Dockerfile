FROM node:latest 
RUN apt update -y
RUN apt install nano
RUN apt install curl vim net-tools git build-essential -y 
# RUN curl -sL https://deb.nodesource.com/setup_14.x | bash 
# RUN apt install nodejs -y
# RUN node -v
# RUN npm -v
# # install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt update -y
RUN apt install yarn -y
WORKDIR /app
COPY package*.json yarn.lock /app/
RUN touch .env
RUN echo NEXT_PUBLIC_UC_API=https://uc.asetcoyadak.com/api >> .env
RUN echo NEXT_PUBLIC_WCS_HOST=https://web.asetcoyadak.com/api >> .env
RUN echo NEXT_PUBLIC_GOD_FTP_SERVER=http://107.181.112.145/ >> .env
#RUN echo NEXT_PUBLIC_DASHBOARD_URL=https://web.homacall.com >> .env
RUN echo NEXT_PUBLIC_GA_MEASUREMENT_ID=G-N4GCLZCKXJ >> .env
# # install repository
RUN yarn install
COPY . .
RUN yarn build
EXPOSE 3000
CMD ["yarn", "start"]


