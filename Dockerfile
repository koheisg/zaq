FROM ruby:2.6.5-alpine3.10 as base

ENV TZ=Asia/Tokyo \
    LANG=C.UTF-8 \
    ROOT_PATH=/magi \
    IMAGE_MAGICK_ETC_PATH=/etc/ImageMagick-6 \
    BUNDLE_JOBS=4

RUN apk update && \
    apk upgrade && \
    apk add --update --no-cache \
    git \
    mysql-dev \
    nodejs \
    nodejs-npm \
    tzdata \
    build-base \
    curl-dev \
    linux-headers \
    libxml2-dev \
    imagemagick

RUN npm install -g yarn
RUN mkdir $ROOT_PATH
WORKDIR $ROOT_PATH

FROM base as builder
LABEL magi-stage=builder

ARG RAILS_ENV
ARG BUNDLE_WITHOUT

ADD Gemfile Gemfile.lock package.json yarn.lock Rakefile tsconfig.json .eslintrc.json babel.config.js $ROOT_PATH/
RUN yarn install && bundle install

ADD app/assets $ROOT_PATH/app/assets
ADD app/models $ROOT_PATH/app/models
ADD vendor $ROOT_PATH/vendor
ADD bin $ROOT_PATH/bin
ADD lib $ROOT_PATH/lib
ADD config $ROOT_PATH/config
ARG SECRET_KEY_BASE=DUMMY_SECRET_KEY
RUN bundle exec rails assets:precompile

ADD frontend $ROOT_PATH/frontend
RUN bin/webpack

FROM base

ADD . $ROOT_PATH

COPY --from=builder /usr/local/bundle /usr/local/bundle
COPY --from=builder $ROOT_PATH/public/assets $ROOT_PATH/public/assets
COPY --from=builder $ROOT_PATH/public/packs $ROOT_PATH/public/packs

# FIXME MAGI-909
RUN touch public/assets/jirafficon.woff2
RUN touch public/assets/jirafficon.woff
