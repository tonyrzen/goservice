FROM golang:1.20-alpine3.17 AS build

WORKDIR /app

# Download all Go modules into the working directory
COPY go.mod go.sum ./
RUN go mod download

# Copy all files over
COPY . ./

RUN CGO_ENABLED=0 GOOS=linux go build -o ./server ./cmd/goservice/main.go

# Create a 2nd state that just copys over the server
FROM golang:1.20-alpine3.17 AS application

WORKDIR /app

COPY --from=build /app/server ./

ENV GO_ENV=production
ENV ADDRESS=0.0.0.0
ENV PORT=5150

EXPOSE 5150

# Run
ENTRYPOINT ["/app/server"]