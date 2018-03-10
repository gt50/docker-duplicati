FROM centos:7

RUN yum update -y
#RUN yum install -y yum-utils wget epel-release htop
RUN yum install -y wget epel-release htop
RUN rpm --import "http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF"
RUN curl https://download.mono-project.com/repo/centos7-stable.repo | tee /etc/yum.repos.d/mono-centos7-stable.repo
#RUN yum install -y mono-devel libappindicator-sharp desktop-file-utils
#RUN wget https://github.com/duplicati/duplicati/releases/download/v2.0.2.21-2.0.2.21_canary_2018-03-06/duplicati-2.0.2.21-2.0.2.21_canary_20180306.noarch.rpm && rpm -ihv duplicati-2.0.2.21-2.0.2.21_canary_20180306.noarch.rpm \
RUN wget https://github.com/duplicati/duplicati/releases/download/v2.0.2.21-2.0.2.21_canary_2018-03-06/duplicati-2.0.2.21-2.0.2.21_canary_20180306.noarch.rpm \
    && yum --nogpgcheck localinstall -y duplicati-2.0.2.21-2.0.2.21_canary_20180306.noarch.rpm \
    && rm -f duplicati-2.0.2.21-2.0.2.21_canary_20180306.noarch.rpm

EXPOSE 80

CMD /usr/bin/mono /usr/lib/duplicati/Duplicati.Server.exe --webservice-interface=any
