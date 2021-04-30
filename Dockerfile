FROM ruby:2.7.2
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn chromium-driver 
RUN mkdir /insta_clone5
WORKDIR /insta_clone5
COPY Gemfile /insta_clone5/Gemfile
COPY Gemfile.lock /insta_clone5/Gemfile.lock
RUN gem install bundler
RUN bundle install
COPY . /insta_clone5
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
