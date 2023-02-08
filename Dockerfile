FROM dart
LABEL "app"="Computer-Controller-Server"

run mkdir Computer-Controller-Server
WORKDIR "/Computer-Controller-Server"
COPY Computer-Controller-Server .
RUN dart pub get
EXPOSE 8080/tcp

CMD ["dart","bin/server.dart"] 
