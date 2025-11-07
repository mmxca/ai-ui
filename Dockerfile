FROM nginx:alpine

# Set default environment variables
ENV OPENAI_URL="" \
    OPENAI_TOKEN="" \
    OPENAI_MODEL="gpt-3.5-turbo" \
    PORT=8080

# Copy nginx configuration template
# The nginx:alpine image automatically processes templates in /etc/nginx/templates/
COPY nginx.conf.template /etc/nginx/templates/default.conf.template

# Copy static files
COPY index.html /usr/share/nginx/html/

# Expose the default port (can be overridden with PORT env var)
EXPOSE 8080

# Start nginx (the entrypoint will process templates automatically)
CMD ["nginx", "-g", "daemon off;"]
