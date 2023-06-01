# Use a Ruby base image with the desired version
FROM ruby:3.0-alpine3.16

RUN apk add --update build-base bash bash-completion libffi-dev tzdata postgresql-client postgresql-dev nodejs npm yarn

# Set the working directory inside the container
WORKDIR /backend

# Copy the Gemfile and Gemfile.lock to the container
COPY Gemfile Gemfile.lock ./

# Install dependencies
RUN bundle install

# Copy the rest of the application code to the container
COPY . .

# Set environment variables
ENV RAILS_ENV=development
ENV RAILS_SERVE_STATIC_FILES=true

# Expose the port the application will run on
EXPOSE 3000

# Start the Rails server
CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]
