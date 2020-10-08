FROM debian:buster

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

ENV PKG="bash-completion curl dnsutils git imagemagick jq locales mariadb-client postgresql-client rsync tree unzip vim wget zip"
ENV PHP_PKG="php-cli php-curl php-gd php-imagick php-imap php-mbstring php-memcached php-mysql php-pgsql php-soap php-sqlite3 php-xml php-zip"
ENV DEBIAN_FRONTEND=noninteractive
ENV COMPOSER_ALLOW_SUPERUSER 1

RUN apt-get update && apt-get -y install $PKG $PHP_PKG \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/library-scripts \
    #
    # composer
    && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');" \
    && mv composer.phar /usr/local/bin/composer \
    #
    # nodejs install
    && curl -sL https://deb.nodesource.com/setup_12.x | bash - \
    && apt-get install -y nodejs \
    #
    #
    && groupadd --gid $USER_GID $USERNAME \
    && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

