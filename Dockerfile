FROM golang:1.17.3-buster as golang-builder-base

WORKDIR /src

COPY go.* ./
RUN go mod download 

# --- 

FROM golang-builder-base as golang-builder

WORKDIR /app

ENV CGO_ENABLED=1

COPY go.* ./
COPY *.go ./

RUN --mount=type=cache,target=/root/.cache/go-build go build -o run -ldflags " -a -s -w -extldflags '-static'"

# --- 

FROM chaunceyshannon/cicd-tools:1.0.0 as upx-builder

ARG BIN_NAME=run

WORKDIR /app

COPY --from=golang-builder /app/${BIN_NAME} ./

RUN upx -9 ${BIN_NAME}

# --- 

# FROM gcr.io/distroless/static-debian11
# FROM scratch AS final
FROM gcr.io/distroless/static

WORKDIR /app

COPY --from=upx-builder /app/run /bin/run

ENTRYPOINT ["/bin/run"]