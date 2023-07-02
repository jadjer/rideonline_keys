FROM python

ARG BUILD_DATE
ARG GITHUB_SHA

ENV BUILD_DATE=$BUILD_DATE
ENV GITHUB_SHA=$GITHUB_SHA

ENV BASE_PATH="/app"
ENV KEY_PATH="/keys"

RUN mkdir -p $BASE_PATH
COPY generate_keys.sh $BASE_PATH

RUN mkdir -p $KEY_PATH
VOLUME $KEY_PATH

WORKDIR $BASE_PATH

ENTRYPOINT ["sh", "generate_keys.sh", "/keys", "private_key.pem", "public_key.pem"]

CMD ["ls", "-la"]
