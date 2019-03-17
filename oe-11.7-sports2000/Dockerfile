FROM oe-11.7.2-db

LABEL maintainer="Bronco Oostermeyer (dev@bfv.io)"

EXPOSE 10000-10010

WORKDIR /app/db

CMD ["proserve", "-db", "/app/db/sports2000", "-S", "10000", "-minport", "10001", "-maxport", "10010", "-pf /app/db/db.pf"]
