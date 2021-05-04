FROM golang:alpine as builder

WORKDIR /go/src
ENV PATH="/go/bin:${PATH}"

COPY ./src/ .

RUN CGO_ENABLED=0 go build -o /src main.go

FROM scratch

COPY --from=builder /src /src

CMD ["/src"]