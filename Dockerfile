# Let's use the base Ruby 2.2 image
FROM docker-registry.in.jqdev.net/hooroo-base-ruby-2.2.3

# Copy over the Gemfile and bundle install
WORKDIR /application
COPY Gemfile* /application/
RUN bundle install

# Ignore me
ENV BUILDBOX_AGENT_UID=511
ENV BUILDBOX_AGENT_GID=511

# Install Roo
RUN wget https://github.com/outlaw/roo/releases/download/0.0.0-alpha/roo-linux.tar.gz && \
    tar xvf roo-linux.tar.gz && \
    rm -rf roo-linux.tar.gz && \
    mv roo-linux /usr/bin/roo

# Copy the rest of the code in
COPY . /application


# Expose the port we want to run on
ENV PORT=8080
EXPOSE 8080
CMD bundle exec foreman start
