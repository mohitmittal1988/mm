# Use the official Jekyll base image
FROM jekyll/jekyll:latest

# Set the working directory inside the container
WORKDIR /srv/jekyll

# Copy Gemfile and Gemfile.lock first to leverage Docker's build cache.
# This makes subsequent builds faster if these files haven't changed.
COPY Gemfile Gemfile.lock ./

# Temporarily switch to the root user to run `bundle install`
# This is necessary because the default 'jekyll' user doesn't have permissions to write to Gemfile.lock
USER root

# Install Jekyll dependencies
RUN chmod -R 777 /srv/jekyll

RUN bundle install

# Copy the rest of the site files to the container
COPY . .

# Switch back to the non-root 'jekyll' user for security best practices
USER jekyll

# Expose port 4000 for web traffic
EXPOSE 4000

# Start Jekyll server when the container runs
# The `--host 0.0.0.0` is essential for accessing the site from your host machine
CMD ["jekyll", "serve", "--host", "0.0.0.0"]
