FROM alpine:latest
RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk update && apk add --no-cache zsh ttyd openssh htop curl git vim mariadb-client mtr speedtest-cli duf jq gping dog
RUN yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
EXPOSE 8080
WORKDIR /home
ENTRYPOINT [ "ttyd", "-i", "0.0.0.0", "-p", "8080", "--writable", "zsh" ]
