# Use the official Nginx image as a base imageFFROM nginx
FROM nginx 
# Copy the custom Nginx configuration file
COPY nginx.conf /etc/nginx/conf.d/

# Remove the default Nginx welcome page
RUN rm -rf /usr/share/nginx/html/*

# Copy the compiled Angular app into the Nginx web root directory
COPY dist/* /usr/share/nginx/html/
COPY nginx.key /etc/nginx/
COPY nginx-bundle.crt /etc/nginx/
COPY assistrip.com.chained.crt /etc/nginx/

# Expose port 80 for incoming HTTP traffic
EXPOSE 80
EXPOSE 443

# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]
