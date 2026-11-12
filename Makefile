.PHONY: check fmt race

# Run before every commit.
check:
	@out="$$(gofmt -l .)"; if [ -n "$$out" ]; then echo "gofmt needed on:"; echo "$$out"; exit 1; fi
	go vet ./...
	go test ./...

# Race detector on the concurrent packages.
race:
	go test -race ./internal/limiter/... ./internal/controller/... ./internal/retry/...

fmt:
	gofmt -w .