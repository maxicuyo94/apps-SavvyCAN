FROM ubuntu:22.04

# Instala dependencias para cross-compilación y Qt
RUN apt-get update && \
    apt-get install -y mingw-w64 qtbase5-dev qt5-qmake build-essential

WORKDIR /build

COPY . /build

# Configura qmake para usar el compilador de Windows (mingw-w64)
RUN qmake -spec win32-g++ SavvyCAN.pro

# Compila el proyecto para Windows
RUN make

# El ejecutable estará en /build/SavvyCAN.exe (o similar)
