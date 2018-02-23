FROM microsoft/dotnet

# https://github.com/mono/docker/blob/master/5.8.0.108/slim/Dockerfile

ENV MONO_VERSION 5.8.0.108

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF

RUN echo "deb http://download.mono-project.com/repo/debian strech/snapshots/$MONO_VERSION main" > /etc/apt/sources.list.d/mono-official.list \
  && apt-get update \
  && apt-get install -y mono-runtime \
  && rm -rf /var/lib/apt/lists/* /tmp/*

# https://github.com/mono/docker/blob/master/5.8.0.108/Dockerfile

RUN apt-get update \
  && apt-get install -y binutils curl mono-devel ca-certificates-mono fsharp mono-vbnc nuget referenceassemblies-pcl \
  && rm -rf /var/lib/apt/lists/* /tmp/*

# https://github.com/ggirou/nuget/blob/master/Dockerfile

RUN mozroots --import --sync \
  && nuget update -self \
  && rm -rf /root/.config /root/.local /tmp/*
