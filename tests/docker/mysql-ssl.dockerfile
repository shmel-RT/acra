FROM mysql:5.7.25

# Original init script expects empty /var/lib/mysql so we initially place
# certificates to the intermediate directory
COPY tests/ssl/mysql/mysql.crt /tmp.ssl/
COPY tests/ssl/mysql/mysql.key /tmp.ssl/
COPY tests/ssl/ca/ca.crt /tmp.ssl/ca.crt
RUN chown -R mysql:mysql /tmp.ssl

COPY docker/scripts/mysql/mariadb-ssl.cnf /etc/mysql/mysql.conf.d/
