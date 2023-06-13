FROM debian:12-slim as temp
# ngrok v2.3.35 https://dl.equinox.io/ngrok/ngrok/stable
ADD https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.deb .
RUN dpkg --install ngrok-stable-linux-amd64.deb

FROM debian:12-slim
COPY --from=temp /usr/local/bin/ngrok /usr/local/bin/ngrok
RUN adduser --system ngrok
USER ngrok
WORKDIR /home/ngrok
# use config default location: $HOME/.ngrok2/ngrok.yml
COPY ngrok.yml .ngrok2/ngrok.yml
ENTRYPOINT ["ngrok"]
