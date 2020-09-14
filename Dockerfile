FROM ruby:2.6
ARG UNAME=app
ARG UID=1000
ARG GID=1000

RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends nodejs
RUN gem install bundler

RUN groupadd -g $GID -o $UNAME
RUN useradd -m -d /usr/src/app -u $UID -g $GID -o -s /bin/bash $UNAME
RUN mkdir -p /gems && chown $UID:$GID /gems

USER $UNAME
COPY --chown=$UID:$GID Gemfile* /usr/src/app/

ENV RAILS_ENV development
ENV BUNDLE_PATH /gems

# This isn't used in production.
ENV SECRET_KEY_BASE a11111111

WORKDIR /usr/src/app
RUN bundle config
RUN bundle install

COPY --chown=$UID:$GID . /usr/src/app

RUN if [ -f /tmp/pids/server.pid ]; then rm /tmp/pids/server.pid; fi

CMD ["bin/rails", "s", "-b", "0.0.0.0"]
