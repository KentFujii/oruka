FROM ruby:3.0.3-slim AS ruby

RUN gem update bundler

FROM openjdk:8-jre-slim

COPY --from=ruby /usr/local/bin/ /usr/local/bin/
COPY --from=ruby /usr/local/lib/ /usr/local/lib/
COPY --from=ruby /usr/local/etc/ /usr/local/etc/
COPY --from=ruby /usr/local/include/ /usr/local/include/
COPY --from=ruby /usr/local/bundle /usr/local/bundle

# init
ENV LANG="C.UTF-8" \
    TZ="Asia/Tokyo" \
    GEM_HOME="/usr/local/bundle" \
    BUNDLE_APP_CONFIG="/usr/local/bundle" \
    BUNDLE_SILENCE_ROOT_WARNING="1" \
    BUNDLE_GEMFILE="/usr/src/oruka/Gemfile" \
    RUBYLIB="/usr/src/oruka" \
    EMBULK_VERSION="0.9.23"

## dependencies
RUN apt-get update && apt-get install -y \
  curl \
  build-essential \
  git \
  libyaml-dev \
  libssl-dev \
  libreadline-dev \
  default-libmysqlclient-dev \
  zlib1g-dev \
  jlha-utils \
  && apt-get clean

# embulk
RUN curl -o /usr/local/bin/embulk.jar --create-dirs -L "https://dl.embulk.org/embulk-${EMBULK_VERSION}.jar" \
    && chmod +x /usr/local/bin/embulk.jar \
    && java -jar /usr/local/bin/embulk.jar gem install embulk-filter-column \
    && java -jar /usr/local/bin/embulk.jar gem install embulk-filter-row

WORKDIR /usr/src/oruka

ADD . .

RUN bin/setup