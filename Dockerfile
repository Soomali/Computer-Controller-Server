FROM dart as dart_env
LABEL "app"="Computer-Controller-Server"

run mkdir Computer-Controller-Server
WORKDIR "/Computer-Controller-Server"
COPY Computer-Controller-Server .
RUN dart pub get
RUN dart compile exe ./bin/server.dart 

FROM ubuntu
RUN mkdir server
WORKDIR "/server"
COPY --from=dart_env /Computer-Controller-Server/bin/server.exe server.exe
ENTRYPOINT ["./server.exe"]
