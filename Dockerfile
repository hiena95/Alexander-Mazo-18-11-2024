# Usar la imagen base de nginx (con Debian)
FROM nginx:latest

# Crear carpeta personal en la raíz del sistema
RUN mkdir -p /AlexanderMazo-2772878

# Asignar permisos necesarios para la carpeta
RUN chmod 777 /AlexanderMazo-2772878

# Copiar una imagen de recursos a la carpeta personal
COPY ./recursos/img2.jpg /AlexanderMazo-2772878/

# Copiar el script main.sh a la carpeta personal
COPY main.sh /AlexanderMazo-2772878/

# Convertir el script main.sh a formato Unix (LF) usando sed y asignar permisos de ejecución
RUN sed -i 's/\r//' /AlexanderMazo-2772878/main.sh && chmod +x /AlexanderMazo-2772878/main.sh

# Copiar los archivos del portal web al directorio raíz de Nginx
COPY portal-web/ /usr/share/nginx/html/

# Comando para ejecutar el script y luego iniciar Nginx
CMD ["/bin/bash", "-c", "/AlexanderMazo-2772878/main.sh && nginx -g 'daemon off;'"]
