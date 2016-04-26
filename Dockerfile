FROM fedora:23
MAINTAINER Emory Merryman
ENV LUSER emory
RUN dnf update --assumeyes && dnf install --assumeyes curl java emacs && dnf update --assumeyes && dnf clean all
RUN curl --output /usr/local/bin/lein https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein && chmod 0555 /usr/local/bin/lein && /usr/local/bin/lein
RUN useradd emory
USER ${LUSER}
CMD /usr/bin/emacs
