FROM nginx:1.21.3
RUN rm /etc/nginx/conf.d/default.conf
COPY docker/nginx/local/mase.conf /etc/nginx/conf.d/mase.conf

RUN mkdir /mase
ADD ./ /mase

EXPOSE 80
STOPSIGNAL SIGQUIT
CMD ["nginx", "-g", "daemon off;"]