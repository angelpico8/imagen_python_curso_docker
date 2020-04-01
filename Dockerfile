FROM ubuntu
RUN apt-get update
RUN apt-get install -y python
RUN echo 1.0 >> /etc/version && apt-get install -y git \ 
&& apt-get install -y iputils-ping
RUN mkdir /datos
WORKDIR /datos
RUN touch prueba.txt
COPY index.html . 
ADD index.tar .
ENV dir=data dir1=data1
RUN mkdir $dir && mkdir $dir1
#ARG dir2
#RUN mkdir dir2
#ARG user
#ENV user_docker $user
#ADD adduser.sh /datos
#RUN /datos/adduser.sh
RUN apt-get install -y apache2
EXPOSE 80
ADD entrypoint.sh /datos
CMD /datos/entrypoint.sh
ADD /paginas /var/www/html
VOLUME ["/var/www/html"]
#ENTRYPOINT ["/bin/bash"]

