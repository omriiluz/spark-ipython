FROM omriiluz/spark-base:1.3.1
MAINTAINER omri@iluz.net

# Install Anaconda
RUN apt-get update && apt-get install -y wget bzip2 ca-certificates
RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget --quiet https://repo.continuum.io/archive/Anaconda-2.2.0-Linux-x86_64.sh && \
    /bin/bash /Anaconda-2.2.0-Linux-x86_64.sh -b -p /opt/conda && \
    rm /Anaconda-2.2.0-Linux-x86_64.sh && \
    /opt/conda/bin/conda install --yes conda==3.10.1

# Install Ipython notebook
RUN conda update ipython ipython-notebook

EXPOSE 8888

ADD run.sh /root/

ENTRYPOINT ["/root/run.sh"]