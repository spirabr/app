FROM fluttersdk/fluttersdk

WORKDIR /usr/src/app

COPY . .

RUN flutter build android

RUN mv ./build/app/outputs/apk/release/app-release.apk ./spira-app.apk
