FROM jboss/keycloak:16.1.1
EXPOSE 8080
EXPOSE 8443

ENTRYPOINT ["/opt/jboss/keycloak/bin/standalone.sh"]