FROM quay.io/keycloak/keycloak:latest as builder

ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true

ENV KC_DB=postgres

WORKDIR /opt/keycloak
RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:latest
COPY --from=builder /opt/keycloak/ /opt/keycloak/
ENV KC_DB=postgres
ENV KC_DB_URL=jdbc:postgresql://dpg-ch40cqceooglumafuprg-a.oregon-postgres.render.com:5432/vkr
ENV KC_DB_USERNAME=admin
ENV KC_DB_PASSWORD=eZCAyLE6dF2GONySsK6jrmeEAJlWM5dN
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev"]